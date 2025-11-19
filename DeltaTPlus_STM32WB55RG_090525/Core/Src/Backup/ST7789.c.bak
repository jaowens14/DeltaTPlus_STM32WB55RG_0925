#include "st7789.h"

extern SPI_HandleTypeDef hspi1;



// ST7789 Command definitions
#define ST7789_NOP 0x00
#define ST7789_SWRESET 0x01
#define ST7789_SLPIN 0x10
#define ST7789_SLPOUT 0x11
#define ST7789_INVOFF 0x20
#define ST7789_INVON 0x21
#define ST7789_DISPOFF 0x28
#define ST7789_DISPON 0x29
#define ST7789_CASET 0x2A
#define ST7789_RASET 0x2B
#define ST7789_RAMWR 0x2C
#define ST7789_MADCTL 0x36
#define ST7789_COLMOD 0x3A
#define ST7789_PORCTRL 0xB2
#define ST7789_GCTRL 0xB7
#define ST7789_VCOMS 0xBB
#define ST7789_LCMCTRL 0xC0
#define ST7789_VDVVRHEN 0xC2
#define ST7789_VRHS 0xC3
#define ST7789_VDVS 0xC4
#define ST7789_FRCTRL2 0xC6
#define ST7789_PWCTRL1 0xD0
#define ST7789_PVGAMCTRL 0xE0
#define ST7789_NVGAMCTRL 0xE1

void ST7789_Init(void)
{
    // Hardware reset sequence
    ST7789_RST_HIGH();
    HAL_Delay(1);
    ST7789_RST_LOW();
    HAL_Delay(10);
    ST7789_RST_HIGH();
    HAL_Delay(120);

    ST7789_CS_HIGH();

    // Pixel format - 16-bit color
    ST7789_WriteCommand(ST7789_COLMOD);
    ST7789_WriteData(0x05);

    // Memory access control - default orientation
    ST7789_WriteCommand(ST7789_MADCTL);

    ST7789_WriteData(0x08); // 0x00

    // Frame rate control
    ST7789_WriteCommand(ST7789_PORCTRL);
    ST7789_WriteData(0x05);
    ST7789_WriteData(0x05);
    ST7789_WriteData(0x00);
    ST7789_WriteData(0x33);
    ST7789_WriteData(0x33);

    ST7789_WriteCommand(ST7789_GCTRL);
    ST7789_WriteData(0x35);

    // Power settings
    ST7789_WriteCommand(ST7789_VCOMS);
    ST7789_WriteData(0x3F);

    ST7789_WriteCommand(ST7789_LCMCTRL);
    ST7789_WriteData(0x2C);

    ST7789_WriteCommand(ST7789_VDVVRHEN);
    ST7789_WriteData(0x01);

    ST7789_WriteCommand(ST7789_VRHS);
    ST7789_WriteData(0x0F);

    ST7789_WriteCommand(ST7789_VDVS);
    ST7789_WriteData(0x20);

    ST7789_WriteCommand(ST7789_FRCTRL2);
    ST7789_WriteData(0x01);

    ST7789_WriteCommand(ST7789_PWCTRL1);
    ST7789_WriteData(0xA4);
    ST7789_WriteData(0xA1);

    ST7789_WriteCommand(0xE8);
    ST7789_WriteData(0x03);

    ST7789_WriteCommand(0xE9);
    ST7789_WriteData(0x09);
    ST7789_WriteData(0x09);
    ST7789_WriteData(0x08);

    // Gamma settings
    ST7789_WriteCommand(ST7789_PVGAMCTRL);
    ST7789_WriteData(0xD0);
    ST7789_WriteData(0x05);
    ST7789_WriteData(0x09);
    ST7789_WriteData(0x09);
    ST7789_WriteData(0x08);
    ST7789_WriteData(0x14);
    ST7789_WriteData(0x28);
    ST7789_WriteData(0x33);
    ST7789_WriteData(0x3F);
    ST7789_WriteData(0x07);
    ST7789_WriteData(0x13);
    ST7789_WriteData(0x14);
    ST7789_WriteData(0x28);
    ST7789_WriteData(0x30);

    ST7789_WriteCommand(ST7789_NVGAMCTRL);
    ST7789_WriteData(0xD0);
    ST7789_WriteData(0x05);
    ST7789_WriteData(0x09);
    ST7789_WriteData(0x09);
    ST7789_WriteData(0x08);
    ST7789_WriteData(0x03);
    ST7789_WriteData(0x24);
    ST7789_WriteData(0x32);
    ST7789_WriteData(0x32);
    ST7789_WriteData(0x3B);
    ST7789_WriteData(0x38);
    ST7789_WriteData(0x14);
    ST7789_WriteData(0x13);
    ST7789_WriteData(0x28);
    ST7789_WriteData(0x2F);

    ST7789_WriteCommand(ST7789_INVON);

    // Set display window to full screen
    ST7789_WriteCommand(ST7789_CASET);
    ST7789_WriteData(0x00);
    ST7789_WriteData(0x00);
    ST7789_WriteData(0x00);
    ST7789_WriteData(0xEF); // 239

    ST7789_WriteCommand(ST7789_RASET);
    ST7789_WriteData(0x00);
    ST7789_WriteData(0x00);
    ST7789_WriteData(0x01);
    ST7789_WriteData(0x3F); // 319

    // Exit sleep and turn on display
    ST7789_WriteCommand(ST7789_SLPOUT);
    HAL_Delay(120);

    ST7789_WriteCommand(ST7789_DISPON);
    ST7789_WriteCommand(ST7789_RAMWR);
}

