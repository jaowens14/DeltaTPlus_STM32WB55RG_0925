

#include "Switch.hpp"
#include "Thermocouples.hpp"

Switch::States Switch::state;
Switch::States Switch::lastState;

void Switch::setup()
{

    delay = 1;
}

void Switch::stateMachine(void)
{

    switch (state)
    {

    case LOW:

        if (!delay && HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_0))
        {
            state = HIGH;
            delay = 1;
            snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "LOW SETTING --> HIGH SETTING\r\n");
            HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
            Thermocouples::userGain = 2.0;
        }
        break;
    case HIGH:
        if (!delay && !HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_0))
        {
            state = LOW;
            delay = 1;
            snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "HIGH SETTING --> LOW SETTING\r\n");
            HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
            Thermocouples::userGain = 1.0;
        }

        break;

    default:
        break;
    }
}
