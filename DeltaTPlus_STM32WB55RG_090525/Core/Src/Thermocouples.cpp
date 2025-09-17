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

    // Sample Speed Setting (Full Power Sinc3 Filter Mode)
    //  FW  |  SPS  |  SPS/Ch
    //  600 |    6  |     1
    //  100 |   60  |    10
    //   40 |  156  |    26
    //   20 |  300  |    50
    filterWord = 1;

    int state = thermocoupleADC.begin(0);
    while (state < 0)
    {
        HAL_Delay(100);
        state = thermocoupleADC.begin(0);
    }

    // AD7124 Thermocouple Configuration
    // Channel 0: Thermocouple 1 (AIN0+/AIN1-)
    // Channel 1: Thermocouple 2 (AIN2+/AIN3-)
    // Channel 2: Thermistor for cold junction (AIN5+/AIN6-)

    // ADC Control: Continuous Mode, Full Power, Internal Reference enabled
    thermocoupleADC.setAdcControl(Ad7124::ContinuousMode, Ad7124::FullPower, true);

    // Configure Setup 0 for Thermocouples
    // High gain (128) with internal reference for maximum sensitivity to µV signals
    thermocoupleADC.setConfig(0, Ad7124::RefInternal, Ad7124::Pga128, true);
    thermocoupleADC.setConfigFilter(0, Ad7124::Sinc3FastFilter, filterWord);

    // Configure Channel 0: Thermocouple 1 (AIN0+/AIN1-) using Setup 0
    thermocoupleADC.setChannel(0, 0, Ad7124::AIN0Input, Ad7124::AIN1Input, true);

    // Configure Channel 1: Thermocouple 2 (AIN2+/AIN3-) using Setup 0
    thermocoupleADC.setChannel(1, 0, Ad7124::AIN2Input, Ad7124::AIN3Input, true);

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

    if (thermocoupleADC.isConversionReady())
    {

        // thermocoupleADC.waitEndOfConversion(500);
        rawData = thermocoupleADC.getData();
        channel = thermocoupleADC.currentChannel();

        if (channel == 0)
        {
            raw[channel] = rawData;
            voltage[channel] = Ad7124Chip::toVoltage(raw[channel], 128, 2.5, true);
            temperature[channel] = voltage[channel] * 24390.2439 * 10;
        }

        if (channel == 1)
        {
            raw[channel] = rawData;
            voltage[channel] = Ad7124Chip::toVoltage(raw[channel], 128, 2.5, true);
            temperature[channel] = voltage[channel] * 24390.2439 * 10;
        }

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

        deltaTemp = (temperature[0] - temperature[1]);

        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "Delta Temp: %f\r\n", deltaTemp);
        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "Channel 0: %f      Channel 1: %f\r\n", temperature[0], temperature[1]);
        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);
    }
}
