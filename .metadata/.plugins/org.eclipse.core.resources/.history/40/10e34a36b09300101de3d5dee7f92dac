/**
 * @file    st7789s.c
 * @brief   ST7789S LCD Driver Implementation for STM32 HAL
 * @author  Adapted from vendor example
 */

#include <TFT_ST7789S.h>

/* Private macros */
#define LCD_CS_LOW()    HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET)
#define LCD_CS_HIGH()   HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET)
#define LCD_DC_LOW()    HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET)
#define LCD_DC_HIGH()   HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET)
#define LCD_RST_LOW()   HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_RESET)
#define LCD_RST_HIGH()  HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_SET)

/**
 * @brief Write command to LCD
 * @param cmd: Command byte to send
 */
void LCD_WriteCommand(uint8_t cmd)
{
    LCD_CS_LOW();
    LCD_DC_LOW();  // Command mode (RS=0 in original)
    HAL_SPI_Transmit(&hspi1, &cmd, 1, HAL_MAX_DELAY);
    LCD_CS_HIGH();
}

/**
 * @brief Write data to LCD
 * @param data: Data byte to send
 */
void LCD_WriteData(uint8_t data)
{
    LCD_CS_LOW();
    LCD_DC_HIGH(); // Data mode (RS=1 in original)
    HAL_SPI_Transmit(&hspi1, &data, 1, HAL_MAX_DELAY);
    LCD_CS_HIGH();
}

/**
 * @brief Write multiple data bytes to LCD
 * @param data: Pointer to data array
 * @param len: Number of bytes to send
 */
void LCD_WriteDataMultiple(uint8_t *data, uint16_t len)
{
    LCD_CS_LOW();
    LCD_DC_HIGH(); // Data mode
    HAL_SPI_Transmit(&hspi1, data, len, HAL_MAX_DELAY);
    LCD_CS_HIGH();
}

/**
 * @brief Write display data (16-bit color data)
 * @param data_high: High byte of 16-bit data
 * @param data_low: Low byte of 16-bit data
 */
void LCD_WriteDisplayData(uint8_t data_high, uint8_t data_low)
{
    uint8_t data[2] = {data_high, data_low};
    LCD_CS_LOW();
    LCD_DC_HIGH(); // Data mode
    HAL_SPI_Transmit(&hspi1, data, 2, HAL_MAX_DELAY);
    LCD_CS_HIGH();
}

/**
 * @brief Initialize ST7789V LCD
 */
