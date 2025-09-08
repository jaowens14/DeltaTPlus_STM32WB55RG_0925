

#include "Adafruit_MAX1704X.h"

#include <math.h>

Adafruit_MAX17048_STM32::Adafruit_MAX17048_STM32()
{
  _hi2c = nullptr;
  _i2c_addr = MAX17048_I2CADDR_DEFAULT << 1; // STM32 HAL uses 8-bit address
  _timeout = 1000;                           // 1 second timeout
}

bool Adafruit_MAX17048_STM32::begin(I2C_HandleTypeDef *hi2c, uint16_t i2c_addr)
{
  _hi2c = hi2c;
  _i2c_addr = i2c_addr << 1; // Convert to 8-bit address for HAL

  if (!isDeviceReady())
  {
    return false;
  }

  if (!reset())
  {
    return false;
  }

  enableSleep(false);
  sleep(false);

  return true;
}

bool Adafruit_MAX17048_STM32::writeRegister8(uint8_t reg, uint8_t value)
{
  uint8_t data[2] = {reg, value};
  HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(_hi2c, _i2c_addr, data, 2, _timeout);
  return (status == HAL_OK);
}

bool Adafruit_MAX17048_STM32::writeRegister16(uint8_t reg, uint16_t value)
{
  uint8_t data[3] = {reg, (uint8_t)(value >> 8), (uint8_t)(value & 0xFF)};
  HAL_StatusTypeDef status = HAL_I2C_Master_Transmit(_hi2c, _i2c_addr, data, 3, _timeout);
  return (status == HAL_OK);
}

uint8_t Adafruit_MAX17048_STM32::readRegister8(uint8_t reg)
{
  uint8_t data = 0;

  // Write register address
  if (HAL_I2C_Master_Transmit(_hi2c, _i2c_addr, &reg, 1, _timeout) != HAL_OK)
  {
    return 0;
  }

  // Read data
  HAL_I2C_Master_Receive(_hi2c, _i2c_addr, &data, 1, _timeout);

  return data;
}

uint16_t Adafruit_MAX17048_STM32::readRegister16(uint8_t reg)
{
  uint8_t data[2] = {0, 0};

  // Write register address
  if (HAL_I2C_Master_Transmit(_hi2c, _i2c_addr, &reg, 1, _timeout) != HAL_OK)
  {
    return 0;
  }

  // Read data
  if (HAL_I2C_Master_Receive(_hi2c, _i2c_addr, data, 2, _timeout) != HAL_OK)
  {
    return 0;
  }

  return (data[0] << 8) | data[1]; // MSB first
}

bool Adafruit_MAX17048_STM32::writeBits(uint8_t reg, uint8_t bitStart, uint8_t length, uint8_t data)
{
  uint8_t regValue = readRegister8(reg);
  uint8_t mask = ((1 << length) - 1) << (bitStart - length + 1);
  data <<= (bitStart - length + 1);
  data &= mask;
  regValue &= ~mask;
  regValue |= data;
  return writeRegister8(reg, regValue);
}

uint8_t Adafruit_MAX17048_STM32::readBits(uint8_t reg, uint8_t bitStart, uint8_t length)
{
  uint8_t regValue = readRegister8(reg);
  uint8_t mask = ((1 << length) - 1) << (bitStart - length + 1);
  regValue &= mask;
  regValue >>= (bitStart - length + 1);
  return regValue;
}

uint16_t Adafruit_MAX17048_STM32::getICversion(void)
{
  return readRegister16(MAX1704X_VERSION_REG);
}

uint8_t Adafruit_MAX17048_STM32::getChipID(void)
{
  return readRegister8(MAX1704X_CHIPID_REG);
}

bool Adafruit_MAX17048_STM32::isDeviceReady(void)
{
  return (getICversion() & 0xFFF0) == 0x0010;
}

bool Adafruit_MAX17048_STM32::reset(void)
{
  // Send reset command - expect this to fail with NACK as chip resets
  writeRegister16(MAX1704X_CMD_REG, 0x5400);

  // Wait for reset to complete
  HAL_Delay(100);

  // Try to clear reset flag
  for (uint8_t retries = 0; retries < 3; retries++)
  {
    if (clearAlertFlag(MAX1704X_ALERTFLAG_RESET_INDICATOR))
    {
      return true;
    }
    HAL_Delay(50);
  }

  return false;
}

bool Adafruit_MAX17048_STM32::clearAlertFlag(uint8_t flags)
{
  uint8_t status = readRegister8(MAX1704X_STATUS_REG);
  status &= ~flags;
  return writeRegister8(MAX1704X_STATUS_REG, status);
}

