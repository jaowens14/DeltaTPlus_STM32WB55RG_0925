#ifndef BACKLIGHT_HPP
#define BACKLIGHT_HPP

#include "tim.h"

// #define STATUS_LED 0
// #define ADXL343_ADDR (0x53 << 1) // Correct 8-bit address for grounded ALT_ADDRESS

class Backlight
{
public:
    volatile int delay = 0;
    // volatile int readDelay = 0;
    enum States
    {

        LOW,
        MID,
        HIGH,
        OFF,

    };

    static States state;

    void setup(void);
    void stateMachine(void);

    // void readAccelerometer(void);
    void fadeScreen(int target_brightness);

    // uint32_t activityThreshold = 150; // find this
    // uint32_t idleTime = 15;           // seconds
    // uint32_t acceleration = 0;        // return max from sensor
    int current_brightness = 0;
    int desired_brightness = 0;
    int low_brightness = 50;
    int mid_brightness = 100;
    int hi_brightness = 200;
    int off = 0;
    // uint8_t powerCtl = 0x08;
    // uint8_t accreg = 0x32; // Start from DATAX0
    // uint8_t accdata[6];

    // char accmsg[64];
};

// state machine note:
// if the measurements have been low for awhile go to sleep

#endif // BACKLIGHT_HPP
