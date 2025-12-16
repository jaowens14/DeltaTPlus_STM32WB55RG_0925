#include <backlight.h>

BacklightStates backlightState;


volatile int backlightDelay = 0;
int current_brightness = 0;
int desired_brightness = 0;
int low_brightness = 50;
int mid_brightness = 100;
int hi_brightness = 200;
int off = 0;

void backlightSetup(void)

{

    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);

    __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_1, 0); // turn off screen to start

    backlightState = LOW;

    backlightDelay = 0;
}

void backlightMain(void)
{

    switch (backlightState)
    {

    case LOW:
        if (!backlightDelay)
        {
            desired_brightness = low_brightness;
        }
        break;
    case MID:
        if (!backlightDelay)
        {
            desired_brightness = mid_brightness;
        }
        break;
    case HIGH:
        if (!backlightDelay)
        {
            desired_brightness = hi_brightness;
        }
        break;
    case OFF:
        if (!backlightDelay)
        {
            desired_brightness = off;
        }
        break;
    default:
        break;
    }

    backlightFade(desired_brightness);
}

void backlightFade(int target_brightness)
{
    // Only update if brightness needs to change
    if (current_brightness == target_brightness)
        return; // Exit early if no change needed

    if (current_brightness < target_brightness)
    {
        current_brightness += 1;
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