void ST7789_WriteFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color)
{
    if ((x >= ST7789_WIDTH) || (y >= ST7789_HEIGHT))
        return;

    int16_t x2 = x + w - 1;
    int16_t y2 = y + h - 1;

    if ((x2 < 0) || (y2 < 0))
        return;

    // Clip to screen bounds
    if (x < 0)
        x = 0;
    if (y < 0)
        y = 0;
    if (x2 >= ST7789_WIDTH)
        x2 = ST7789_WIDTH - 1;
    if (y2 >= ST7789_HEIGHT)
        y2 = ST7789_HEIGHT - 1;

    ST7789_SetWindow(x, y, x2, y2);

    uint32_t pixels = (uint32_t)(x2 - x + 1) * (y2 - y + 1);

    // Prepare color bytes (big-endian for ST7789)
    uint8_t color_hi = color >> 8;
    uint8_t color_lo = color & 0xFF;

    ST7789_CS_LOW();
    ST7789_DC_HIGH(); // Data mode

    for (uint32_t i = 0; i < pixels; i++)
    {
        HAL_SPI_Transmit(&hspi1, &color_hi, 1, HAL_MAX_DELAY);
        HAL_SPI_Transmit(&hspi1, &color_lo, 1, HAL_MAX_DELAY);
    }

    ST7789_CS_HIGH();
}

void ST7789_FillScreen(uint16_t color)
{
    ST7789_WriteFillRect(0, 0, ST7789_WIDTH, ST7789_HEIGHT, color);
}

void ST7789_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    ST7789_WriteCommand(ST7789_CASET);
    ST7789_WriteData(x0 >> 8);
    ST7789_WriteData(x0 & 0xFF);
    ST7789_WriteData(x1 >> 8);
    ST7789_WriteData(x1 & 0xFF);

    ST7789_WriteCommand(ST7789_RASET);
    ST7789_WriteData(y0 >> 8);
    ST7789_WriteData(y0 & 0xFF);
    ST7789_WriteData(y1 >> 8);
    ST7789_WriteData(y1 & 0xFF);

    ST7789_WriteCommand(ST7789_RAMWR);
}

void ST7789_WriteCommand(uint8_t cmd)
{
    ST7789_CS_LOW_DC_LOW(); // Command mode - single register write!

    HAL_SPI_Transmit(&hspi1, &cmd, 1, HAL_MAX_DELAY);

    ST7789_CS_HIGH();
}

void ST7789_WriteData(uint8_t data)
{
    ST7789_CS_LOW_DC_HIGH(); // Data mode - single register write!

    HAL_SPI_Transmit(&hspi1, &data, 1, HAL_MAX_DELAY);

    ST7789_CS_HIGH();
}

void ST7789V_SetRotation(uint8_t rotation)
{
    ST7789_WriteCommand(ST7789_MADCTL);
    rotation = rotation % 4;
    uint8_t madctl_data = 0x08;

    switch (rotation)
    {
    case 0:
        madctl_data |= 0x00;
        break;
    case 1:
        madctl_data |= 0x60; // (MX, MV)
        break;
    case 2:
        madctl_data |= 0xC0; // (MX, MY)
        break;
    case 3:
        madctl_data |= 0xA0; // (MY, MV)
        break;
    }
    ST7789_WriteData(madctl_data);
}
