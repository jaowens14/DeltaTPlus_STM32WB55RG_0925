#include "ST7789V_STM32.h"
#include "spi.h"

ST7789V_STM32::DmaStates ST7789V_STM32::dmaState;

ST7789V_STM32::ST7789V_STM32(SPI_HandleTypeDef *hspi, GPIO_TypeDef *cs_port, uint16_t cs_pin,
                             GPIO_TypeDef *dc_port, uint16_t dc_pin, GPIO_TypeDef *rst_port, uint16_t rst_pin)
    : Adafruit_GFX(ST7789V_TFTWIDTH, ST7789V_TFTHEIGHT),
      _hspi(hspi), _cs_port(cs_port), _cs_pin(cs_pin),
      _dc_port(dc_port), _dc_pin(dc_pin), _rst_port(rst_port), _rst_pin(rst_pin),
      _inTransaction(false)
{
}

void ST7789V_STM32::begin(void)
{
  // dmaState = INIT;

  dmaState = INIT;

  // Hardware reset sequence
  rstHigh();
  HAL_Delay(1);
  rstLow();
  HAL_Delay(10);
  rstHigh();
  HAL_Delay(120);

  csHigh();

  // ST7789V initialization sequence (based on your vendor code)
  writeCommand(ST7789V_COLMOD); // 0x3A - Pixel format
  writeData(0x05);              // 16-bit color

  writeCommand(ST7789V_MADCTL); // 0x36 - Memory access control
  writeData(0x00);              // Default orientation

  // Frame rate control
  writeCommand(0xB2);
  writeData(0x05);
  writeData(0x05);
  writeData(0x00);
  writeData(0x33);
  writeData(0x33);

  writeCommand(0xB7);
  writeData(0x35);

  // Power settings
  writeCommand(0xBB); // VCOM
  writeData(0x3F);

  writeCommand(0xC0);
  writeData(0x2C);

  writeCommand(0xC2);
  writeData(0x01);

  writeCommand(0xC3);
  writeData(0x0F);

  writeCommand(0xC4);
  writeData(0x20);

  writeCommand(0xC6);
  writeData(0x11);

  writeCommand(0xD0);
  writeData(0xA4);
  writeData(0xA1);

  writeCommand(0xE8);
  writeData(0x03);

  writeCommand(0xE9);
  writeData(0x09);
  writeData(0x09);
  writeData(0x08);

  // Gamma settings
  writeCommand(0xE0);
  writeData(0xD0);
  writeData(0x05);
  writeData(0x09);
  writeData(0x09);
  writeData(0x08);
  writeData(0x14);
  writeData(0x28);
  writeData(0x33);
  writeData(0x3F);
  writeData(0x07);
  writeData(0x13);
  writeData(0x14);
  writeData(0x28);
  writeData(0x30);

  writeCommand(0xE1);
  writeData(0xD0);
  writeData(0x05);
  writeData(0x09);
  writeData(0x09);
  writeData(0x08);
  writeData(0x03);
  writeData(0x24);
  writeData(0x32);
  writeData(0x32);
  writeData(0x3B);
  writeData(0x38);
  writeData(0x14);
  writeData(0x13);
  writeData(0x28);
  writeData(0x2F);

  writeCommand(ST7789V_INVON); // 0x21 - Inversion on

  // Set display window
  writeCommand(ST7789V_CASET); // 0x2A - Column address set
  writeData(0x00);
  writeData(0x00);
  writeData(0x00);
  writeData(0xEF); // 239 (240-1)

  writeCommand(ST7789V_RASET); // 0x2B - Row address set
  writeData(0x00);
  writeData(0x00);
  writeData(0x01);
  writeData(0x3F); // 319 (320-1)

  writeCommand(ST7789V_SLPOUT); // 0x11 - Exit sleep mode
  HAL_Delay(120);

  writeCommand(ST7789V_DISPON); // 0x29 - Display on
  writeCommand(ST7789V_RAMWR);  // 0x2C - Memory write
}

void ST7789V_STM32::drawPixel(int16_t x, int16_t y, uint16_t color)
{
  if ((x < 0) || (x >= _width) || (y < 0) || (y >= _height))
    return;

  setWindow(x, y, x, y);
  writeData16(color);
}

void ST7789V_STM32::startWrite(void)
{
  if (!_inTransaction)
  {
    csLow();
    _inTransaction = true;
  }
}

void ST7789V_STM32::endWrite(void)
{
  if (_inTransaction)
  {
    csHigh();
    _inTransaction = false;
  }
}

