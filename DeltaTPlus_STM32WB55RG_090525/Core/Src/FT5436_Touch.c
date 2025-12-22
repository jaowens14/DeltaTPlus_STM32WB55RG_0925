#include <FT5436_Touch.h>
#include "lvgl.h"
#include "i2c.h"
/***************************************************************************************
** Function name:           Touch_FT5436_Init
** Description:             Initialize the touch controller structure
***************************************************************************************/
void Touch_FT5436_Init(Touch_FT5436_t *touch, I2C_HandleTypeDef *hi2c)
{
    touch->hi2c = hi2c;
    touch->detected = false;
    touch->margin = 5;
    touch->pointCount = 0;
    touch->lastPointCount = 0;
    touch->released = 0;
    touch->readToggle = true;
    touch->maxPoints = 5;

    // Initialize all points to invalid positions
    for (uint8_t i = 0; i < CFG_MAX_TOUCH_POINTS; i++)
    {
        touch->pointX[i] = -1;
        touch->pointY[i] = -1;
        touch->lastPointX[i] = -1;
        touch->lastPointY[i] = -1;
    }
}

/***************************************************************************************
** Function name:           Touch_FT5436_Begin
** Description:             Initialize with pins (optional interrupt and reset pins)
***************************************************************************************/
void Touch_FT5436_Begin(Touch_FT5436_t *touch, GPIO_TypeDef *int_port, uint16_t int_pin,
                        GPIO_TypeDef *rst_port, uint16_t rst_pin)
{

    touch->int_port = int_port;
    touch->int_pin = int_pin;
    touch->rst_port = rst_port;
    touch->rst_pin = rst_pin;

    // Reset the controller if reset pin is provided
    if (rst_port != NULL)
    {
        HAL_GPIO_WritePin(rst_port, rst_pin, GPIO_PIN_RESET);
        HAL_Delay(10);
        HAL_GPIO_WritePin(rst_port, rst_pin, GPIO_PIN_SET);
        HAL_Delay(100);
    }

    // Configure the touch controller
    Touch_FT5436_WriteReg(touch, FT_REG_DEV_MODE, 0x00);
    Touch_FT5436_WriteReg(touch, FT_REG_POINT_RATE, 14);
}

/***************************************************************************************
** Function name:           Touch_FT5436_JitterMargin
** Description:             Jitter allowance for a change in touch position
***************************************************************************************/
int8_t Touch_FT5436_JitterMargin(Touch_FT5436_t *touch, int8_t margin)
{
    if (margin >= 0)
        touch->margin = margin;
    return touch->margin;
}

/***************************************************************************************
** Function name:           Touch_FT5436_MaxPointCount
** Description:             Set/get maximum points (returns last value if count = 0)
***************************************************************************************/
uint8_t Touch_FT5436_MaxPointCount(Touch_FT5436_t *touch, int8_t count)
{
    if (count >= 0 && count <= 5)
        touch->maxPoints = count;
    return touch->maxPoints;
}

/***************************************************************************************
** Function name:           Touch_FT5436_PointDetected
** Description:             If touch detected, read points and return true, else false
***************************************************************************************/
bool Touch_FT5436_PointDetected(Touch_FT5436_t *touch)
{
    bool changed = false;
    static bool first = true;

    // Check if interrupt occurred or if polling mode
    if (touch->int_port == NULL || touch->detected)
    {
        Touch_FT5436_ReadPoints(touch);
        touch->detected = false;
        touch->released = 0;

        if (touch->pointCount < touch->lastPointCount)
        {
            touch->released = touch->lastPointCount - touch->pointCount;
        }

        // Check if positions have changed beyond jitter margin
        for (uint8_t i = 0; i < touch->pointCount; i++)
        {
            if (abs(touch->lastPointX[i] - touch->pointX[i]) > touch->margin ||
                abs(touch->lastPointY[i] - touch->pointY[i]) > touch->margin)
            {
                changed = true;
            }
            // Copy current points to last points
            touch->lastPointX[i] = touch->pointX[i];
            touch->lastPointY[i] = touch->pointY[i];
        }

        // Check if point count has changed
        if (touch->lastPointCount != touch->pointCount)
        {
            changed = true;
        }

        touch->lastPointCount = touch->pointCount;
    }

    // Ignore first reading to ensure lastPoints are properly initialized
    if (first)
    {
        first = false;
        changed = false;
    }

    return changed;
}

/***************************************************************************************
** Function name:           Touch_FT5436_ReleaseCount
** Description:             Return count of touch points released
***************************************************************************************/
uint8_t Touch_FT5436_ReleaseCount(Touch_FT5436_t *touch)
{
    if (touch->released)
    {
        uint8_t r = touch->released;
        touch->released = 0;
        return r;
    }
    return 0;
}

/***************************************************************************************
** Function name:           Touch_FT5436_GetPointCount
** Description:             Get multi-touch point count (0 = none yet or 1-5 touches)
***************************************************************************************/
uint8_t Touch_FT5436_GetPointCount(Touch_FT5436_t *touch)
{
    return touch->pointCount;
}

/***************************************************************************************
** Function name:           Touch_FT5436_GetPointX
** Description:             Get X coordinate of touch point 1-5
***************************************************************************************/
int16_t Touch_FT5436_GetPointX(Touch_FT5436_t *touch, uint8_t point)
{
    if (point > touch->pointCount || point == 0)
        return -1;
    return touch->pointX[point - 1];
}

