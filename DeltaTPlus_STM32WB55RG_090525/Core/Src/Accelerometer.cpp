#include "Accelerometer.hpp"
#include "Backlight.hpp"
#include "main.h"

Accelerometer::States Accelerometer::state;

void Accelerometer::setup(void)
{
    // pinMode(0, OUTPUT);
    state = AWAKE;
    delay = 1; // seconds?
    readAccelerometer();
}

void Accelerometer::stateMachine(void)
{
    if (!readDelay)
    {
        readAccelerometer();

        readDelay = 10; // 10ms so 100ms
    }

    switch (state)
    {

    case AWAKE:

        if (acceleration < activityThreshold && !delay)
        {
            delay = 3; // seconds

            state = SLEEP;
            Backlight::state = Backlight::States::LOW;
        }
        break;

    case SLEEP:
        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "SLEEP");
        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

        if (acceleration > activityThreshold && !delay)
        {
            delay = 10; // seconds

            state = AWAKE;
            Backlight::state = Backlight::States::HIGH;

            // snprintf(usbBuffer, sizeof(usbBuffer), "SLEEP -> AWAKE\r\n");
            // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
        }

        break;
    default:
        break;
    }
}

void Accelerometer::readAccelerometer(void)
{
    // Set MEASURE bit (Bit 3) to enable measurement mode
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, 0x2D, I2C_MEMADD_SIZE_8BIT, &powerCtl, 1, 1000);

    // Read with error handling
    HAL_StatusTypeDef status = HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, accreg, I2C_MEMADD_SIZE_8BIT, accdata, 6, 1000);

    if (status == HAL_OK)
    {

        int16_t x = (int16_t)((accdata[1] << 8) | accdata[0]);
        int16_t y = (int16_t)((accdata[3] << 8) | accdata[2]);
        int16_t z = (int16_t)((accdata[5] << 8) | accdata[4]);

        acceleration = (int32_t)x * x + (int32_t)y * y + (int32_t)z * z;

        // int32_t threshold_sq = 262144;

        // if (magnitude_sq > threshold_sq)
        //{
        //     // Acceleration magnitude exceeds threshold
        //     HAL_UART_Transmit(&huart1, (uint8_t *)"Threshold exceeded\r\n", 21, 100);
        // }

        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "Acceleration: %ld\r\n", acceleration);
        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

        // snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "X: %f, Y: %f, Z: %f\r\n", x_g, y_g, z_g);
        // HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "X: %.2d, Y: %.2d\r\n", x, y);
        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
    }
}
