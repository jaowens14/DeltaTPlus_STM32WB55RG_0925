#ifndef ST7789_H
#define ST7789_H

#include "main.h"
#include <stdint.h>

// Adjust these pins to match your hardware connections
#define ST7789_CS_PORT GPIOA
#define ST7789_CS_PIN GPIO_PIN_3
#define ST7789_DC_PORT GPIOA
#define ST7789_DC_PIN GPIO_PIN_2
#define ST7789_RST_PORT GPIOA
#define ST7789_RST_PIN GPIO_PIN_1

// Display dimensions (based on vendor code)
#define ST7789_WIDTH 240
#define ST7789_HEIGHT 320

// Pin control macros
#define ST7789_CS_LOW() HAL_GPIO_WritePin(ST7789_CS_PORT, ST7789_CS_PIN, GPIO_PIN_RESET)
#define ST7789_CS_HIGH() HAL_GPIO_WritePin(ST7789_CS_PORT, ST7789_CS_PIN, GPIO_PIN_SET)
#define ST7789_DC_LOW() HAL_GPIO_WritePin(ST7789_DC_PORT, ST7789_DC_PIN, GPIO_PIN_RESET)
#define ST7789_DC_HIGH() HAL_GPIO_WritePin(ST7789_DC_PORT, ST7789_DC_PIN, GPIO_PIN_SET)
#define ST7789_RST_LOW() HAL_GPIO_WritePin(ST7789_RST_PORT, ST7789_RST_PIN, GPIO_PIN_RESET)
#define ST7789_RST_HIGH() HAL_GPIO_WritePin(ST7789_RST_PORT, ST7789_RST_PIN, GPIO_PIN_SET)

#define ST7789_CS_PIN_NUM 3
#define ST7789_DC_PIN_NUM 2
#define ST7789_RST_PIN_NUM 1
// CS LOW + DC LOW (command mode start)
#define ST7789_CS_LOW_DC_LOW() \
    GPIOA->BSRR = ((1U << (ST7789_CS_PIN_NUM + 16)) | (1U << (ST7789_DC_PIN_NUM + 16)))

// CS LOW + DC HIGH (data mode start)
#define ST7789_CS_LOW_DC_HIGH() \
    GPIOA->BSRR = ((1U << (ST7789_CS_PIN_NUM + 16)) | (1U << ST7789_DC_PIN_NUM))

// CS HIGH (end transaction)
#define ST7789_CS_HIGH_ONLY() \
    GPIOA->BSRR = (1U << ST7789_CS_PIN_NUM)

#ifdef __cplusplus
extern "C"
{
#endif

    // Initialization and control functions
    void ST7789_Init(void);
    void ST7789_WritePixel(int16_t x, int16_t y, uint16_t color);
    void ST7789_WriteFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
    void ST7789_FillScreen(uint16_t color);
    void ST7789_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
    void ST7789V_SetRotation(uint8_t rotation);
    void ST7789_WriteCommand(uint8_t cmd);
    void ST7789_WriteData8(uint8_t data);
    void ST7789_WriteData16(uint16_t data);

#ifdef __cplusplus
}
#endif

#endif // ST7789_H
