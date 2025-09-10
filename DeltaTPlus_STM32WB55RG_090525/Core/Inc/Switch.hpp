#ifndef SWITCH_HPP
#define SWITCH_HPP

#include "gpio.h"
#include "usart.h"
class Switch
{

public:
    volatile int delay;

    void setup(void);
    void stateMachine(void);

    enum States
    {
        LOW,
        HIGH,

    };
    static States state;

    char switchBuffer[16];
    char lastSwitchBuffer[16];
};

#endif
