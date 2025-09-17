#include "Thermocouples.hpp"
#include "main.h"
// Static member definitions
float Thermocouples::deltaTemp = 0.0;
float Thermocouples::userGain = 0.0;

KALMAN_T rf;
KALMAN_T lf;
// Static member definitions for MAX31856 objects

void Thermocouples::setup()
{

    Ad7124Chip thermocoupleADC;

    long SBraw[7];
    double SBvolt[7];
    long dataWord;
    char statusWord;
    char ch;

    // Sample Speed Setting (Full Power Sinc3 Filter Mode)
    //  FW  |  SPS  |  SPS/Ch
    //  600 |    6  |     1
    //  100 |   60  |    10
    //   40 |  156  |    26
    //   20 |  300  |    50
    int filterWord = 100;

    int state = thermocoupleADC.begin(0);
    while (state < 0)
    {
        // Serial.println(state);
        // Serial.println ("Failed");
        HAL_Delay(100);
        state = thermocoupleADC.begin(0);
    }

    // AD7124 Thermocouple Configuration
    // Channel 0: Thermocouple 1 (AIN0+/AIN1-)
    // Channel 1: Thermocouple 2 (AIN2+/AIN3-)
    // Channel 2: Thermistor for cold junction (AIN5+/AIN6-)

    // ADC Control: Continuous Mode, Full Power, Internal Reference enabled
    thermocoupleADC.setAdcControl(Ad7124::ContinuousMode, Ad7124::FullPower, true);
    // thermocoupleADC.setMode(Ad7124::ContinuousMode);

    // Enable 500µA current source on AIN4 for thermistor excitation
    // thermocoupleADC.setIOControl1(Ad7124::AIN4, Ad7124::Current500uA);
    // thermocoupleADC.setCurrentSource(0, Ad7124::AIN4Input, Ad7124::Current500uA);

    // Configure Setup 0 for Thermocouples
    // High gain (128) with internal reference for maximum sensitivity to µV signals
    thermocoupleADC.setConfig(0, Ad7124::RefInternal, Ad7124::Pga128, true);
    thermocoupleADC.setConfigFilter(0, Ad7124::Sinc4Filter, filterWord); // Use Sinc4 for better noise rejection

    // Configure Setup 1 for Thermistor (Cold Junction Reference)
    // Gain 1 with external reference (precision resistor voltage)
    thermocoupleADC.setConfig(1, Ad7124::RefInternal, Ad7124::Pga1, true);
    thermocoupleADC.setConfigFilter(1, Ad7124::Sinc4Filter, filterWord);

    // Configure Channel 0: Thermocouple 1 (AIN0+/AIN1-) using Setup 0
    thermocoupleADC.setChannel(0, 0, Ad7124::AIN0Input, Ad7124::AIN1Input, true);

    // Configure Channel 1: Thermocouple 2 (AIN2+/AIN3-) using Setup 0
    thermocoupleADC.setChannel(1, 0, Ad7124::AIN2Input, Ad7124::AIN3Input, true);

    // Configure Channel 2: Thermistor (AIN5+/AIN6-) using Setup 1
    // thermocoupleADC.setChannel(2, 1, Ad7124::AIN5Input, Ad7124::AIN6Input, true);

    // Enable only the channels we're using
    thermocoupleADC.enableChannel(0, true);   // Thermocouple 1
    thermocoupleADC.enableChannel(1, true);   // Thermocouple 2
    thermocoupleADC.enableChannel(2, false);  // Disabled Thermistor (cold junction)
    thermocoupleADC.enableChannel(3, false);  // Disabled
    thermocoupleADC.enableChannel(4, false);  // Disabled
    thermocoupleADC.enableChannel(5, false);  // Disabled
    thermocoupleADC.enableChannel(6, false);  // Disabled
    thermocoupleADC.enableChannel(7, false);  // Disabled
    thermocoupleADC.enableChannel(8, false);  // Disabled
    thermocoupleADC.enableChannel(9, false);  // Disabled
    thermocoupleADC.enableChannel(10, false); // Disabled
    thermocoupleADC.enableChannel(11, false); // Disabled
    thermocoupleADC.enableChannel(12, false); // Disabled
    thermocoupleADC.enableChannel(13, false); // Disabled
    thermocoupleADC.enableChannel(14, false); // Disabled
    thermocoupleADC.enableChannel(15, false); // Disabled

    // Allow settling time
    HAL_Delay(100);

    rf.error = 0.0f;
    rf.estimate = 0.0f;
    rf.process_variance = 0.1f;
    rf.measurement_variance = 50.0f;

    lf.error = 0.0f;
    lf.estimate = 0.0f;
    lf.process_variance = 0.1f;
    lf.measurement_variance = 50.0f;

    // diameter = 0.000812f;                // 20 gauge wire diameter, meters
    // length = 0.0254f;                    // 1 inch in meters
    // area = 3.14159f * diameter * length; // surface area in m^2
    // ambientTemp = 20.0f;
    // h = 500;      // W/m^2 * K
    // C = 0.000053; // J /K
    // lastTime = HAL_GetTick();
}

