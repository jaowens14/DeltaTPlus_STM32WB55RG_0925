#include "Adafruit_MAX31856.h"
#include "gpio.h"
#include "spi.h"
/**************************************************************************/
/*!
    @brief  Constructor for STM32 HAL interface
    @param  hspi Pointer to SPI handle
    @param  cs_port GPIO port for chip select
    @param  cs_pin GPIO pin for chip select
*/
/**************************************************************************/
Adafruit_MAX31856::Adafruit_MAX31856(SPI_HandleTypeDef *hspi, GPIO_TypeDef *cs_port, uint16_t cs_pin)
{
  _hspi = hspi;
  _cs_port = cs_port;
  _cs_pin = cs_pin;
}

Adafruit_MAX31856::Adafruit_MAX31856()
{
  _hspi = nullptr;
  _cs_port = nullptr;
  _cs_pin = 0;
}

/**************************************************************************/
/*!
    @brief  Initialize MAX31856 with STM32 HAL
    @returns Always returns true at this time
*/
/**************************************************************************/
bool Adafruit_MAX31856::begin(void)
{
  // Set CS pin high initially
  csHigh();

  // Small delay for chip to stabilize
  HAL_Delay(100);

  // assert on any fault
  writeRegister8(MAX31856_MASK_REG, 0x0);

  // enable open circuit fault detection
  writeRegister8(MAX31856_CR0_REG, MAX31856_CR0_OCFAULT0);

  // set cold junction temperature offset to zero
  writeRegister8(MAX31856_CJTO_REG, 0x0);

  // set Type K by default
  setThermocoupleType(MAX31856_TCTYPE_K);

  // set One-Shot conversion mode
  setConversionMode(MAX31856_CONTINUOUS);

  return true;
}

/**************************************************************************/
/*!
    @brief  Set temperature conversion mode
    @param mode The conversion mode
*/
/**************************************************************************/
void Adafruit_MAX31856::setConversionMode(max31856_conversion_mode_t mode)
{
  conversionMode = mode;
  uint8_t t = readRegister8(MAX31856_CR0_REG); // get current register value
  if (conversionMode == MAX31856_CONTINUOUS)
  {
    t |= MAX31856_CR0_AUTOCONVERT; // turn on automatic
    t &= ~MAX31856_CR0_1SHOT;      // turn off one-shot
  }
  else
  {
    t &= ~MAX31856_CR0_AUTOCONVERT; // turn off automatic
    t |= MAX31856_CR0_1SHOT;        // turn on one-shot
  }
  writeRegister8(MAX31856_CR0_REG, t); // write value back to register
}

/**************************************************************************/
/*!
    @brief  Get temperature conversion mode
    @returns The conversion mode
*/
/**************************************************************************/
max31856_conversion_mode_t Adafruit_MAX31856::getConversionMode(void)
{
  return conversionMode;
}

/**************************************************************************/
/*!
    @brief  Set which kind of Thermocouple (K, J, T, etc) to detect & decode
    @param type The enumeration type of the thermocouple
*/
/**************************************************************************/
void Adafruit_MAX31856::setThermocoupleType(max31856_thermocoupletype_t type)
{
  uint8_t t = readRegister8(MAX31856_CR1_REG);
  t &= 0xF0; // mask off bottom 4 bits
  t |= (uint8_t)type & 0x0F;
  writeRegister8(MAX31856_CR1_REG, t);
}

/**************************************************************************/
/*!
    @brief  Get which kind of Thermocouple (K, J, T, etc) we are using
    @returns The enumeration type of the thermocouple
*/
/**************************************************************************/
max31856_thermocoupletype_t Adafruit_MAX31856::getThermocoupleType(void)
{
  uint8_t t = readRegister8(MAX31856_CR1_REG);
  t &= 0x0F;
  return (max31856_thermocoupletype_t)(t);
}

