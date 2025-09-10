

#include "Switch.hpp"
#include "Thermocouples.hpp"
// char *BatteryMonitor::percent = "000.00%";
// char *BatteryMonitor::lastPercent = "000.00%";
// bool BatteryMonitor::newData = false;
// bool BatteryMonitor::charging = false;
Switch::States Switch::state;

void Switch::setup()
{

    delay = 1;
    // Wire1.setPins(PERIPHERAL_SDA, PERIPHERAL_SCL);

    // while (!max17048.begin(&hi2c1, MAX17048_I2CADDR_DEFAULT))
    //{
    //     // Serial.println(F("Couldnt find Adafruit MAX17048?\nMake sure a battery is plugged in!"));
    //     HAL_Delay(200);
    // }
    //// Serial.print(F("Found MAX17048"));
    //// Serial.print(F(" with Chip ID: 0x"));
    //// Serial.println(max17048.getChipID(), HEX);
    // max17048.quickStart();
    //  delay(1000);
    //  percent = String(int()) + '%';

    // sprintf(percent, "%f", max17048.cellPercent());

    // newData = true;
}

void Switch::stateMachine(void)
{

    switch (state)
    {

    case LOW:
        // snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "LOW");
        // HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

        if (!delay && HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_0))
        {
            state = HIGH;
            delay = 1;
            snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "LOW SETTING --> HIGH SETTING\r\n");
            HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
            Thermocouples::userGain = 150.0;
        }
        break;
    case HIGH:
        if (!delay && !HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_0))
        {
            state = LOW;
            delay = 1;
            snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "HIGH SETTING --> LOW SETTING\r\n");
            HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
            Thermocouples::userGain = 50.0;
        }

        break;

    default:
        break;
    }
}
