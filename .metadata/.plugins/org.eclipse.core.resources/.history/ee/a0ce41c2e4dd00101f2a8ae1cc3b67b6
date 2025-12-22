#include "Touch.hpp"
#include "main.h"
#include "lvgl.h"
#include "FT5436_Touch.h"

int Touch::x = 0;
int Touch::y = 0;
bool Touch::is_pressed = false;

void Touch::setup(void)
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

void Touch::update(void)
{
    // Update touch state - called by LVGL input driver
    if (Touch_FT5436_PointDetected(&touch_controller))
    {
        uint8_t pointCount = Touch_FT5436_GetPointCount(&touch_controller);

        if (pointCount > 0)
        {
            // Get the first touch point (LVGL uses single point)
            x = 240 - Touch_FT5436_GetPointX(&touch_controller, 1);
            y = 320 - Touch_FT5436_GetPointY(&touch_controller, 1);
            is_pressed = true;
        }
        else
        {
            is_pressed = false;
        }
    }
    else
    {
        is_pressed = false;
    }
}

// LVGL input device read callback
void Touch::lvgl_read(lv_indev_t *indev, lv_indev_data_t *data)
{
    // Update touch state
    myTouch.update();

    // Fill in LVGL data structure
    data->point.x = myTouch.x;
    data->point.y = myTouch.y;
    data->state = myTouch.is_pressed ? LV_INDEV_STATE_PRESSED : LV_INDEV_STATE_RELEASED;
}

// Setup LVGL input device
void Touch::setup_lvgl_input(void)
{
    lv_indev_t *indev = lv_indev_create();
    lv_indev_set_type(indev, LV_INDEV_TYPE_POINTER);
    lv_indev_set_read_cb(indev, Touch::lvgl_read);
}

Touch myTouch;
