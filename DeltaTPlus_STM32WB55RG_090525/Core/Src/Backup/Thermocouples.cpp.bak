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
    // SPI_Set_Mode(1);

    // Re-initialize the SPI handle pointers
    left = Adafruit_MAX31856(&hspi1, GPIOA, GPIO_PIN_9);
    right = Adafruit_MAX31856(&hspi1, GPIOA, GPIO_PIN_8);

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
    left.begin();
    left.setThermocoupleType(MAX31856_TCTYPE_K);
    left.setConversionMode(MAX31856_CONTINUOUS);
    left.setTempFaultThreshholds(0.0, 100.0);

    right.begin();
    right.setThermocoupleType(MAX31856_TCTYPE_K);
    right.setConversionMode(MAX31856_CONTINUOUS);
    right.setTempFaultThreshholds(0.0, 100.0);
    // SPI_Set_Mode(0);
    HAL_Delay(500);

    //// Set to continuous conversion mode
    // HAL_Delay(200);
    // setConversionMode(&tempSensor1, MAX31856_CONTINUOUS);
    // setConversionMode(&tempSensor2, MAX31856_CONTINUOUS);
    //
    // HAL_Delay(200);
    //// Set thermocouple type to K (already default, but explicit)
    // setThermocoupleType(&tempSensor1, MAX31856_TCTYPE_K);
    // setThermocoupleType(&tempSensor2, MAX31856_TCTYPE_K);
    //
    // HAL_Delay(200);

    // Configure noise filter (optional - 50Hz for most regions)
    // setNoiseFilter(&tempSensor, MAX31856_NOISE_FILTER_50HZ);
    // HAL_Delay(200);
    // Set fault thresholds (optional)
    // setTempFaultThresholds(&tempSensor, -200.0f, 1000.0f); // -200°C to 1000°C
    // setColdJunctionFaultThresholds(&tempSensor, -40, 85);   // -40°C to 85°C
}

void Thermocouples::stateMachine(void)
{
    if (!delay)
    {
        // SPI_Set_Mode(1);
        rightRawTemp = (int32_t)right.readThermocoupleTemperature();
        leftRawTemp = (int32_t)left.readThermocoupleTemperature();

        checkFault("------------ Right: ", right.readFault());
        checkFault("------------ Left:  ", left.readFault());
    };
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