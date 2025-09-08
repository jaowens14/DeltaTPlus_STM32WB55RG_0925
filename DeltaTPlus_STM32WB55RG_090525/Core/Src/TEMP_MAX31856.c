// // #include "TEMP_MAX31856.h"
// // #include <stdbool.h>
// // #include <stdint.h>
// // #include <stddef.h>
// // #include <math.h>
// //
// //// --- Chip Select Helpers ---
// bool MAX31856_begin(MAX31856 *dev);

// void csSelect(MAX31856 *dev)
// {
//     HAL_GPIO_WritePin(dev->cs_port, dev->cs_pin, GPIO_PIN_RESET);
// }

// void csDeselect(MAX31856 *dev)
// {
//     HAL_GPIO_WritePin(dev->cs_port, dev->cs_pin, GPIO_PIN_SET);
// }

// // --- SPI Register Access ---

// void readRegisterN(MAX31856 *dev, uint8_t addr, uint8_t buffer[], uint8_t n)
// {
//     addr &= 0x7F; // Read operation
//     uint8_t tx[1 + n];
//     uint8_t rx[1 + n];
//     tx[0] = addr;
//     for (uint8_t i = 1; i < 1 + n; i++)
//         tx[i] = 0x00;

//     csSelect(dev);
//     HAL_SPI_TransmitReceive(dev->hspi, tx, rx, 1 + n, 100);
//     csDeselect(dev);

//     for (uint8_t i = 0; i < n; i++)
//         buffer[i] = rx[i + 1];
// }

// uint8_t readRegister8(MAX31856 *dev, uint8_t addr)
// {
//     uint8_t ret = 0;
//     readRegisterN(dev, addr, &ret, 1);
//     return ret;
// }

// uint16_t readRegister16(MAX31856 *dev, uint8_t addr)
// {
//     uint8_t buffer[2];
//     readRegisterN(dev, addr, buffer, 2);
//     return ((uint16_t)buffer[0] << 8) | buffer[1];
// }

// uint32_t readRegister24(MAX31856 *dev, uint8_t addr)
// {
//     uint8_t buffer[3];
//     readRegisterN(dev, addr, buffer, 3);
//     return ((uint32_t)buffer[0] << 16) | ((uint32_t)buffer[1] << 8) | buffer[2];
// }

// void writeRegister8(MAX31856 *dev, uint8_t addr, uint8_t data)
// {
//     addr |= 0x80; // Write operation
//     uint8_t buffer[2] = {addr, data};
//     csSelect(dev);
//     HAL_SPI_Transmit(dev->hspi, buffer, 2, 100);
//     csDeselect(dev);
// }

// // --- Device Initialization ---

// bool MAX31856_begin(MAX31856 *dev)
// {
//     dev->initialized = true;
//     if (!dev->initialized)
//         return false;

//     writeRegister8(dev, MAX31856_MASK_REG, 0x0);                  // assert on any fault
//     writeRegister8(dev, MAX31856_CR0_REG, MAX31856_CR0_OCFAULT0); // enable open circuit fault detection
//     writeRegister8(dev, MAX31856_CJTO_REG, 0x0);                  // set cold junction offset to zero

//     setThermocoupleType(dev, MAX31856_TCTYPE_K); // default type K
//     setConversionMode(dev, MAX31856_ONESHOT);    // default one-shot

//     return true;
// }

// // --- Conversion Mode ---

// void setConversionMode(MAX31856 *dev, max31856_conversion_mode_t mode)
// {
//     dev->conversionMode = mode;
//     uint8_t t = readRegister8(dev, MAX31856_CR0_REG);
//     if (mode == MAX31856_CONTINUOUS)
//     {
//         t |= MAX31856_CR0_AUTOCONVERT;
//         t &= ~MAX31856_CR0_1SHOT;
//     }
//     else
//     {
//         t &= ~MAX31856_CR0_AUTOCONVERT;
//         t |= MAX31856_CR0_1SHOT;
//     }
//     writeRegister8(dev, MAX31856_CR0_REG, t);
// }

