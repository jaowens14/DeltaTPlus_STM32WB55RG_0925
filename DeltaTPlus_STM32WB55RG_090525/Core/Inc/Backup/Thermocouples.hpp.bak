#ifndef THERMOCOUPLES_HPP
#define THERMOCOUPLES_HPP

#include <Adafruit_MAX31856.h>
#include "spi.h"
#include "gpio.h"
#include "usart.h"
#include <stdio.h>
#include <string.h>
#include <ad7124.h>

class Thermocouples
{
private:
    Ad7124Chip thermocoupleADC;

public:
    volatile int delay = 1;
    void setup(void);
    void stateMachine(void);
    float convertToTemperature(int32_t rawTemp);
    void checkFault(char *name, uint8_t fault);

    static float deltaTemp;

    long rawData;
    int channel;
    int filterWord; // length of filter?

    long raw[2];
    double voltage[2];
    double temperature[2];

    float h;
    float C;
    float ambientTemp;
    float diameter;
    float length;
    float area;
    uint32_t currentTime;
    uint32_t lastTime;

    int32_t leftRawTemp;
    int32_t rightRawTemp;
    float leftTemp;
    float rightTemp;
    static float userGain;
};

typedef struct
{
    float measurement;
    float prediction;
    float error;
    float gain;
    float estimate;
    float process_variance;
    float measurement_variance;
} KALMAN_T;

#endif