/***************************************************************************************
** Function name:           Touch_FT5436_GetPointY
** Description:             Get Y coordinate of touch point 1-5
***************************************************************************************/
int16_t Touch_FT5436_GetPointY(Touch_FT5436_t *touch, uint8_t point)
{
    if (point > touch->pointCount || point == 0)
        return -1;
    return touch->pointY[point - 1];
}

/***************************************************************************************
** Function name:           Touch_FT5436_GetGesture
** Description:             Get gesture (not supported by this controller)
***************************************************************************************/
uint8_t Touch_FT5436_GetGesture(Touch_FT5436_t *touch)
{
    // Gesture detection not implemented for this controller
    return 0;
}

/***************************************************************************************
** Function name:           Touch_FT5436_ReadPoints
** Description:             Read the points from the sensor and save them
***************************************************************************************/
void Touch_FT5436_ReadPoints(Touch_FT5436_t *touch)
{
    uint8_t reg_addr = FT_REG_DEV_MODE;
    HAL_StatusTypeDef status;

    // Read touch data from the controller
    status = HAL_I2C_Master_Transmit(touch->hi2c, FT_I2C_ADDR << 1, &reg_addr, 1, FT_I2C_TIMEOUT);
    if (status != HAL_OK)
        return;

    status = HAL_I2C_Master_Receive(touch->hi2c, FT_I2C_ADDR << 1, touch->reg, POINT_READ_BUF, FT_I2C_TIMEOUT);
    if (status != HAL_OK)
        return;

    // Extract point count
    touch->pointCount = touch->reg[FT_TD_STATUS] & FT_MAX_ID;

    // Limit point count to maximum supported
    if (touch->pointCount > 5)
        touch->pointCount = 5;
    if (touch->pointCount > touch->maxPoints)
        touch->pointCount = touch->maxPoints;

    // Extract coordinates for each touch point
    for (uint8_t i = 0; i < CFG_MAX_TOUCH_POINTS; i++)
    {
        uint8_t r = FT_ONE_TCH_LEN * i;
        touch->pointX[i] = ((touch->reg[FT_TOUCH_X_H_POS + r] & 0x0F) << 8) | touch->reg[FT_TOUCH_X_L_POS + r];
        touch->pointY[i] = ((touch->reg[FT_TOUCH_Y_H_POS + r] & 0x0F) << 8) | touch->reg[FT_TOUCH_Y_L_POS + r];
    }
}

/***************************************************************************************
** Function name:           Touch_FT5436_WriteReg
** Description:             Write data to a register on the touch controller
***************************************************************************************/
void Touch_FT5436_WriteReg(Touch_FT5436_t *touch, uint8_t reg, uint8_t val)
{
    uint8_t data[2] = {reg, val};
    HAL_I2C_Master_Transmit(touch->hi2c, FT_I2C_ADDR << 1, data, 2, FT_I2C_TIMEOUT);
}

/***************************************************************************************
** Function name:           Touch_FT5436_IRQHandler
** Description:             Interrupt handler - call this from HAL_GPIO_EXTI_Callback
***************************************************************************************/
void Touch_FT5436_IRQHandler(Touch_FT5436_t *touch, uint16_t GPIO_Pin)
{
    if (GPIO_Pin == touch->int_pin)
    {
        touch->detected = true;
    }
}



void ft5436_setup(void)
{
    // Initialize the touch controller structure
    Touch_FT5436_Init(&touch_controller, &hi2c1);

    // Begin with pin configuration
    // Parameters: interrupt port, interrupt pin, reset port, reset pin
    Touch_FT5436_Begin(&touch_controller,
                       CTP_INT_GPIO_Port, CTP_INT_Pin,                // Interrupt pin (PB1)
                       GPIO_CTP_RESET_GPIO_Port, GPIO_CTP_RESET_Pin); // Reset pin (PB0)

    // Optional: Configure jitter margin and max points
    Touch_FT5436_JitterMargin(&touch_controller, 5);  // 5 pixel jitter margin
    Touch_FT5436_MaxPointCount(&touch_controller, 1); // Only need 1 touch point for LVGL
}


void ft5436_read_touch_points(lv_indev_t *indev, lv_indev_data_t *data)
{
	if (Touch_FT5436_PointDetected(&touch_controller))
	    {
	        uint8_t pointCount = Touch_FT5436_GetPointCount(&touch_controller);

	        if (pointCount > 0)
	        {
	            // Get the first touch point (LVGL uses single point)
	        	touch_controller.x = Touch_FT5436_GetPointX(&touch_controller, 1);
	        	touch_controller.y = Touch_FT5436_GetPointY(&touch_controller, 1);
	        	touch_controller.is_pressed = true;
	        }
	        else
	        {
	        	touch_controller.is_pressed = false;
	        }
	    }
	    else
	    {
	    	touch_controller.is_pressed = false;
	    }

    // Fill in LVGL data structure
    data->point.x = touch_controller.x;
    data->point.y = touch_controller.y;
    data->state = touch_controller.is_pressed ? LV_INDEV_STATE_PRESSED : LV_INDEV_STATE_RELEASED;
}


Touch_FT5436_t touch_controller;