float Adafruit_MAX17048_STM32::cellVoltage(void)
{
  if (!isDeviceReady())
  {
    return NAN;
  }

  uint16_t voltage = readRegister16(MAX1704X_VCELL_REG);
  return voltage * 78.125 / 1000000.0; // Convert to volts
}

float Adafruit_MAX17048_STM32::cellPercent(void)
{
  if (!isDeviceReady())
  {
    return NAN;
  }

  uint16_t percent = readRegister16(MAX1704X_SOC_REG);
  return percent / 256.0; // Convert to percentage
}

float Adafruit_MAX17048_STM32::chargeRate(void)
{
  if (!isDeviceReady())
  {
    return NAN;
  }

  int16_t rate = (int16_t)readRegister16(MAX1704X_CRATE_REG);
  return rate * 0.208; // Convert to %/hour
}

void Adafruit_MAX17048_STM32::setResetVoltage(float reset_v)
{
  reset_v /= 0.04; // 40mV per LSB
  uint8_t value = (uint8_t)fmax(0, fmin(127, reset_v));
  writeRegister8(MAX1704X_VRESET_REG, value);
}

float Adafruit_MAX17048_STM32::getResetVoltage(void)
{
  uint8_t value = readRegister8(MAX1704X_VRESET_REG) & 0x7F; // 7 bits
  return value * 0.04;                                       // 40mV per LSB
}

void Adafruit_MAX17048_STM32::setAlertVoltages(float minv, float maxv)
{
  uint8_t minv_int = (uint8_t)fmax(0, fmin(255, minv / 0.02));
  uint8_t maxv_int = (uint8_t)fmax(0, fmin(255, maxv / 0.02));

  writeRegister8(MAX1704X_VALERT_REG, minv_int);
  writeRegister8(MAX1704X_VALERT_REG + 1, maxv_int);
}

void Adafruit_MAX17048_STM32::getAlertVoltages(float &minv, float &maxv)
{
  minv = readRegister8(MAX1704X_VALERT_REG) * 0.02;     // 20mV per LSB
  maxv = readRegister8(MAX1704X_VALERT_REG + 1) * 0.02; // 20mV per LSB
}

bool Adafruit_MAX17048_STM32::isActiveAlert(void)
{
  return readBits(MAX1704X_CONFIG_REG, 5, 1) == 1;
}

uint8_t Adafruit_MAX17048_STM32::getAlertStatus(void)
{
  return readRegister8(MAX1704X_STATUS_REG) & 0x7F;
}

float Adafruit_MAX17048_STM32::getActivityThreshold(void)
{
  uint8_t value = readRegister8(MAX1704X_HIBRT_REG + 1);
  return value * 0.00125; // 1.25mV per LSB
}

void Adafruit_MAX17048_STM32::setActivityThreshold(float actthresh)
{
  uint8_t value = (uint8_t)fmax(0, fmin(255, actthresh / 0.00125));
  writeRegister8(MAX1704X_HIBRT_REG + 1, value);
}

float Adafruit_MAX17048_STM32::getHibernationThreshold(void)
{
  uint8_t value = readRegister8(MAX1704X_HIBRT_REG);
  return value * 0.208; // 0.208% per hour
}

void Adafruit_MAX17048_STM32::setHibernationThreshold(float hibthresh)
{
  uint8_t value = (uint8_t)fmax(0, fmin(255, hibthresh / 0.208));
  writeRegister8(MAX1704X_HIBRT_REG, value);
}

bool Adafruit_MAX17048_STM32::isHibernating(void)
{
  return readBits(MAX1704X_MODE_REG, 4, 1) == 1;
}

void Adafruit_MAX17048_STM32::hibernate(void)
{
  writeRegister8(MAX1704X_HIBRT_REG, 0xFF);
  writeRegister8(MAX1704X_HIBRT_REG + 1, 0xFF);
}

void Adafruit_MAX17048_STM32::wake(void)
{
  writeRegister8(MAX1704X_HIBRT_REG, 0x00);
  writeRegister8(MAX1704X_HIBRT_REG + 1, 0x00);
}

void Adafruit_MAX17048_STM32::sleep(bool s)
{
  writeBits(MAX1704X_CONFIG_REG, 7, 1, s ? 1 : 0);
}

void Adafruit_MAX17048_STM32::enableSleep(bool en)
{
  writeBits(MAX1704X_MODE_REG, 5, 1, en ? 1 : 0);
}

void Adafruit_MAX17048_STM32::quickStart(void)
{
  writeBits(MAX1704X_MODE_REG, 6, 1, 1);
  // Bit is automatically cleared by the chip
}