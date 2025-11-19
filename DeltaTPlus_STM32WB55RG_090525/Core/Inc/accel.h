#ifndef ACCELEROMETER_H
#define ACCELEROMETER_H

#include "i2c.h"
#include "usart.h"
#include "main.h"

#ifdef __cplusplus
extern "C"
{
#endif

    typedef enum
    {
        INACTIVE,
        ACTIVE
    } AccelerometerStates;

    extern AccelerometerStates accelState;

    void accelSetup(void);
    void accelMain(void);
    void accelHandler(void);
    void diagnoseAccelerometer(void);


#define ADXL343_ADDR (0x53 << 1) // Correct 8-bit address for grounded ALT_ADDRESS

    extern volatile uint8_t accelDelay;
    extern volatile uint8_t double_tap_detected;
    extern volatile uint8_t activity_detected;
    extern volatile uint8_t inactivity_detected;
    extern volatile uint8_t int1_triggered;
    extern volatile uint8_t int2_triggered;
    extern uint8_t accelSwitchState;


#define INT_ENABLE_REG 0x2E // write 0010 0000 enables double_tap int
#define INT_MAP_REG 0x2F    // set to 0010 0000 sends double_tap to int1 pin, everything else to int 2 pin
#define THRESH_TAP_REG 0x1D
#define DUR_REG 0x21
#define LATENT_REG 0x22
#define WINDOW_REG 0x23
#define TAP_AXES_REG 0x2A
#define INT_SOURCE_REG 0x30

#ifdef __cplusplus
}
#endif

#endif // ACCELEROMETER_H
