/**
 * @file    Screen.h
 * @brief   Screen rendering functions for ST7789S LCD
 * @author  Converted from C++ Adafruit GFX implementation
 */

#ifndef SCREEN_H
#define SCREEN_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// Function prototypes
void renderMeter(void);
void drawMeterLines(int16_t centerX, int16_t centerY, int16_t radius, int16_t lineStart, int16_t lineEnd);

// Graphics helper functions
void getTextBounds(const char* text, int16_t x, int16_t y,
                   int16_t* x1, int16_t* y1, uint16_t* w, uint16_t* h);
void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
void fillRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color);
void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
void fillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void setCursorAndPrint(int16_t x, int16_t y, const char* text, uint16_t color);
float radians(float degrees);

#ifdef __cplusplus
}
#endif

#endif // SCREEN_H
