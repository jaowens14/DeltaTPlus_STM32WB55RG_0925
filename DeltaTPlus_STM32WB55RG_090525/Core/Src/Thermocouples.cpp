// This reads the thermocouples using an AD7124 ADC chip and processes the data with Kalman filtering

//include pertinent header files
#include "Thermocouples.hpp"
#include "main.h"
#include "widgets.h"
#include "meter.h"

#ifdef USE_SERVER

#include "p2p_server_app.h"

#else // CLIENT

#include "p2p_client_app.h"

#endif

// Define static member variables
float Thermocouples::deltaTemp = 0.0; //deltaTemp stores temperature difference
float Thermocouples::userGain = 1.0; //userGain stores the adjustment value for calibration
//float Thermocouples::scaleFactor = 750000.0;
float scaleFactor = 300000.0;

float Thermocouples::deltaTempOffset = 0.0; //deltaTempOffset stores zero offset correction value
KALMAN_T rf; //right front (rf) thermocouple measurements
KALMAN_T lf; //left front (lf) thermocouple measurements

//Set up flags
volatile int thermocouple_data_ready = 0;
volatile int ad7124_rdy_flag = 0;
volatile int thermocoupleDelay = 0;
int direction = 1;

uint32_t offset;
float sum;
float ave;
int n_samples =0;

bool BIPOLAR = true;
int setup0;



int cal_sum;
int cal_count;

#define CAL_SAMPLES 256

//Set up Function
void Thermocouples::setup()
{

    //HAL_NVIC_DisableIRQ(ADC_DRDY_EXTI_IRQn); // Temporarily disable interrupt

    // Sample Speed Setting (Full Power Sinc3 Filter Mode)
    //  FW  |  SPS  |  SPS/Ch
    //  600 |    6  |     1
    //  100 |   60  |    10
    //   40 |  156  |    26
    //   20 |  300  |    50
	// 100 has worked well
    filterWord = 60;

    int state = thermocoupleADC.begin(0);
    while (state < 0)
    {
        HAL_Delay(100);
        state = thermocoupleADC.begin(0);
    }

    setup0 = 0;
    int setup1 = 1;

    int channel0 = 0;
    int channel1 = 1;



#if 1 // setup from 'putting screws in and sending it'
    // thermocoupleADC.setBiasPins(Ad7124::AIN0Input | Ad7124::AIN2Input);
    //int res3 = thermocoupleADC.reset();

    //printf("res3 %d\r\n", res3);

    HAL_Delay(500);
    // HAL_Delay(200);
    // Configure Setup 0 for Thermocouples
    // High gain (128) with internal reference for maximum sensitivity to µV signals
    thermocoupleADC.setConfig(setup0, Ad7124::RefInternal, Ad7124::Pga128, BIPOLAR);
    thermocoupleADC.setConfigFilter(setup0, Ad7124::Sinc4FastFilter, filterWord);
    if (storage.calibration != 0){
        thermocoupleADC.setConfigOffset(setup0, storage.calibration);
    }

    //thermocoupleADC.setConfig(setup1, Ad7124::RefInternal, Ad7124::Pga1, true);
    //thermocoupleADC.setConfigFilter(setup1, Ad7124::Sinc4FastFilter, filterWord);

    // Configure Channel 0: Thermocouple 1 (AIN0+/AIN1-) using Setup 0
    thermocoupleADC.setChannel(channel0, setup0, Ad7124::AIN2Input, Ad7124::AIN0Input, true);

    // Configure Channel 1: Thermocouple 2 (AIN2+/AIN3-) using Setup 0
    //thermocoupleADC.setChannel(channel1, setup0, Ad7124::AIN2Input, Ad7124::AIN3Input, true);

    // Configure Channel 2: Thermistor (AIN5+/AIN6-) using Setup 1
    // thermocoupleADC.setChannel(channel2, setup1, Ad7124::AIN5Input, Ad7124::AIN6Input, true);
    // HAL_Delay(200);
    //
    // thermocoupleADC.setCurrentSource(0, Ad7124::IoutCh4, Ad7124::Current500uA);

    //thermocoupleADC.setBiasPins(Ad7124::AIN1Input | Ad7124::AIN3Input);
    //thermocoupleADC.setBiasPins(Ad7124::AIN0Input | Ad7124::AIN1Input | Ad7124::AIN2Input | Ad7124::AIN3Input);

    //thermocoupleADC.setBiasPins(Ad7124::AIN0Input | Ad7124::AIN2Input);

    thermocoupleADC.setAdcControl(Ad7124::ContinuousMode, Ad7124::FullPower, true);

     HAL_Delay(200);

     rawData = thermocoupleADC.getData();
     HAL_Delay(200);



    //int res1 = thermocoupleADC.internalCalibration(channel0);
   //int res2 = thermocoupleADC.internalCalibration(channel1);

    HAL_Delay(200);

    // int ch_0_cal = thermocoupleADC.internalCalibration(0);
    // int ch_1_cal = thermocoupleADC.internalCalibration(1);
    // int ch_2_cal = thermocoupleADC.internalCalibration(2);
    //
    // snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "calibration res: %d, %d, %d\r\n", ch_0_cal, ch_1_cal, ch_2_cal);
    // HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 100);

    // Enable only the channels we're using
    thermocoupleADC.enableChannel(0, true);   // Thermocouple 1
    thermocoupleADC.enableChannel(1, false);   // Thermocouple 2
    thermocoupleADC.enableChannel(2, false);  // Thermistor (cold junction)
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
    HAL_Delay(200);

#endif



    rf.error = 0.0f;
    rf.estimate = 0.0f;
    rf.process_variance = 0.05f;     // was 2 first and later was 1....was 0.1..
    rf.measurement_variance = 100.0f; // 50 .... was 5....

    lf.error = 0.0f;
    lf.estimate = 0.0f;
    lf.process_variance = 0.05f;
    lf.measurement_variance = 100.0f;

    // diameter = 0.000812f;                // 20 gauge wire diameter, meters
    // length = 0.0254f;                    // 1 inch in meters
    // area = 3.14159f * diameter * length; // surface area in m^2
    // ambientTemp = 20.0f;
    // h = 500;      // W/m^2 * K
    // C = 0.000053; // J /K
    //lastTime = HAL_GetTick();
}



