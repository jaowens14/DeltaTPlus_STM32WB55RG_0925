#ifndef BATTERY_MONITOR_HPP
#define BATTERY_MONITOR_HPP

#include "Adafruit_MAX1704X.h"
#include "i2c.h"
#include "usart.h"

class BatteryMonitor
{

private:
    Adafruit_MAX17048_STM32 max17048;

public:
    volatile int delay = 10;
    // bool newData;
    //  char *lastPercent;
    static uint16_t charge;
    static bool charging;

    void setup(void);
    void stateMachine(void);
};

#endif
