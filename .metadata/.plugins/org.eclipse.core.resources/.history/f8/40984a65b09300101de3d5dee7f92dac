/*
 * screen.c
 *
 *  Created on: Jun 27, 2025
 *      Author: jaowe
 */

/**
 * @file    Screen.c
 * @brief   Screen rendering functions for ST7789S LCD
 * @author  Converted from C++ Adafruit GFX implementation
 */

#include "Screen.h"
#include "TFT_ST7789S.h"
#include <math.h>
#include <string.h>
#include <stdio.h>

// Color definitions (RGB565)
#define BACKGROUND_COLOR 0xFFDC // Black
#define TEXT_COLOR 0x29A3       // White
#define ACCENT_COLOR 0x6367     // Green
#define ILI9341_BLACK 0x0000    // Black

// Screen dimensions and layout constants
static const int16_t overallBorderX = 5;
static const int16_t overallBorderY = 5;
static const int16_t overallBorderWidth = LCD_WIDTH - 10;
static const int16_t overallBorderHeight = LCD_HEIGHT - 10;

static const int16_t statusBorderX = 10;
static const int16_t statusBorderY = 10;
static const int16_t statusWidth = LCD_WIDTH - 20;
static const int16_t statusHeight = 30;

static const int16_t meterX = 10;
static const int16_t meterY = 50;
static const int16_t meterWidth = LCD_WIDTH - 20;
static const int16_t meterHeight = 150;
static const int16_t meterOriginX = LCD_WIDTH / 2;
static const int16_t meterOriginY = meterY + meterHeight - 20;

static const int16_t labelX = 10;
static const int16_t labelY = 210;
static const int16_t labelWidth = LCD_WIDTH - 20;
static const int16_t labelHeight = 80;

static const int16_t buttonBorderX = 10;
static const int16_t buttonBorderY = 300;
static const int16_t buttonBorderWidth = LCD_WIDTH - 20;
static const int16_t buttonBorderHeight = 50;

static const int16_t buttonWidth = 80;
static const int16_t buttonHeight = 35;
static const int16_t buttonRadius = 5;
static const int16_t buttonX1 = 30;
static const int16_t buttonY1 = 310;
static const int16_t buttonX2 = LCD_WIDTH - 110;
static const int16_t buttonY2 = 310;

static const int16_t meterSpacer = 5;
static const int16_t batterySpacer = 5;

// Font metrics (approximate for 8x8 font)
#define FONT_WIDTH 6
#define FONT_HEIGHT 8

/**
 * @brief Calculate text bounds (simple approximation)
 */
void getTextBounds(const char *text, int16_t x, int16_t y,
                   int16_t *x1, int16_t *y1, uint16_t *w, uint16_t *h)
{
    *x1 = x;
    *y1 = y;
    *w = strlen(text) * FONT_WIDTH;
    *h = FONT_HEIGHT;
}

/**
 * @brief Draw a rectangle outline
 */
void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color)
{
    // Top line
    for (int16_t i = 0; i < w; i++)
    {
        LCD_DrawPixel(x + i, y, color);
    }
    // Bottom line
    for (int16_t i = 0; i < w; i++)
    {
        LCD_DrawPixel(x + i, y + h - 1, color);
    }
    // Left line
    for (int16_t i = 0; i < h; i++)
    {
        LCD_DrawPixel(x, y + i, color);
    }
    // Right line
    for (int16_t i = 0; i < h; i++)
    {
        LCD_DrawPixel(x + w - 1, y + i, color);
    }
}

/**
 * @brief Fill a rounded rectangle
 */
void fillRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color)
{
    // For simplicity, just draw a regular filled rectangle
    // You can implement proper rounded corners later if needed
    LCD_FillRect(x, y, w, h, color);
}

/**
 * @brief Draw a line using Bresenham's algorithm
 */
void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color)
{
    int16_t dx = abs(x1 - x0);
    int16_t dy = abs(y1 - y0);
    int16_t sx = (x0 < x1) ? 1 : -1;
    int16_t sy = (y0 < y1) ? 1 : -1;
    int16_t err = dx - dy;

    while (1)
    {
        LCD_DrawPixel(x0, y0, color);

        if (x0 == x1 && y0 == y1)
            break;

        int16_t e2 = 2 * err;
        if (e2 > -dy)
        {
            err -= dy;
            x0 += sx;
        }
        if (e2 < dx)
        {
            err += dx;
            y0 += sy;
        }
    }
}