void Thermocouples::stateMachine(void)
{
    if (!delay)
    {

        for (int i = 0; i <= 2; i++) // Only read channels 0,1,2 (you configured 3 channels)
        {
            // thermocoupleADC.waitEndOfConversion(500);
            dataWord = thermocoupleADC.getData();
            ch = thermocoupleADC.currentChannel();

            if (ch >= 0)
            {
                SBraw[ch] = dataWord;

                ////if (ch == 2) // Thermistor channel
                ////{
                ////  SBvolt[ch] = Ad7124Chip::toVoltage(SBraw[ch], 1, 1.0, true);
                ////}
                // else // Thermocouple channels (0, 1)
                //{
                SBvolt[ch] = Ad7124Chip::toVoltage(SBraw[ch], 128, 2.5, true);
                //}
            }

            // if (ch >= 0)
            //{
            //   SBraw[ch + 1] = dataWord; // Library pattern: store raw data with offset
            //
            //  // Calculate voltage based on channel type
            //  if (ch == 2) // Thermistor channel
            //  {
            //    // Use actual reference voltage (1.0V from precision resistor)
            //    SBvolt[ch + 1] = Ad7124Chip::toVoltage(SBraw[ch + 1], 1, 1.0, true);
            //  }
            //  else // Thermocouple channels (0, 1)
            //  {
            //    // Use internal reference (2.5V) with gain 128
            //    SBvolt[ch + 1] = Ad7124Chip::toVoltage(SBraw[ch + 1], 128, 2.5, true);
            //  }
            //}
        }
        char temp_buffer[32]; // Temporary buffer for individual values

        // Start with the "$" marker
        snprintf((char *)UART_BUFFER, 64, "$");

        // Add each voltage reading with comma separator
        for (int i = 0; i <= 3; i++)
        {
            snprintf(temp_buffer, sizeof(temp_buffer), ",%.6f", SBvolt[i]);
            strncat((char *)UART_BUFFER, temp_buffer, sizeof(UART_BUFFER) - strlen((char *)UART_BUFFER) - 1);
        }

        // Add line ending
        strncat((char *)UART_BUFFER, "\r\n", sizeof(UART_BUFFER) - strlen((char *)UART_BUFFER) - 1);

        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
    }

    // SPI_Set_Mode(0);
    //  deltaTemp = deltaTemp + ((rightTemp - leftTemp) - deltaTemp) * 0.9; // leaky integrator with a gain of 0.9
    //  Average two sensors, or use one

    /// currentTime = HAL_GetTick();

    rightTemp = rightRawTemp;
    leftTemp = leftRawTemp;

    rf.measurement = 0.0078125f * (rightTemp); // deg c
    lf.measurement = 0.0078125f * (leftTemp);  // deg c
                                               //
    rf.error = rf.error + rf.process_variance;
    rf.gain = rf.error / (rf.error + rf.measurement_variance);
    rf.estimate = rf.estimate + rf.gain * (rf.measurement - rf.estimate);
    rf.error = (1.0 - rf.gain) * rf.error;
    //
    lf.error = lf.error + lf.process_variance;
    lf.gain = lf.error / (lf.error + lf.measurement_variance);
    lf.estimate = lf.estimate + lf.gain * (lf.measurement - lf.estimate);
    lf.error = (1.0 - lf.gain) * lf.error;

    deltaTemp = (rf.estimate - lf.estimate) * userGain;

    // snprintf(usbBuffer, sizeof(usbBuffer), "LEFT: %f     RIGHT: %f     DELTA: %f \r\n", convertToTemperature(leftRawTemp), convertToTemperature(rightRawTemp), deltaTemp);
    // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));

    // Use %f for float, not %ld
    // snprintf(usbBuffer, sizeof(usbBuffer), "Raw Delta T: %f\r\n", deltaTemp);
    // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
    //
    // snprintf(usbBuffer, sizeof(usbBuffer), "Delta T: %f.2 Deg C\r\n", convertToTemperature(deltaTemp));
    // CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));

    //     snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "Left: %f  Right: %f\r\n", lf.measurement, rf.measurement);
    // HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

    snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "Delta Temp: %f\r\n", deltaTemp);
    HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

    delay = 10; // 50 ms
}

// deg f
float Thermocouples::convertToTemperature(int32_t rawTemp)
{
    // Raw temperature is in units of 0.0078125°C (1/128°C)
    return (rawTemp * 0.0078125f);
}

void Thermocouples::checkFault(char *name, uint8_t fault)
{
    // Clear buffer first
    memset(UART_BUFFER, 0, sizeof(UART_BUFFER));

    // Add the name
    strcat((char *)UART_BUFFER, name);

    if (fault == 0x00)
    {
        strcat((char *)UART_BUFFER, "FAULT_NONE\r\n");
    }
    else
    {
        // Check each fault bit individually for multiple faults
        if (fault & 0x01)
            strcat((char *)UART_BUFFER, "FAULT_CJ_HIGH ");
        if (fault & 0x02)
            strcat((char *)UART_BUFFER, "FAULT_CJ_LOW ");
        if (fault & 0x04)
            strcat((char *)UART_BUFFER, "FAULT_TC_HIGH ");
        if (fault & 0x08)
            strcat((char *)UART_BUFFER, "FAULT_TC_LOW ");
        if (fault & 0x10)
            strcat((char *)UART_BUFFER, "FAULT_OVUV ");
        if (fault & 0x20)
            strcat((char *)UART_BUFFER, "FAULT_OPEN ");
        if (fault & 0x40)
            strcat((char *)UART_BUFFER, "FAULT_CJ_RANGE ");
        if (fault & 0x80)
            strcat((char *)UART_BUFFER, "FAULT_TC_RANGE ");

        strcat((char *)UART_BUFFER, "\r\n");

        // left.begin();
        // right.begin();
    }

    HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
}