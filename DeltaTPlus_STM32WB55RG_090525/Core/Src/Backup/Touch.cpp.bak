
#include "Touch.hpp"
#include "main.h"
#include "Screen.hpp"
int Touch::x = 0;
int Touch::y = 0;

void Touch::setup(void)
{

    // Initialize the touch controller structure
    Touch_FT5436_Init(&touch_controller, &hi2c1);

    // Begin with pin configuration
    // Parameters: interrupt port, interrupt pin, reset port, reset pin
    // Use NULL for ports and 0 for pins if not used
    Touch_FT5436_Begin(&touch_controller,
                       NULL, NULL,                                    // Interrupt pin (PB1)
                       GPIO_CTP_RESET_GPIO_Port, GPIO_CTP_RESET_Pin); // Reset pin (PB0)

    // Optional: Configure jitter margin and max points
    Touch_FT5436_JitterMargin(&touch_controller, 5);  // 5 pixel jitter margin
    Touch_FT5436_MaxPointCount(&touch_controller, 5); // Support up to 5 touch points
}

void Touch::stateMachine(void)
{
    // if (!delay)
    //{

    if (Touch_FT5436_PointDetected(&touch_controller))
    {
        uint8_t pointCount = Touch_FT5436_GetPointCount(&touch_controller);

        if (pointCount > 0)
        {
            // Process touch points
            for (uint8_t i = 1; i <= pointCount; i++)
            {
                x = 240 - Touch_FT5436_GetPointX(&touch_controller, i);
                y = 320 - Touch_FT5436_GetPointY(&touch_controller, i);

                if (x >= 0 && y >= 0)
                {

                    snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "Touch point %d: X=%d, Y=%d\r\n", i, x, y);
                    HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

                    // Add your touch handling code here
                    // For example:
                    // - Update UI elements
                    // - Trigger button actions
                    // - Draw on screen
                }
            }
        }

        // Check for released touch points
        uint8_t released = Touch_FT5436_ReleaseCount(&touch_controller);
        if (released > 0)
        {
            printf("%d touch points released\n", released);
            // Handle touch release events here
        }
    }
    // delay = 5;
    //}
}