void Thermocouples::stateMachine(void)
{
#ifdef USE_SERVER
    //if (ad7124_rdy_flag)
    //{
      // HAL_NVIC_DisableIRQ(ADC_DRDY_EXTI_IRQn); // Temporarily disable interrupt

       //if (thermocoupleADC.isConversionReady())
         if(!thermocoupleDelay) {


         thermocoupleDelay = 15; // ms

        //thermocoupleADC.waitEndOfConversion(10);
       rawData = thermocoupleADC.getData();
        channel = thermocoupleADC.currentChannel();

        if (channel == 0)
        {
            raw[channel] = rawData;
            voltage[channel] = Ad7124Chip::toVoltage(raw[channel], 128, 2.5, BIPOLAR);

            if (calibrate)
            {
                cal_sum += (int32_t)rawData;
                cal_count++;

                if (cal_count >= CAL_SAMPLES)
                {
                    int32_t avg_raw = cal_sum / CAL_SAMPLES;

                    int32_t offset_reg = storage.calibration + (avg_raw - 0x800000);

                    thermocoupleADC.setAdcControl(Ad7124::StandbyMode, Ad7124::FullPower, true);
                    thermocoupleADC.setConfigOffset(0, offset_reg);
                    thermocoupleADC.setAdcControl(Ad7124::ContinuousMode, Ad7124::FullPower, true);

                    storage.calibration = offset_reg;
                    Flash_Write(&storage);

                    // Reset state
                    calibrate  = 0;
                    cal_sum    = 0;
                    cal_count  = 0;
                }
            }

            // temp_temp = thermocoupleVoltageToTemp(voltage[channel], 20.0);
            // temperature[channel] = temp_temp;

            // if (0.0 < temp_temp && temp_temp < 100.0)
            //{
            //     temperature[channel] = temp_temp;
            // }
        }

        if (channel == 1)
        {
            raw[channel] = rawData;
            voltage[channel] = Ad7124Chip::toVoltage(raw[channel], 128, 2.5, BIPOLAR);

            // temp_temp = thermocoupleVoltageToTemp(voltage[channel], 20.0);
            // temperature[channel] = temp_temp;

            // if (0.0 < temp_temp && temp_temp < 100.0)
            //{
            //     temperature[channel] = temp_temp;
            // }
        }



        // if (channel == 2)
        //{
        //
        //    raw[channel] = rawData;
        //    voltage[channel] = Ad7124Chip::toVoltage(raw[channel], 1, 2.5, true);
        //
        //    // Calculate cold junction temperature from thermistor
        //    R_thermistor = voltage[channel] / 0.0005f;
        //
        //    temp_kelvin = 1.0f / ((1.0f / T0) + (1.0f / B) * logf(R_thermistor / R0));
        //    coldJunctionTemp = temp_kelvin - 273.15f;
        //    if (0.0 < coldJunctionTemp && coldJunctionTemp < 100.0)
        //    {
        //        temperature[channel] = coldJunctionTemp;
        //    }
        //}

        // rf.measurement = voltage[0] + coldJunctionVoltage; // voltage
        // lf.measurement = voltage[1] + coldJunctionVoltage; // voltage

        lf.measurement = voltage[0]; // voltage
        rf.measurement = voltage[1]; // voltage

        // the current voltage is estimated to be the last voltage + volt/second ratio (velocity) * time
        rf.error = rf.error + rf.process_variance;
        rf.gain = rf.error / (rf.error + rf.measurement_variance);
        rf.estimate = rf.estimate + rf.gain * (rf.measurement - rf.estimate);
        rf.error = (1.0 - rf.gain) * rf.error;
        //
        lf.error = lf.error + lf.process_variance;
        lf.gain = lf.error / (lf.error + lf.measurement_variance);
        lf.estimate = lf.estimate + lf.gain * (lf.measurement - lf.estimate);
        lf.error = (1.0 - lf.gain) * lf.error;

        // gain is estimated at 1789473 intercept at 120 pixels when deltat is zero


        //deltaTemp = ((rf.estimate - lf.estimate) * 1000 000.0 * userGain) + 270.0; // SEEMS REALLLY FAST>>>>>> (04/01/2026 reduced gain below)
        //deltaTemp = ((rf.estimate - lf.estimate) * scaleFactor * userGain) + 270.0; // SEEMS REALLLY FAST>>>>>>
        deltaTemp = (lf.estimate * scaleFactor * userGain) + 270.0; // SEEMS REALLLY FAST>>>>>>


#else // CLIENT
        { // horrible hack
        deltaTemp = GetDeltaTData();

#endif
/*
        if(deltaTemp == 240) {
        	direction = -1;
        } else if(deltaTemp == 0 && direction == -1) {
        	direction = 1;
        }

        deltaTemp += direction;
*/
        // 2615384.615
        // deltaTemp = ((rf.estimate - lf.estimate) * 2000000.0 * userGain) + 85.0; // SEEMS REALLLY FAST>>>>>>

        // deltaTemp = ((rf.estimate - lf.estimate) * 4500000.0 * userGain); // SEEMS REALLLY FAST>>>>>>

        // deltaTemp = ((rf.estimate - lf.estimate) * 4615384.615 * userGain); // SEEMS REALLLY FAST>>>>>>
        // 4500000
        // deltaTemp = ((rf.estimate - lf.estimate) * 100.0 * 10000.0 * userGain); // NEW WITH LVGL
        // 32307692.31
        // deltaTemp = (((rf.estimate - lf.estimate) * 75.0 * 10000.0 * userGain) - deltaTemp) * 0.5; // - deltaTempOffset;

        updateNeedle();

#ifdef USE_SERVER


        //updateLeftandRightTempLabels();

        LoadDeltaData(deltaTemp);
#endif



        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "%.9f, %.9f ,%f\r\n", voltage[0], lf.estimate, deltaTemp);
        debug_printf((const char *)UART_BUFFER);
        //if(uart_ready){
       //HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 20);
        //uart_ready = 0;
        //}

    	//ad7124_rdy_flag = 0;
       //HAL_NVIC_EnableIRQ(ADC_DRDY_EXTI_IRQn); // Temporarily disable interrupt

    }

}


Thermocouples myThermocouples;


// float Thermocouples::thermocoupleVoltageToTemp(float voltage_V, float coldJunctionTemp_C)
//{
//     // K-type thermocouple: ~41µV/°C (average Seebeck coefficient)
//     const float SEEBECK_COEFF = 0.000041f; // V/°C
//
//     // Convert voltage to temperature difference
//     float tempDifference = voltage_V / SEEBECK_COEFF;
//
//     // Add cold junction temperature to get absolute temperature
//     float absoluteTemp = tempDifference + coldJunctionTemp_C;
//
//     return absoluteTemp;
// }
