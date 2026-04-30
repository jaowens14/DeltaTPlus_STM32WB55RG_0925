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

    backlightState = HIGH;

    backlightDelay = 0;
}

void backlightMain(void)
{

    switch (backlightState)
    {

    case LOW:
            desired_brightness = low_brightness;
        break;
    case MID:
            desired_brightness = mid_brightness;
        break;
    case HIGH:
    	desired_brightness = hi_brightness;
        break;
    case OFF:
            desired_brightness = off;
        break;
    default:
        break;
    }

    if(!backlightDelay){

    backlightFade(desired_brightness);
    backlightDelay = 2; // ms
    }
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
