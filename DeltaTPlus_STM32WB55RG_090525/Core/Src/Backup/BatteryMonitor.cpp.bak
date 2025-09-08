

#include "BatteryMonitor.hpp"

// char *BatteryMonitor::percent = "000.00%";
// char *BatteryMonitor::lastPercent = "000.00%";
// bool BatteryMonitor::newData = false;
bool BatteryMonitor::charging = false;
void BatteryMonitor::setup()
{
    // Wire1.setPins(PERIPHERAL_SDA, PERIPHERAL_SCL);

    while (!max17048.begin(&hi2c1, MAX17048_I2CADDR_DEFAULT))
    {
        // Serial.println(F("Couldnt find Adafruit MAX17048?\nMake sure a battery is plugged in!"));
        HAL_Delay(200);
    }
    // Serial.print(F("Found MAX17048"));
    // Serial.print(F(" with Chip ID: 0x"));
    // Serial.println(max17048.getChipID(), HEX);
    max17048.quickStart();
    // delay(1000);
    // percent = String(int()) + '%';

    // sprintf(percent, "%f", max17048.cellPercent());

    // newData = true;
}

void BatteryMonitor::stateMachine(void)
{

    if (!delay)
    {
        delay = 3; // seconds // ms
        // lastPercent = percent;
        // snprintf(percent, sizeof(usbBuffer), "%f", max17048.cellPercent());
        // newData = (percent != lastPercent);
        charging = (max17048.chargeRate() > 0.0);
        // Serial.println(max17048.chargeRate());

        // snprintf(usbBuffer, sizeof(usbBuffer), "Battery: %f\r\n", max17048.cellPercent());
        // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
    }
}
