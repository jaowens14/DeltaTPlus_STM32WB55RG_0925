#include "Accelerometer.hpp"
#include "Backlight.hpp"
#include "main.h"

Accelerometer::States Accelerometer::state;

void Accelerometer::setup(void)
{
    // pinMode(0, OUTPUT);
    state = AWAKE;
    delay = 1;
    readAccelerometer();
}

void Accelerometer::stateMachine(void)
{
    if (!readDelay)
    {
        readAccelerometer();

        //        snprintf(usbBuffer, sizeof(usbBuffer), "Acceleration: %ld, %d\r\n", acceleration, delay);
        //        CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
        //        snprintf(usbBuffer, sizeof(usbBuffer), "State: %d \r\n", state);
        //        CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
        readDelay = 2;
    }

    switch (state)
    {

    case AWAKE:

        // while we are awake
        // 2. if below threshold && timer is up -> idle
        // 3. if above threshold do nothing
        if (acceleration < activityThreshold && !delay)
        {
            delay = 1; // seconds
            // snprintf(usbBuffer, sizeof(usbBuffer), "AWAKE -> IDLE\r\n");
            // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
            state = IDLE;
            Backlight::state = Backlight::States::LOW;
        }
        break;
    case IDLE:
        // while we are idle
        // 1. if below threshold && timer is up -> sleep
        // 2. if above threshold && timer is up-> awake
        if (acceleration > activityThreshold && !delay)
        {
            delay = 1; // seconds

            state = AWAKE;
            Backlight::state = Backlight::States::HIGH;

            // snprintf(usbBuffer, sizeof(usbBuffer), "IDLE -> AWAKE\r\n");
            // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
        }

        if (acceleration < activityThreshold && !delay)
        {
            delay = 1; // seconds

            state = SLEEP;

            Backlight::state = Backlight::States::OFF;

            // snprintf(usbBuffer, sizeof(usbBuffer), "IDLE -> SLEEP\r\n");
            // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
        }

        break;
    case SLEEP:
        // while we are a sleep
        //  1. if above threshold and timer is up -> awake
        //  2. if below threshold do nothing
        if (acceleration > activityThreshold && !delay)
        {
            delay = 1; // seconds

            state = AWAKE;
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
        // Convert raw data to signed values
        int16_t x = (int16_t)((accdata[1] << 8) | accdata[0]);
        int16_t y = (int16_t)((accdata[3] << 8) | accdata[2]);
        // int8_t z = ((accdata[5] << 8) | accdata[4]);

        // use mean of x and y
        acceleration = (x + y) / 2;

        // Convert to g-force (assuming ±2g range, 10-bit resolution)
        // float x_g = x * 0.0039f; // 4mg/LSB
        // float y_g = y * 0.0039f;
        // float z_g = z * 0.0039f;

        snprintf((char*)UART_BUFFER, sizeof(UART_BUFFER), "X: %.2fg, Y: %.2fg\r\n", x, y);

        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char*)UART_BUFFER), 300);
    }
}