// max31856_conversion_mode_t getConversionMode(MAX31856 *dev)
// {
//     return dev->conversionMode;
// }

// // --- Thermocouple Type ---

// void setThermocoupleType(MAX31856 *dev, max31856_thermocoupletype_t type)
// {
//     dev->thermocoupleType = type;
//     uint8_t t = readRegister8(dev, MAX31856_CR1_REG);
//     t &= 0xF0;
//     t |= (uint8_t)type & 0x0F;
//     writeRegister8(dev, MAX31856_CR1_REG, t);
// }

// max31856_thermocoupletype_t getThermocoupleType(MAX31856 *dev)
// {
//     uint8_t t = readRegister8(dev, MAX31856_CR1_REG);
//     return (max31856_thermocoupletype_t)(t & 0x0F);
// }

// // --- Faults and Filters ---

// uint8_t readFault(MAX31856 *dev)
// {
//     return readRegister8(dev, MAX31856_SR_REG);
// }

// void setColdJunctionFaultThresholds(MAX31856 *dev, int8_t low, int8_t high)
// {
//     writeRegister8(dev, MAX31856_CJLF_REG, (uint8_t)low);
//     writeRegister8(dev, MAX31856_CJHF_REG, (uint8_t)high);
// }

// void setNoiseFilter(MAX31856 *dev, max31856_noise_filter_t noiseFilter)
// {
//     uint8_t t = readRegister8(dev, MAX31856_CR0_REG);
//     if (noiseFilter == MAX31856_NOISE_FILTER_50HZ)
//         t |= 0x01;
//     else
//         t &= 0xFE;
//     writeRegister8(dev, MAX31856_CR0_REG, t);
// }

// void setTempFaultThresholds(MAX31856 *dev, float flow, float fhigh)
// {
//     int16_t low = (int16_t)(flow * 16);
//     int16_t high = (int16_t)(fhigh * 16);
//     writeRegister8(dev, MAX31856_LTHFTH_REG, (uint8_t)(high >> 8));
//     writeRegister8(dev, MAX31856_LTHFTL_REG, (uint8_t)high);
//     writeRegister8(dev, MAX31856_LTLFTH_REG, (uint8_t)(low >> 8));
//     writeRegister8(dev, MAX31856_LTLFTL_REG, (uint8_t)low);
// }

// // --- Conversion Control ---

// void triggerOneShot(MAX31856 *dev)
// {
//     if (dev->conversionMode == MAX31856_CONTINUOUS)
//         return;
//     uint8_t t = readRegister8(dev, MAX31856_CR0_REG);
//     t &= ~MAX31856_CR0_AUTOCONVERT;
//     t |= MAX31856_CR0_1SHOT;
//     writeRegister8(dev, MAX31856_CR0_REG, t);
// }

// bool conversionComplete(MAX31856 *dev)
// {
//     if (dev->conversionMode == MAX31856_CONTINUOUS)
//         return true;
//     return !(readRegister8(dev, MAX31856_CR0_REG) & MAX31856_CR0_1SHOT);
// }

// // --- Temperature Reading ---

// float readCJTemperature(MAX31856 *dev)
// {
//     return readRegister16(dev, MAX31856_CJTH_REG) / 256.0f;
// }

// int32_t readThermocoupleTemperature(MAX31856 *dev)
// {
//     // For one-shot, trigger and wait for conversion
//     if (dev->conversionMode == MAX31856_ONESHOT)
//     {
//         triggerOneShot(dev);
//         uint32_t start = HAL_GetTick();
//         while (!conversionComplete(dev))
//         {
//             if (HAL_GetTick() - start > 250)
//                 return 0;
//             HAL_Delay(10);
//         }
//     }
//     int32_t temp24 = readRegister24(dev, MAX31856_LTCBH_REG);
//     if (temp24 & 0x800000)
//         temp24 |= 0xFF000000; // sign extend
//     temp24 >>= 5;             // bottom 5 bits are unused
//     return temp24;
// }