/**************************************************************************/
/*!
    @brief  Read the fault register (8 bits)
    @returns 8 bits of fault register data
*/
/**************************************************************************/
uint8_t Adafruit_MAX31856::readFault(void)
{
  return readRegister8(MAX31856_SR_REG);
}

/**************************************************************************/
/*!
    @brief  Sets the threshhold for internal chip temperature range
    for fault detection. NOT the thermocouple temperature range!
    @param  low Low (min) temperature, signed 8 bit so -128 to 127 degrees C
    @param  high High (max) temperature, signed 8 bit so -128 to 127 degrees C
*/
/**************************************************************************/
void Adafruit_MAX31856::setColdJunctionFaultThreshholds(int8_t low, int8_t high)
{
  writeRegister8(MAX31856_CJLF_REG, low);
  writeRegister8(MAX31856_CJHF_REG, high);
}

/**************************************************************************/
/*!
    @brief  Sets the mains noise filter. Can be set to 50 or 60hz.
    Defaults to 60hz. You need to call this if you live in a 50hz country.
    @param  noiseFilter One of MAX31856_NOISE_FILTER_50HZ or
   MAX31856_NOISE_FILTER_60HZ
*/
/**************************************************************************/
void Adafruit_MAX31856::setNoiseFilter(max31856_noise_filter_t noiseFilter)
{
  uint8_t t = readRegister8(MAX31856_CR0_REG);
  if (noiseFilter == MAX31856_NOISE_FILTER_50HZ)
  {
    t |= 0x01;
  }
  else
  {
    t &= 0xfe;
  }
  writeRegister8(MAX31856_CR0_REG, t);
}

/**************************************************************************/
/*!
    @brief  Sets the threshhold for thermocouple temperature range
    for fault detection. NOT the internal chip temperature range!
    @param  flow Low (min) temperature, floating point
    @param  fhigh High (max) temperature, floating point
*/
/**************************************************************************/
void Adafruit_MAX31856::setTempFaultThreshholds(float flow, float fhigh)
{
  int16_t low, high;

  flow *= 16;
  low = flow;

  fhigh *= 16;
  high = fhigh;

  writeRegister8(MAX31856_LTHFTH_REG, high >> 8);
  writeRegister8(MAX31856_LTHFTL_REG, high);

  writeRegister8(MAX31856_LTLFTH_REG, low >> 8);
  writeRegister8(MAX31856_LTLFTL_REG, low);
}

/**************************************************************************/
/*!
    @brief  Begin a one-shot (read temperature only upon request) measurement.
    Value must be read later, not returned here!
*/
/**************************************************************************/
void Adafruit_MAX31856::triggerOneShot(void)
{
  if (conversionMode == MAX31856_CONTINUOUS)
    return;

  uint8_t t = readRegister8(MAX31856_CR0_REG); // get current register value
  t &= ~MAX31856_CR0_AUTOCONVERT;              // turn off autoconvert
  t |= MAX31856_CR0_1SHOT;                     // turn on one-shot
  writeRegister8(MAX31856_CR0_REG, t);         // write value back to register
                                               // conversion starts when CS goes high
}

/**************************************************************************/
/*!
    @brief  Return status of temperature conversion.
    @returns true if conversion complete, otherwise false
*/
/**************************************************************************/
bool Adafruit_MAX31856::conversionComplete(void)
{
  if (conversionMode == MAX31856_CONTINUOUS)
    return true;
  return !(readRegister8(MAX31856_CR0_REG) & MAX31856_CR0_1SHOT);
}

/**************************************************************************/
/*!
    @brief  Return cold-junction (internal chip) temperature
    @returns Floating point temperature in Celsius
*/
/**************************************************************************/
float Adafruit_MAX31856::readCJTemperature(void)
{
  return readRegister16(MAX31856_CJTH_REG) / 256.0;
}