void ST7789V_STM32::writePixel(int16_t x, int16_t y, uint16_t color)
{
  if ((x < 0) || (x >= _width) || (y < 0) || (y >= _height))
    return;

  setWindow(x, y, x, y);
  writeData16(color);
}

void ST7789V_STM32::writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color)
{
  if ((x >= _width) || (y >= _height))
    return;
  int16_t x2 = x + w - 1, y2 = y + h - 1;
  if ((x2 < 0) || (y2 < 0))
    return;

  // Clip to screen bounds
  if (x < 0)
  {
    x = 0;
  }
  if (y < 0)
  {
    y = 0;
  }
  if (x2 >= _width)
  {
    x2 = _width - 1;
  }
  if (y2 >= _height)
  {
    y2 = _height - 1;
  }

  setWindow(x, y, x2, y2);
  uint32_t pixels = (x2 - x + 1) * (y2 - y + 1);

  for (uint32_t i = 0; i < pixels; i++)
  {
    writeData16(color);
  }
}

void ST7789V_STM32::fillScreen(uint16_t color)
{
  writeFillRect(0, 0, _width, _height, color);
}

void ST7789V_STM32::fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color)
{
  startWrite();
  writeFillRect(x, y, w, h, color);
  endWrite();
}

void ST7789V_STM32::drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color)
{
  startWrite();
  writeFillRect(x, y, 1, h, color);
  endWrite();
}

void ST7789V_STM32::writeFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color)
{
  writeFillRect(x, y, 1, h, color);
}

void ST7789V_STM32::drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color)
{
  startWrite();
  writeFillRect(x, y, w, 1, color);
  endWrite();
}

void ST7789V_STM32::writeFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color)
{
  writeFillRect(x, y, w, 1, color);
}

void ST7789V_STM32::setRotation(uint8_t rotation)
{
  writeCommand(ST7789V_MADCTL);
  rotation = rotation % 4;

  switch (rotation)
  {
  case 0:
    writeData(0x00);
    _width = ST7789V_TFTWIDTH;
    _height = ST7789V_TFTHEIGHT;
    break;
  case 1:
    writeData(0x60);
    _width = ST7789V_TFTHEIGHT;
    _height = ST7789V_TFTWIDTH;
    break;
  case 2:
    writeData(0xC0);
    _width = ST7789V_TFTWIDTH;
    _height = ST7789V_TFTHEIGHT;
    break;
  case 3:
    writeData(0xA0);
    _width = ST7789V_TFTHEIGHT;
    _height = ST7789V_TFTWIDTH;
    break;
  }
}

void ST7789V_STM32::invertDisplay(bool invert)
{
  writeCommand(invert ? ST7789V_INVON : ST7789V_INVOFF);
}

void ST7789V_STM32::enterSleep(void)
{
  writeCommand(ST7789V_DISPOFF);
  HAL_Delay(20);
  writeCommand(0x10); // Sleep in
}

void ST7789V_STM32::exitSleep(void)
{
  writeCommand(ST7789V_SLPOUT);
  HAL_Delay(120);
  writeCommand(ST7789V_DISPON);
}

// Private methods
void ST7789V_STM32::writeCommand(uint8_t cmd)
{
  if (!_inTransaction)
    csLow();
  dcLow();
  spiWrite(cmd);
  dcHigh();
  if (!_inTransaction)
    csHigh();
}

void ST7789V_STM32::writeData(uint8_t data)
{
  if (!_inTransaction)
    csLow();
  dcHigh();
  spiWrite(data);
  if (!_inTransaction)
    csHigh();
}

void ST7789V_STM32::writeData16(uint16_t data)
{
  if (!_inTransaction)
    csLow();
  dcHigh();
  spiWrite16(data);
  if (!_inTransaction)
    csHigh();
}

void ST7789V_STM32::setWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
  writeCommand(ST7789V_CASET);
  writeData(x0 >> 8);
  writeData(x0 & 0xFF);
  writeData(x1 >> 8);
  writeData(x1 & 0xFF);
  writeCommand(ST7789V_RASET);
  writeData(y0 >> 8);
  writeData(y0 & 0xFF);
  writeData(y1 >> 8);
  writeData(y1 & 0xFF);
  writeCommand(ST7789V_RAMWR);
}

void ST7789V_STM32::spiWrite(uint8_t data)
{
  HAL_SPI_Transmit(_hspi, &data, 1, HAL_MAX_DELAY);
}

void ST7789V_STM32::spiWrite16(uint16_t data)
{
  uint8_t buffer[2];
  buffer[0] = data >> 8;   // MSB first
  buffer[1] = data & 0xFF; // LSB second
  HAL_SPI_Transmit(_hspi, buffer, 2, HAL_MAX_DELAY);
}

