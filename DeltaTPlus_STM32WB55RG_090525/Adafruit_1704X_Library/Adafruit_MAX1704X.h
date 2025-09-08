#ifndef ADAFRUIT_MAX1704X_H
#define ADAFRUIT_MAX1704X_H
//#include "Adafruit_MAX1704X.h"
#include <stdint.h>
#include <stdbool.h>
#include "gpio.h"
#include "i2c.h"

// I2C Address
#define MAX17048_I2CADDR_DEFAULT 0x36

// Register definitions
#define MAX1704X_VCELL_REG 0x02
#define MAX1704X_SOC_REG 0x04
#define MAX1704X_MODE_REG 0x06
#define MAX1704X_VERSION_REG 0x08
#define MAX1704X_HIBRT_REG 0x0A
#define MAX1704X_CONFIG_REG 0x0C
#define MAX1704X_VALERT_REG 0x14
#define MAX1704X_CRATE_REG 0x16
#define MAX1704X_VRESET_REG 0x18
#define MAX1704X_CHIPID_REG 0x19
#define MAX1704X_STATUS_REG 0x1A
#define MAX1704X_CMD_REG 0xFE

// Alert flags
#define MAX1704X_ALERTFLAG_SOC_CHANGE 0x20
#define MAX1704X_ALERTFLAG_SOC_LOW 0x10
#define MAX1704X_ALERTFLAG_VOLTAGE_RESET 0x08
#define MAX1704X_ALERTFLAG_VOLTAGE_LOW 0x04
#define MAX1704X_ALERTFLAG_VOLTAGE_HIGH 0x02
#define MAX1704X_ALERTFLAG_RESET_INDICATOR 0x01

class Adafruit_MAX17048_STM32
{
private:
  I2C_HandleTypeDef *_hi2c;
  uint16_t _i2c_addr;
  uint32_t _timeout;

  // Helper functions for I2C communication
  bool writeRegister8(uint8_t reg, uint8_t value);
  bool writeRegister16(uint8_t reg, uint16_t value);
  uint8_t readRegister8(uint8_t reg);
  uint16_t readRegister16(uint8_t reg);

  // Bit manipulation helpers
  bool writeBits(uint8_t reg, uint8_t bitStart, uint8_t length, uint8_t data);
  uint8_t readBits(uint8_t reg, uint8_t bitStart, uint8_t length);

public:
  // Constructor
  Adafruit_MAX17048_STM32();

  // Initialization
  bool begin(I2C_HandleTypeDef *hi2c, uint16_t i2c_addr = MAX17048_I2CADDR_DEFAULT);

  // Device identification
  uint16_t getICversion(void);
  uint8_t getChipID(void);
  bool isDeviceReady(void);

  // Reset and configuration
  bool reset(void);
  bool clearAlertFlag(uint8_t flags);

  // Battery monitoring
  float cellVoltage(void);
  float cellPercent(void);
  float chargeRate(void);

  // Voltage alerts
  void setResetVoltage(float reset_v);
  float getResetVoltage(void);
  void setAlertVoltages(float minv, float maxv);
  void getAlertVoltages(float &minv, float &maxv);

  // Alert status
  bool isActiveAlert(void);
  uint8_t getAlertStatus(void);

  // Power management
  float getActivityThreshold(void);
  void setActivityThreshold(float actthresh);
  float getHibernationThreshold(void);
  void setHibernationThreshold(float hibthresh);
  bool isHibernating(void);
  void hibernate(void);
  void wake(void);
  void sleep(bool s);
  void enableSleep(bool en);
  void quickStart(void);
};

#endif // ADAFRUIT_MAX17048_STM32_H
