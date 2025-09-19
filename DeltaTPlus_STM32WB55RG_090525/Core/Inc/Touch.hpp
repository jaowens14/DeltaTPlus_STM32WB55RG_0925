#ifndef TOUCH_HPP
#define TOUCH_HPP
#include <FT5436_Touch.h>
#include "usart.h"

class Touch
{

public:
    volatile int delay;
    Touch_FT5436_t touch_controller;

    // TS_Point point;
    static int x;
    static int y;

    void setup(void);
    void stateMachine(void);
};

#endif