void LCD_Init(void)
{
    // Ensure CS is high initially
    LCD_CS_HIGH();

    // Hardware reset sequence - ST7789V needs longer reset
    LCD_RST_HIGH();
    HAL_Delay(10);
    LCD_RST_LOW();
    HAL_Delay(50);
    LCD_RST_HIGH();
    HAL_Delay(120);

    // Software reset for ST7789V
    LCD_WriteCommand(0x01); // Software Reset
    HAL_Delay(150);

    // Sleep out first
    LCD_WriteCommand(0x11); // Sleep Out
    HAL_Delay(120);

    // ST7789V specific initialization
    LCD_WriteCommand(0x36); // Memory Access Control
    LCD_WriteData(0x00);    // Normal orientation

    LCD_WriteCommand(0x3A); // Pixel Format Set
    LCD_WriteData(0x05);    // 16-bit RGB565

    // ST7789V Porch Setting
    LCD_WriteCommand(0xB2);
    LCD_WriteData(0x0C);
    LCD_WriteData(0x0C);
    LCD_WriteData(0x00);
    LCD_WriteData(0x33);
    LCD_WriteData(0x33);

    // ST7789V Gate Control
    LCD_WriteCommand(0xB7);
    LCD_WriteData(0x35);

    // ST7789V VCOM Setting
    LCD_WriteCommand(0xBB);
    LCD_WriteData(0x19);

    // ST7789V LCM Control
    LCD_WriteCommand(0xC0);
    LCD_WriteData(0x2C);

    // ST7789V VDV and VRH Command Enable
    LCD_WriteCommand(0xC2);
    LCD_WriteData(0x01);

    // ST7789V VRH Set
    LCD_WriteCommand(0xC3);
    LCD_WriteData(0x12);

    // ST7789V VDV Set
    LCD_WriteCommand(0xC4);
    LCD_WriteData(0x20);

    // ST7789V Frame Rate Control
    LCD_WriteCommand(0xC6);
    LCD_WriteData(0x0F);

    // ST7789V Power Control 1
    LCD_WriteCommand(0xD0);
    LCD_WriteData(0xA4);
    LCD_WriteData(0xA1);

    // ST7789V Positive Voltage Gamma Control
    LCD_WriteCommand(0xE0);
    LCD_WriteData(0xD0);
    LCD_WriteData(0x04);
    LCD_WriteData(0x0D);
    LCD_WriteData(0x11);
    LCD_WriteData(0x13);
    LCD_WriteData(0x2B);
    LCD_WriteData(0x3F);
    LCD_WriteData(0x54);
    LCD_WriteData(0x4C);
    LCD_WriteData(0x18);
    LCD_WriteData(0x0D);
    LCD_WriteData(0x0B);
    LCD_WriteData(0x1F);
    LCD_WriteData(0x23);

    // ST7789V Negative Voltage Gamma Control
    LCD_WriteCommand(0xE1);
    LCD_WriteData(0xD0);
    LCD_WriteData(0x04);
    LCD_WriteData(0x0C);
    LCD_WriteData(0x11);
    LCD_WriteData(0x13);
    LCD_WriteData(0x2C);
    LCD_WriteData(0x3F);
    LCD_WriteData(0x44);
    LCD_WriteData(0x51);
    LCD_WriteData(0x2F);
    LCD_WriteData(0x1F);
    LCD_WriteData(0x1F);
    LCD_WriteData(0x20);
    LCD_WriteData(0x23);

    // ST7789V Display Inversion - try both ON and OFF
    LCD_WriteCommand(0x21); // Display Inversion On
    // LCD_WriteCommand(0x20); // Use this instead if colors are inverted

    // Set display area - ST7789V might have offset
    LCD_WriteCommand(0x2A); // Column Address Set
    LCD_WriteData(0x00);
    LCD_WriteData(0x00);
    LCD_WriteData(0x00);
    LCD_WriteData(0xEF); // 239

    LCD_WriteCommand(0x2B); // Row Address Set
    LCD_WriteData(0x00);
    LCD_WriteData(0x00);
    LCD_WriteData(0x01);
    LCD_WriteData(0x3F); // 319

    // Final commands
    LCD_WriteCommand(0x29); // Display On
    HAL_Delay(50);
}

/**
 * @brief Enter sleep mode
 */
void LCD_EnterSleep(void)
{
    LCD_WriteCommand(0x28); // Display Off
    HAL_Delay(20);
    LCD_WriteCommand(0x10); // Sleep In
}

/**
 * @brief Exit sleep mode
 */
void LCD_ExitSleep(void)
{
    LCD_WriteCommand(0x11); // Sleep Out
    HAL_Delay(120);
    LCD_WriteCommand(0x29); // Display On
}

/**
 * @brief Set drawing window/area
 * @param x0: Start column
 * @param y0: Start row
 * @param x1: End column
 * @param y1: End row
 */
void LCD_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    LCD_WriteCommand(0x2A); // Column Address Set
    LCD_WriteData(x0 >> 8);
    LCD_WriteData(x0 & 0xFF);
    LCD_WriteData(x1 >> 8);
    LCD_WriteData(x1 & 0xFF);

    LCD_WriteCommand(0x2B); // Row Address Set
    LCD_WriteData(y0 >> 8);
    LCD_WriteData(y0 & 0xFF);
    LCD_WriteData(y1 >> 8);
    LCD_WriteData(y1 & 0xFF);

    LCD_WriteCommand(0x2C); // Memory Write
}

/**
 * @brief Fill entire screen with a color
 * @param color: 16-bit RGB565 color
 */