/**
 * @brief Draw a filled circle
 */
void fillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color)
{
    for (int16_t y = -r; y <= r; y++)
    {
        for (int16_t x = -r; x <= r; x++)
        {
            if (x * x + y * y <= r * r)
            {
                LCD_DrawPixel(x0 + x, y0 + y, color);
            }
        }
    }
}

/**
 * @brief Simple text rendering (you'll need to implement a proper font)
 */
void setCursorAndPrint(int16_t x, int16_t y, const char *text, uint16_t color)
{
    // This is a placeholder - you'll need to implement actual text rendering
    // For now, just draw a small rectangle to show where text would go
    int16_t text_width = strlen(text) * FONT_WIDTH;
    drawRect(x, y - FONT_HEIGHT, text_width, FONT_HEIGHT, color);

    // You would implement actual character rendering here
    // This might involve storing font bitmaps and drawing each character pixel by pixel
}

/**
 * @brief Convert degrees to radians
 */

/**
 * @brief Draw meter tick marks and labels
 */
void drawMeterLines(int16_t centerX, int16_t centerY, int16_t radius, int16_t lineStart, int16_t lineEnd)
{
    int16_t points = lineEnd - lineStart;
    int16_t textOriginX, textOriginY;
    uint16_t textWidth, textHeight;

    // Draw center dot
    fillCircle(centerX, centerY, 3, ILI9341_BLACK);

    // Draw main tick marks
    for (int16_t i = lineStart; i <= lineEnd; i++)
    {
        float angle = (i * (90.0f / points)) + 270.0f;
        float rad = radians(angle);

        int16_t xEnd = centerX + radius * cosf(rad);
        int16_t yEnd = centerY + radius * sinf(rad);
        int16_t xStart = centerX + (radius - 20) * cosf(rad);
        int16_t yStart = centerY + (radius - 20) * sinf(rad);

        drawLine(xStart, yStart, xEnd, yEnd, ILI9341_BLACK);

        // Draw labels at specific positions
        if (i == lineStart)
        {
            setCursorAndPrint(overallBorderX + meterSpacer, yEnd - 10, "25", TEXT_COLOR);
        }

        if (i == -3)
        {
            setCursorAndPrint(xEnd, yEnd - 20, "LO", TEXT_COLOR);
            getTextBounds("HI", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
            setCursorAndPrint(overallBorderWidth - xEnd - textWidth, yEnd - 20, "HI", TEXT_COLOR);
        }

        if (i == 0)
        {
            getTextBounds("0", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
            setCursorAndPrint(xEnd - textWidth / 2, yEnd - 5, "0", TEXT_COLOR);
        }

        if (i == lineEnd)
        {
            getTextBounds("25", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
            setCursorAndPrint(overallBorderWidth - textWidth - meterSpacer, yEnd - 10, "25", TEXT_COLOR);
        }
    }

    // Draw fine tick marks
    for (int16_t i = lineStart * 4; i <= lineEnd * 4; i++)
    {
        float angle = (i * 0.25f * (90.0f / points)) + 270.0f;
        float rad = radians(angle);

        int16_t xEnd = centerX + (radius - 10) * cosf(rad);
        int16_t yEnd = centerY + (radius - 10) * sinf(rad);
        int16_t xStart = centerX + (radius - 20) * cosf(rad);
        int16_t yStart = centerY + (radius - 20) * sinf(rad);

        drawLine(xStart, yStart, xEnd, yEnd, ILI9341_BLACK);
    }
}

/**
 * @brief Render the main meter display
 */
void renderMeter(void)
{
    int16_t batteryTextX, batteryTextY, chargingTextX, chargingTextY;
    uint16_t batteryW, batteryH, chargingW, chargingH;
    int16_t batteryX, batteryY, chargingX, chargingY;
    int16_t label1X, label1Y, label2X, label2Y;
    uint16_t label1W, label1H, label2W, label2H;
    int16_t textOriginX, textOriginY, textX, textY;
    uint16_t textWidth, textHeight;

    // Fill background
    LCD_FillScreen(BACKGROUND_COLOR);

    // Draw main border (3 pixel thick)
    for (int i = 0; i < 3; i++)
    {
        drawRect(overallBorderX - i, overallBorderY - i,
                 overallBorderWidth + 2 * i, overallBorderHeight + 2 * i, TEXT_COLOR);
    }

    // Draw section borders
    drawRect(statusBorderX, statusBorderY, statusWidth, statusHeight, TEXT_COLOR);
    drawRect(meterX, meterY, meterWidth, meterHeight, TEXT_COLOR);
    drawRect(labelX, labelY, labelWidth, labelHeight, TEXT_COLOR);
    drawRect(buttonBorderX, buttonBorderY, buttonBorderWidth, buttonBorderHeight, TEXT_COLOR);

    // Draw buttons
    fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
    fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);

    // Draw test pixels (cross pattern)
    LCD_DrawPixel(10, 10, ACCENT_COLOR);
    LCD_DrawPixel(11, 10, ACCENT_COLOR);
    LCD_DrawPixel(12, 10, ACCENT_COLOR);
    LCD_DrawPixel(13, 10, ACCENT_COLOR);
    LCD_DrawPixel(10, 11, ACCENT_COLOR);
    LCD_DrawPixel(10, 12, ACCENT_COLOR);
    LCD_DrawPixel(10, 13, ACCENT_COLOR);

    // Battery percentage text
    const char *batteryPercent = "85%"; // Example value - replace with actual battery reading
    getTextBounds(batteryPercent, 0, 0, &batteryTextX, &batteryTextY, &batteryW, &batteryH);
    batteryX = overallBorderWidth - batteryW - 2 * batterySpacer;
    batteryY = statusBorderY + statusHeight / 2 + batteryH / 2;
    setCursorAndPrint(batteryX, batteryY, batteryPercent, TEXT_COLOR);

    // Charging indicator
    getTextBounds("+ ", 0, 0, &chargingTextX, &chargingTextY, &chargingW, &chargingH);
    chargingX = overallBorderWidth - batteryW - chargingW - 2 * batterySpacer;
    chargingY = statusBorderY + statusHeight / 2 + chargingH / 2;
    setCursorAndPrint(chargingX, chargingY, "+", TEXT_COLOR);

    // Button labels
    getTextBounds("Settings", 0, 0, &textOriginX, &textOriginY, &label1W, &label1H);
    label1X = buttonX1 + buttonWidth / 2 - label1W / 2;
    label1Y = buttonY1 + buttonHeight - label1H;
    setCursorAndPrint(label1X, label1Y, "Settings", BACKGROUND_COLOR);

    getTextBounds("Sleep", 0, 0, &textOriginX, &textOriginY, &label2W, &label2H);
    label2X = buttonX2 + buttonWidth / 2 - label2W / 2;
    label2Y = buttonY2 + buttonHeight - label2H;
    setCursorAndPrint(label2X, label2Y, "Sleep", BACKGROUND_COLOR);

    // Draw meter tick marks
    drawMeterLines(meterOriginX, meterOriginY, meterHeight - 40, -8, 8);

    // Draw labels in the label section
    getTextBounds("DELTA T PROBE", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
    textX = labelX + labelWidth / 2 - textWidth / 2;
    textY = labelY + textHeight + meterSpacer;
    setCursorAndPrint(textX, textY, "DELTA T PROBE", TEXT_COLOR);

    getTextBounds("The Instrument Company", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
    textX = labelX + labelWidth / 2 - textWidth / 2;
    textY = labelY + textHeight * 2 + meterSpacer;
    setCursorAndPrint(textX, textY, "The Instrument Company", TEXT_COLOR);

    getTextBounds("Dr. Ed Carr, Fort Collins, CO", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
    textX = labelX + labelWidth / 2 - textWidth / 2;
    textY = labelY + textHeight * 3 + meterSpacer * 2;
    setCursorAndPrint(textX, textY, "Dr. Ed Carr, Fort Collins, CO", TEXT_COLOR);
}
