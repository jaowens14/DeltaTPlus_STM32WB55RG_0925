/**
 * @file    st7789s.h
 * @brief   ST7789S LCD Driver Header for STM32 HAL
 * @author  Adapted from vendor example
 */

#ifndef ST7789S_H
#define ST7789S_H
#ifdef __cplusplus
extern "C"{
#endif
#include "main.h"
#include "spi.h"

/* Configuration - Adjust these to match your hardware */
// GPIO Pin definitions
#define LCD_CS_PIN    GPIO_PIN_3 //CS
#define LCD_CS_PORT   GPIOA
#define LCD_DC_PIN    GPIO_PIN_2   // Data/Command (RS in original code)
#define LCD_DC_PORT   GPIOA
#define LCD_RST_PIN   GPIO_PIN_1   // Reset
#define LCD_RST_PORT  GPIOA

// SPI handle - adjust to match your SPI instance
extern SPI_HandleTypeDef hspi1;

// Display dimensions
#define LCD_WIDTH   240
#define LCD_HEIGHT  320

// Common colors (RGB565 format)
#define BLACK     0x0000
#define WHITE     0xFFFF
#define RED       0xF800
#define GREEN     0x07E0
#define BLUE      0x001F
#define YELLOW    0xFFE0
#define CYAN      0x07FF
#define MAGENTA   0xF81F

/* Function Prototypes */

/**
 * @brief Initialize ST7789S LCD
 */
void LCD_Init(void);

/**
 * @brief Write command to LCD
 * @param cmd: Command byte to send
 */
void LCD_WriteCommand(uint8_t cmd);

/**
 * @brief Write data to LCD
 * @param data: Data byte to send
 */
void LCD_WriteData(uint8_t data);

/**
 * @brief Write multiple data bytes to LCD
 * @param data: Pointer to data array
 * @param len: Number of bytes to send
 */
void LCD_WriteDataMultiple(uint8_t *data, uint16_t len);

/**
 * @brief Write display data (16-bit color data)
 * @param data_high: High byte of 16-bit data
 * @param data_low: Low byte of 16-bit data
 */
void LCD_WriteDisplayData(uint8_t data_high, uint8_t data_low);

/**
 * @brief Enter sleep mode
 */
void LCD_EnterSleep(void);

/**
 * @brief Exit sleep mode
 */
void LCD_ExitSleep(void);

/**
 * @brief Set drawing window/area
 * @param x0: Start column
 * @param y0: Start row
 * @param x1: End column
 * @param y1: End row
 */
void LCD_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);

/**
 * @brief Fill entire screen with a color
 * @param color: 16-bit RGB565 color
 */
void LCD_FillScreen(uint16_t color);

/**
 * @brief Draw a single pixel
 * @param x: X coordinate
 * @param y: Y coordinate
 * @param color: 16-bit RGB565 color
 */
void LCD_DrawPixel(uint16_t x, uint16_t y, uint16_t color);

/**
 * @brief Fill a rectangular area with color
 * @param x: X coordinate
 * @param y: Y coordinate
 * @param width: Rectangle width
 * @param height: Rectangle height
 * @param color: 16-bit RGB565 color
 */
void LCD_FillRect(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t color);

/**
 * @brief Convert RGB888 to RGB565
 * @param r: Red component (0-255)
 * @param g: Green component (0-255)
 * @param b: Blue component (0-255)
 * @return 16-bit RGB565 color
 */
uint16_t LCD_RGB565(uint8_t r, uint8_t g, uint8_t b);
void LCD_BasicCommTest(void);
#ifdef __cplusplus
} /* extern "C" */
#endif
#endif /* ST7789S_H */