void LCD_FillScreen(uint16_t color)
{
    LCD_SetWindow(0, 0, LCD_WIDTH - 1, LCD_HEIGHT - 1);

    // Create a buffer with multiple pixels
    uint8_t buffer[1024]; // 512 pixels worth
    for(int i = 0; i < 1024; i += 2) {
        buffer[i] = color >> 8;
        buffer[i+1] = color & 0xFF;
    }

    LCD_CS_LOW();
    LCD_DC_HIGH();

    // Send buffer multiple times instead of pixel by pixel
    for(uint32_t i = 0; i < (LCD_WIDTH * LCD_HEIGHT * 2); i += 1024) {
        HAL_SPI_Transmit(&hspi1, buffer, 1024, HAL_MAX_DELAY);
    }

    LCD_CS_HIGH();
}

/**
 * @brief Draw a single pixel
 * @param x: X coordinate
 * @param y: Y coordinate
 * @param color: 16-bit RGB565 color
 */
void LCD_DrawPixel(uint16_t x, uint16_t y, uint16_t color)
{
    if(x >= LCD_WIDTH || y >= LCD_HEIGHT) return; // Bounds check

    LCD_SetWindow(x, y, x, y);
    LCD_WriteDisplayData(color >> 8, color & 0xFF);
}

/**
 * @brief Fill a rectangular area with color
 * @param x: X coordinate
 * @param y: Y coordinate
 * @param width: Rectangle width
 * @param height: Rectangle height
 * @param color: 16-bit RGB565 color
 */
void LCD_FillRect(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t color)
{
    if(x >= LCD_WIDTH || y >= LCD_HEIGHT) return; // Bounds check

    // Limit rectangle to screen bounds
    if(x + width > LCD_WIDTH) width = LCD_WIDTH - x;
    if(y + height > LCD_HEIGHT) height = LCD_HEIGHT - y;

    LCD_SetWindow(x, y, x + width - 1, y + height - 1);

    uint8_t color_bytes[2] = {color >> 8, color & 0xFF};

    LCD_CS_LOW();
    LCD_DC_HIGH(); // Data mode

    for(uint32_t i = 0; i < width * height; i++) {
        HAL_SPI_Transmit(&hspi1, color_bytes, 2, HAL_MAX_DELAY);
    }

    LCD_CS_HIGH();
}

/**
 * @brief Convert RGB888 to RGB565
 * @param r: Red component (0-255)
 * @param g: Green component (0-255)
 * @param b: Blue component (0-255)
 * @return 16-bit RGB565 color
 */
uint16_t LCD_RGB565(uint8_t r, uint8_t g, uint8_t b)
{
    return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}


void LCD_BasicCommTest(void)
{
    // Just try to wake up the display
    LCD_CS_HIGH();
    HAL_Delay(10);

    LCD_RST_LOW();
    HAL_Delay(10);
    LCD_RST_HIGH();
    HAL_Delay(120);

    // Try NOP command first
    LCD_WriteCommand(0x00); // NOP
    HAL_Delay(10);

    // Sleep out
    LCD_WriteCommand(0x11);
    HAL_Delay(120);

    // Display on
    LCD_WriteCommand(0x29);
    HAL_Delay(50);

    // If you get this far without issues, SPI is probably working
}





// adafruit stuff reworked

#ifndef min
#define min(a, b) (((a) < (b)) ? (a) : (b))
#endif

#ifndef _swap_int16_t
#define _swap_int16_t(a, b)                                                    \
  {                                                                            \
    int16_t t = a;                                                             \
    a = b;                                                                     \
    b = t;                                                                     \
  }
#endif


void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {

  int16_t steep = abs(y1 - y0) > abs(x1 - x0);
  if (steep) {
    _swap_int16_t(x0, y0);
    _swap_int16_t(x1, y1);
  }

  if (x0 > x1) {
    _swap_int16_t(x0, x1);
    _swap_int16_t(y0, y1);
  }

  int16_t dx, dy;
  dx = x1 - x0;
  dy = abs(y1 - y0);

  int16_t err = dx / 2;
  int16_t ystep;

  if (y0 < y1) {
    ystep = 1;
  } else {
    ystep = -1;
  }

  for (; x0 <= x1; x0++) {
    if (steep) {
      writePixel(y0, x0, color);
    } else {
      writePixel(x0, y0, color);
    }
    err -= dy;
    if (err < 0) {
      y0 += ystep;
      err += dx;
    }
  }
}