/**************************************************************************/
/*!
    @brief  Return hot-junction (thermocouple) temperature
    @returns Floating point temperature in Celsius
*/
/**************************************************************************/
uint32_t Adafruit_MAX31856::readThermocoupleTemperature(void)
{
  // for one-shot, make it happen
  if (conversionMode == MAX31856_ONESHOT)
  {
    triggerOneShot();
    uint32_t start = HAL_GetTick();
    while (!conversionComplete())
    {
      if (HAL_GetTick() - start > 250)
        return 0;
      HAL_Delay(10);
    }
  }

  // read the thermocouple temperature registers (3 bytes)
  int32_t temp24 = readRegister24(MAX31856_LTCBH_REG);
  // and compute temperature
  if (temp24 & 0x800000)
  {
    temp24 |= 0xFF000000; // fix sign
  }

  temp24 >>= 5; // bottom 5 bits are unused

  return temp24;
}

/**************************************************************************/
/*!
    @brief  Set chip select low
*/
/**************************************************************************/
void Adafruit_MAX31856::csLow(void)
{
  HAL_GPIO_WritePin(_cs_port, _cs_pin, GPIO_PIN_RESET);
}

/**************************************************************************/
/*!
    @brief  Set chip select high
*/
/**************************************************************************/
void Adafruit_MAX31856::csHigh(void)
{
  HAL_GPIO_WritePin(_cs_port, _cs_pin, GPIO_PIN_SET);
}

/**************************************************************************/
/*!
    @brief  Read 8-bit register
    @param  addr Register address
    @returns Register value
*/
/**************************************************************************/
uint8_t Adafruit_MAX31856::readRegister8(uint8_t addr)
{
  uint8_t ret = 0;
  readRegisterN(addr, &ret, 1);
  return ret;
}

/**************************************************************************/
/*!
    @brief  Read 16-bit register
    @param  addr Register address
    @returns Register value
*/
/**************************************************************************/
uint16_t Adafruit_MAX31856::readRegister16(uint8_t addr)
{
  uint8_t buffer[2];
  readRegisterN(addr, buffer, 2);
  return ((uint16_t)buffer[0] << 8) | buffer[1];
}

/**************************************************************************/
/*!
    @brief  Read 24-bit register
    @param  addr Register address
    @returns Register value
*/
/**************************************************************************/
uint32_t Adafruit_MAX31856::readRegister24(uint8_t addr)
{
  uint8_t buffer[3];
  readRegisterN(addr, buffer, 3);
  return ((uint32_t)buffer[0] << 16) | ((uint32_t)buffer[1] << 8) | buffer[2];
}

/**************************************************************************/
/*!
    @brief  Read N bytes from register
    @param  addr Register address
    @param  buffer Buffer to store data
    @param  n Number of bytes to read
*/
/**************************************************************************/
void Adafruit_MAX31856::readRegisterN(uint8_t addr, uint8_t buffer[], uint8_t n)
{

  addr &= 0x7F; // Read operation
  uint8_t tx[1 + n];
  uint8_t rx[1 + n];
  tx[0] = addr;
  for (uint8_t i = 1; i < 1 + n; i++)
    tx[i] = 0x00;

  csLow();
  HAL_SPI_TransmitReceive(_hspi, tx, rx, 1 + n, 100);
  csHigh();

  for (uint8_t i = 0; i < n; i++)
    buffer[i] = rx[i + 1];
}

/**************************************************************************/
/*!
    @brief  Write 8-bit register
    @param  addr Register address
    @param  data Data to write
*/
/**************************************************************************/
void Adafruit_MAX31856::writeRegister8(uint8_t addr, uint8_t data)
{
  addr |= 0x80; // MSB=1 for write, make sure top bit is set

  uint8_t buffer[2] = {addr, data};

  csLow();
  HAL_SPI_Transmit(_hspi, buffer, 2, HAL_MAX_DELAY);
  csHigh();
}

float Adafruit_MAX31856::convertToTemperature(int32_t rawTemp)
{
  // Raw temperature is in units of 0.0078125°C (1/128°C)
  return rawTemp * 0.0078125f;
}
