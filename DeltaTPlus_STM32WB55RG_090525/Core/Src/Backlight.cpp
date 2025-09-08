#include "Backlight.hpp"

Backlight::States Backlight::state;

void Backlight::setup(void)

{

    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);

    __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_1, 0); // turn off screen to start

    state = HIGH;
    // pinMode(0, OUTPUT);
    // state = AWAKE;
    delay = 0;
    // readAccelerometer();
}

void Backlight::stateMachine(void)
{

    switch (state)
    {

    case LOW:
        if (!delay)
        {
            desired_brightness = low_brightness;
        }
        break;
    case MID:
        if (!delay)
        {
            desired_brightness = mid_brightness;
        }
        break;
    case HIGH:
        if (!delay)
        {
            desired_brightness = hi_brightness;
        }
        break;
    case OFF:
        if (!delay)
        {
            desired_brightness = off;
        }
        break;
    default:
        break;
    }

    fadeScreen(desired_brightness);
}

void Backlight::fadeScreen(int target_brightness)
{

    if (current_brightness < target_brightness)
    {
        current_brightness += 1; // Adjust step size for fade speed
        if (current_brightness > target_brightness)
            current_brightness = target_brightness;
    }
    else if (current_brightness > target_brightness)
    {
        current_brightness -= 1;
        if (current_brightness < target_brightness)
            current_brightness = target_brightness;
    }

    __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_1, current_brightness);
}
