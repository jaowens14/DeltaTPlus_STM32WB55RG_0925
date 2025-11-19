#ifndef BACKLIGHT_H
#define BACKLIGHT_H

#include "tim.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{

    LOW,
    MID,
    HIGH,
    OFF,

} BacklightStates;

extern BacklightStates backlightState;

void backlightSetup(void);
void backlightMain(void);
void backlightFade(int target_brightness);

extern volatile int backlightDelay;
extern int current_brightness;
extern int desired_brightness;
extern int low_brightness;
extern int mid_brightness;
extern int hi_brightness;
extern int off;


#ifdef __cplusplus
}
#endif


#endif // BACKLIGHT_H
