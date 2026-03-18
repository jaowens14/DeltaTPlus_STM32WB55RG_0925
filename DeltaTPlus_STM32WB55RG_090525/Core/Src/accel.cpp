#include <backlight.h>
#include "accel.h"
#include "main.h"
#include "widgets.h"
#include "meter.h"

AccelerometerStates accelState;

volatile uint8_t accelDelay = 0;
volatile uint8_t double_tap_detected = 0;
volatile uint8_t activity_detected = 0;
volatile uint8_t inactivity_detected = 0;
volatile uint8_t int1_triggered = 0;
volatile uint8_t int2_triggered = 0;

uint8_t accelSwitchState = 0; // LOW


void accelSetup(void)
{
    // ===== Configure POWER_CTL with Link Mode =====
    // CRITICAL: Set Link bit (D5) + Measure bit (D3)
    uint8_t powerCtl = 0x28;  // 0010 1000 - LINK + MEASURE
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, 0x2D, I2C_MEMADD_SIZE_8BIT, &powerCtl, 1, 100);

    // ===== Configure TAP detection parameters =====
    uint8_t thresh_tap = 0x18; // ~1.5g threshold (62.5mg/LSB)
    uint8_t dur = 0x10;        // 10ms duration (625μs/LSB)
    uint8_t latent = 0x50;     // 100ms latent (1.25ms/LSB)
    uint8_t window = 0xF0;     // 300ms window (1.25ms/LSB)
    uint8_t tap_axes = 0x01;   // Enable Z axis for tap

    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, THRESH_TAP_REG, I2C_MEMADD_SIZE_8BIT, &thresh_tap, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, DUR_REG, I2C_MEMADD_SIZE_8BIT, &dur, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, LATENT_REG, I2C_MEMADD_SIZE_8BIT, &latent, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, WINDOW_REG, I2C_MEMADD_SIZE_8BIT, &window, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, TAP_AXES_REG, I2C_MEMADD_SIZE_8BIT, &tap_axes, 1, 100);

    // ===== Configure ACTIVITY/INACTIVITY detection parameters =====
    uint8_t thresh_act = 0x30;    // ~1.5g - requires deliberate shake/pickup (increased from 0x08)
    uint8_t thresh_inact = 0x03;  // ~188mg - detect stillness
    uint8_t time_inact = 0x78;    // 120 seconds (1 sec/LSB) - increased for better link mode
    uint8_t act_inact_ctl = 0xFF; // Enable all axes for both activity and inactivity, AC-coupled

    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, 0x24, I2C_MEMADD_SIZE_8BIT, &thresh_act, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, 0x25, I2C_MEMADD_SIZE_8BIT, &thresh_inact, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, 0x26, I2C_MEMADD_SIZE_8BIT, &time_inact, 1, 100);
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, 0x27, I2C_MEMADD_SIZE_8BIT, &act_inact_ctl, 1, 100);

    // ===== Enable interrupts =====
    // Enable DOUBLE_TAP (D5), Activity (D4), and Inactivity (D3)
    uint8_t int_enable = 0x38; // 0011 1000 - enables DOUBLE_TAP, Activity, Inactivity
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, INT_ENABLE_REG, I2C_MEMADD_SIZE_8BIT, &int_enable, 1, 100);

    // ===== Map interrupts to pins =====
    // DOUBLE_TAP (D5) → INT1 (set to 0)
    // Activity (D4) → INT2 (set to 1)
    // Inactivity (D3) → INT2 (set to 1)
    uint8_t int_map = 0x18; // 0001 1000 - Activity and Inactivity to INT2, DOUBLE_TAP to INT1
    HAL_I2C_Mem_Write(&hi2c1, ADXL343_ADDR, INT_MAP_REG, I2C_MEMADD_SIZE_8BIT, &int_map, 1, 100);

    // Clear any pending interrupts by reading INT_SOURCE
    uint8_t clear_int = 0;
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, INT_SOURCE_REG, I2C_MEMADD_SIZE_8BIT, &clear_int, 1, 100);

    diagnoseAccelerometer();

    accelState = ACTIVE;
    accelDelay = 120; // 2 minutes of on time before looking for changes
}

void accelMain(void)
{


	if(int1_triggered || int2_triggered) {
    	int1_triggered = 0;
    	int2_triggered = 0;
    	accelHandler();
	}



}

void accelHandler(void)
{
    // Read INT_SOURCE to clear the interrupt
    uint8_t int_source = 0;
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, INT_SOURCE_REG, I2C_MEMADD_SIZE_8BIT, &int_source, 1, 100);

    // Check for activity (bit D4)
    if (int_source & 0x10)
    {
        activity_detected = 1;
        backlightState = HIGH;


    }

    // Check for inactivity (bit D3)
    if (int_source & 0x08)
    {
        inactivity_detected = 1;
        backlightState = OFF;
    }

    // Check if it was a double tap (bit D5)
    if (int_source & 0x20)
    {
        double_tap_detected = 1;

        accelSwitchState = !accelSwitchState;

    }

#ifdef USE_SERVER
    updateSettingLabel();
#endif

}


void diagnoseAccelerometer(void)
{
    uint8_t regs[10];
    char msg[200];

    // Read key registers
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x00, I2C_MEMADD_SIZE_8BIT, &regs[0], 1, 100);  // DEVID
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x1D, I2C_MEMADD_SIZE_8BIT, &regs[1], 1, 100);  // THRESH_TAP
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x21, I2C_MEMADD_SIZE_8BIT, &regs[2], 1, 100);  // DUR
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x22, I2C_MEMADD_SIZE_8BIT, &regs[3], 1, 100);  // LATENT
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x2A, I2C_MEMADD_SIZE_8BIT, &regs[4], 1, 100);  // TAP_AXES
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x2D, I2C_MEMADD_SIZE_8BIT, &regs[5], 1, 100);  // POWER_CTL
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x2E, I2C_MEMADD_SIZE_8BIT, &regs[6], 1, 100);  // INT_ENABLE
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x2F, I2C_MEMADD_SIZE_8BIT, &regs[7], 1, 100);  // INT_MAP
    HAL_I2C_Mem_Read(&hi2c1, ADXL343_ADDR, 0x30, I2C_MEMADD_SIZE_8BIT, &regs[8], 1, 100);  // INT_SOURCE

    snprintf(msg, sizeof(msg),
             "DEVID:%02X TTAP:%02X DUR:%02X LAT:%02X AXES:%02X PWR:%02X EN:%02X MAP:%02X SRC:%02X\r\n",
             regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7], regs[8]);
    HAL_UART_Transmit(&huart1, (uint8_t*)msg, strlen(msg), 100);
}