// GPIO control functions
void ST7789V_STM32::csLow(void)
{
  HAL_GPIO_WritePin(_cs_port, _cs_pin, GPIO_PIN_RESET);
}

void ST7789V_STM32::csHigh(void)
{
  HAL_GPIO_WritePin(_cs_port, _cs_pin, GPIO_PIN_SET);
}

void ST7789V_STM32::dcLow(void)
{
  HAL_GPIO_WritePin(_dc_port, _dc_pin, GPIO_PIN_RESET);
}

void ST7789V_STM32::dcHigh(void)
{
  HAL_GPIO_WritePin(_dc_port, _dc_pin, GPIO_PIN_SET);
}

void ST7789V_STM32::rstLow(void)
{
  HAL_GPIO_WritePin(_rst_port, _rst_pin, GPIO_PIN_RESET);
}

void ST7789V_STM32::rstHigh(void)
{
  HAL_GPIO_WritePin(_rst_port, _rst_pin, GPIO_PIN_SET);
}

void ST7789V_STM32::writeBuffer(uint16_t *buffer, uint32_t len)
{
  if (!_inTransaction)
    csLow();
  dcHigh();

  uint8_t *byteBuffer = (uint8_t *)buffer;
  const uint32_t MAX_CHUNK = 32766; // max safe size in bytes (even number)

  uint32_t remaining = len * 2;
  uint32_t offset = 0;

  while (remaining > 0)
  {
    uint32_t chunk = (remaining > MAX_CHUNK) ? MAX_CHUNK : remaining;

    HAL_SPI_Transmit(_hspi, byteBuffer + offset, chunk, HAL_MAX_DELAY);

    offset += chunk;
    remaining -= chunk;
  }

  if (!_inTransaction)
    csHigh();
}

void ST7789V_STM32::writeBufferDMA(uint16_t *buffer, uint32_t len)
{
	   switch (dmaState)
	    {
	    case INIT:
	    {
	        // Wait for SPI to be ready before starting
	        if (HAL_SPI_GetState(_hspi) != HAL_SPI_STATE_READY) {
	            return; // Try again later
	        }

	        byteBuffer = (uint8_t *)buffer;
	        totalBytes = len * 2;
	        bytesRemaining = totalBytes;
	        currentOffset = 0;

	        if (!_inTransaction)
	            csLow();
	        dcHigh();

	        uint32_t firstChunk = (bytesRemaining > MAX_CHUNK_SIZE) ? MAX_CHUNK_SIZE : bytesRemaining;

	        if (HAL_SPI_Transmit_DMA(_hspi, byteBuffer + currentOffset, firstChunk) == HAL_OK)
	        {
	            currentOffset += firstChunk;
	            bytesRemaining -= firstChunk;
	            dmaState = BUSY;
	        }
	        else
	        {
	            if (!_inTransaction)
	                csHigh();
	            dmaState = ERROR;
	        }
	        break;
	    }
	    case BUSY:
	    {
	        HAL_SPI_StateTypeDef spiState = HAL_SPI_GetState(_hspi);

	        // Check for error states first
	        if (spiState == HAL_SPI_STATE_ERROR) {
	            if (!_inTransaction)
	                csHigh();
	            dmaState = ERROR;
	            break;
	        }

	        if (spiState == HAL_SPI_STATE_READY)
	        {
	            if (bytesRemaining > 0)
	            {
	                uint32_t nextChunk = (bytesRemaining > MAX_CHUNK_SIZE) ? MAX_CHUNK_SIZE : bytesRemaining;

	                if (HAL_SPI_Transmit_DMA(_hspi, byteBuffer + currentOffset, nextChunk) == HAL_OK)
	                {
	                    currentOffset += nextChunk;
	                    bytesRemaining -= nextChunk;
	                    // Stay in BUSY state
	                }
	                else
	                {
	                    if (!_inTransaction)
	                        csHigh();
	                    dmaState = ERROR;
	                }
	            }
	            else
	            {
	                if (!_inTransaction)
	                    csHigh();
	                dmaState = DONE;
	            }
	        }
	        // If still busy (HAL_SPI_STATE_BUSY_TX), just return
	        break;
	    }
  case DONE:
  {
    // Transfer complete, reset for next transfer
    dmaState = INIT;
    break;
  }
  case ERROR:
  {
    // Handle error state
    dmaState = INIT;
    break;
  }
  default:
  {
    dmaState = INIT;
    break;
  }
  }
}
