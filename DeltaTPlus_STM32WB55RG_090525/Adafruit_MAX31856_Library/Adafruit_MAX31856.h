#ifndef ADAFRUIT_MAX31856_H
#define ADAFRUIT_MAX31856_H
#include "Adafruit_MAX31856.h"

#include "spi.h"
#include "gpio.h"
#include <stdlib.h>
#include <math.h>

// Register addresses
#define MAX31856_CR0_REG 0x00
#define MAX31856_CR1_REG 0x01
#define MAX31856_MASK_REG 0x02
#define MAX31856_CJHF_REG 0x03
#define MAX31856_CJLF_REG 0x04
#define MAX31856_LTHFTH_REG 0x05
#define MAX31856_LTHFTL_REG 0x06
#define MAX31856_LTLFTH_REG 0x07
#define MAX31856_LTLFTL_REG 0x08
#define MAX31856_CJTO_REG 0x09
#define MAX31856_CJTH_REG 0x0A
#define MAX31856_CJTL_REG 0x0B
#define MAX31856_LTCBH_REG 0x0C
#define MAX31856_LTCBM_REG 0x0D
#define MAX31856_LTCBL_REG 0x0E
#define MAX31856_SR_REG 0x0F

// Configuration register 0 bits
#define MAX31856_CR0_AUTOCONVERT 0x80
#define MAX31856_CR0_1SHOT 0x40
#define MAX31856_CR0_OCFAULT1 0x20
#define MAX31856_CR0_OCFAULT0 0x10
#define MAX31856_CR0_CJ 0x08
#define MAX31856_CR0_FAULT 0x04
#define MAX31856_CR0_FAULTCLR 0x02

// Thermocouple types
typedef enum
{
  MAX31856_TCTYPE_B = 0b0000,
  MAX31856_TCTYPE_E = 0b0001,
  MAX31856_TCTYPE_J = 0b0010,
  MAX31856_TCTYPE_K = 0b0011,
  MAX31856_TCTYPE_N = 0b0100,
  MAX31856_TCTYPE_R = 0b0101,
  MAX31856_TCTYPE_S = 0b0110,
  MAX31856_TCTYPE_T = 0b0111,
  MAX31856_VMODE_G8 = 0b1000,
  MAX31856_VMODE_G32 = 0b1100,
} max31856_thermocoupletype_t;

// Conversion modes
typedef enum
{
  MAX31856_ONESHOT = 0,
  MAX31856_CONTINUOUS = 1
} max31856_conversion_mode_t;

// Noise filter
typedef enum
{
  MAX31856_NOISE_FILTER_60HZ = 0,
  MAX31856_NOISE_FILTER_50HZ = 1
} max31856_noise_filter_t;

class Adafruit_MAX31856
{
public:
  // Constructor for STM32 HAL
  Adafruit_MAX31856(SPI_HandleTypeDef *hspi, GPIO_TypeDef *cs_port, uint16_t cs_pin);
  Adafruit_MAX31856();

  bool begin(void);
  uint32_t readThermocoupleTemperature(void);
  float readCJTemperature(void);
  uint8_t readFault(void);
  void setThermocoupleType(max31856_thermocoupletype_t type);
  max31856_thermocoupletype_t getThermocoupleType(void);
  void setConversionMode(max31856_conversion_mode_t mode);
  max31856_conversion_mode_t getConversionMode(void);
  void setColdJunctionFaultThreshholds(int8_t low, int8_t high);
  void setNoiseFilter(max31856_noise_filter_t noiseFilter);
  void setTempFaultThreshholds(float flow, float fhigh);
  void triggerOneShot(void);
  bool conversionComplete(void);
  float convertToTemperature(int32_t rawTemp);

private:
  SPI_HandleTypeDef *_hspi;
  GPIO_TypeDef *_cs_port;
  uint16_t _cs_pin;
  max31856_conversion_mode_t conversionMode;

  // Helper functions for STM32 HAL SPI
  void csLow(void);
  void csHigh(void);
  uint8_t readRegister8(uint8_t addr);
  uint16_t readRegister16(uint8_t addr);
  uint32_t readRegister24(uint8_t addr);
  void readRegisterN(uint8_t addr, uint8_t buffer[], uint8_t n);
  void writeRegister8(uint8_t addr, uint8_t data);
};

#endif
