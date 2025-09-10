#include "Screen.hpp"
#include "ST7789V_STM32.h"
#include "Adafruit_GFX.h"
#include <cmath>

inline double radians(double degrees)
{
    return degrees * (M_PI / 180.0);
}

void Screen::renderMeter()

// void Screen::renderMeter(GFXcanvas16 &canvas)
{

    // background
    // canvas.fillRect(0, 0, canvas.width(), canvas.height(), BACKGROUND_COLOR);

    canvas.fillScreen(BACKGROUND_COLOR);

    // border
    for (int i = 0; i < 3; i++)
    {
        canvas.drawRect(overallBorderX - i, overallBorderY - i, overallBorderWidth + 2 * i, overallBorderHeight + 2 * i, TEXT_COLOR);
    }
    // yield();
    // status border
    canvas.drawRect(statusBorderX, statusBorderY, statusWidth, statusHeight, TEXT_COLOR);

    canvas.drawRect(meterX, meterY, meterWidth, meterHeight, TEXT_COLOR);
    canvas.drawRect(labelX, labelY, labelWidth, labelHeight, TEXT_COLOR);
    canvas.drawRect(buttonBorderX, buttonBorderY, buttonBorderWidth, buttonBorderHeight, TEXT_COLOR);

    canvas.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
    canvas.fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);

    canvas.drawPixel(10, 10, ACCENT_COLOR);
    canvas.drawPixel(11, 10, ACCENT_COLOR);
    canvas.drawPixel(12, 10, ACCENT_COLOR);
    canvas.drawPixel(13, 10, ACCENT_COLOR);
    canvas.drawPixel(10, 11, ACCENT_COLOR);
    canvas.drawPixel(10, 12, ACCENT_COLOR);
    canvas.drawPixel(10, 13, ACCENT_COLOR);

    // calculate the size of a few things....
    canvas.getTextBounds("40%", 0, 0, &batteryTextX, &batteryTextY, &batteryW, &batteryH);
    // origin of battery text based on its size...
    batteryX = overallBorderWidth - batteryW - 2 * batterySpacer;
    batteryY = statusBorderY + statusHeight / 2 + batteryH / 2;

    // // Serial.println(batteryX);
    // // Serial.println(batteryY);
    canvas.setTextColor(TEXT_COLOR);
    canvas.setCursor(batteryX, batteryY);
    canvas.print("40%");

    // calculate size of charging:
    canvas.getTextBounds("+ ", 0, 0, &chargingTextX, &chargingTextY, &chargingW, &chargingH);
    chargingX = overallBorderWidth - batteryW - chargingW - 2 * batterySpacer;
    chargingY = statusBorderY + statusHeight / 2 + chargingH / 2;
    canvas.setTextColor(TEXT_COLOR);
    // // Serial.println(chargingX);
    // // Serial.println(chargingY);
    canvas.setCursor(chargingX, chargingY);
    canvas.print("+");

    // calculate size of settings:
    canvas.getTextBounds("Settings", 0, 0, &label1X, &label1Y, &label1W, &label1H);
    label1X = buttonX1 + buttonWidth / 2 - label1W / 2;
    label1Y = buttonY1 + buttonHeight - label1H;
    canvas.setTextColor(BACKGROUND_COLOR);
    // Serial.println(label1X);
    // Serial.println(label1Y);
    canvas.setCursor(label1X, label1Y);
    canvas.print("Settings");

    canvas.getTextBounds("Sleep", 0, 0, &label2X, &label2Y, &label2W, &label2H);
    label2X = buttonX2 + buttonWidth / 2 - label2W / 2;
    label2Y = buttonY2 + buttonHeight - label2H;
    canvas.setTextColor(BACKGROUND_COLOR);
    // Serial.println(label2X);
    // Serial.println(label2Y);
    canvas.setCursor(label2X, label2Y);
    canvas.print("Sleep");

    drawMeterLines(meterOriginX, meterOriginY, meterHeight - 40, -8, 8);

    canvas.getTextBounds("DELTA T PROBE", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
    textX = labelX + labelWidth / 2 - textWidth / 2;
    textY = labelY + textHeight + meterSpacer;
    canvas.setTextColor(TEXT_COLOR);

    canvas.setCursor(textX, textY);
    canvas.print("DELTA T PROBE");

    canvas.getTextBounds("The Instrument Company", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
    textX = labelX + labelWidth / 2 - textWidth / 2;
    textY = labelY + textHeight * 2 + meterSpacer;
    canvas.setTextColor(TEXT_COLOR);

    canvas.setCursor(textX, textY);
    canvas.print("The Instrument Company");

    canvas.getTextBounds("Dr. Ed Carr, Fort Collins, CO", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);
    textX = labelX + labelWidth / 2 - textWidth / 2;
    textY = labelY + textHeight * 3 + meterSpacer * 2;
    canvas.setTextColor(TEXT_COLOR);

    canvas.setCursor(textX, textY);
    canvas.print("Dr. Ed Carr, Fort Collins, CO");

    // canvas.getTextBounds("The Instrument Company", 0, 0, &textOriginX, &textOriginY, &tictextWidth, &tictextHeight);
    // canvas.setCursor(width / 2 - tictextWidth / 2, screenOffset + statusHeight + meterHeight + dttextHeight + tictextHeight + screenOffset);
    // canvas.print("The Instrument Company");
    //
    // canvas.getTextBounds("Fort Collins, CO", 0, 0, &textOriginX, &textOriginY, &fccotextWidth, &fccotextHeight);
    // canvas.setCursor(width / 2 - fccotextWidth / 2, screenOffset + statusHeight + meterHeight + dttextHeight + tictextHeight + fccotextHeight + screenOffset);
    // canvas.print("Fort Collins, CO");
    //
}

void Screen::drawMeterLines(int centerX, int centerY, int radius, int lineStart, int lineEnd)
{ // points = 8 - - 8 = 16
    int points = lineEnd - lineStart;
    //[0 1 2 ... 17 18]
    canvas.fillCircle(centerX, centerY, 3, ST7789V_BLACK);

    // Loop to draw the lines
    for (int i = lineStart; i <= lineEnd; i++)
    {
        // Calculate angle for the line
        // float angle = (i * (90.0 / points)) + 235 - 90 / points;
        // goes from -8 * 90/16 + 270 = 225, to 8 * 90/18 + 270 = 315
        float angle = (i * (90.0 / points)) + 270; // distribute over 90 deg and shift by 270

        // Convert angle to radians
        float rad = radians(angle);

        // Calculate the endpoint of the line (on the circle's perimeter) // outer ring i think
        int xEnd = centerX + radius * cos(rad);
        int yEnd = centerY + radius * sin(rad);

        // Calculate the endpoint of the line (on the circle's perimeter)
        int xStart = centerX + (radius - 20) * cos(rad);
        int yStart = centerY + (radius - 20) * sin(rad);

        // Draw a normal line
        canvas.drawLine(xStart, yStart, xEnd, yEnd, ST7789V_BLACK);

        if (i == lineStart)
        {

            canvas.setCursor(overallBorderX + meterSpacer, yEnd - 10);
            canvas.setTextColor(TEXT_COLOR);
            canvas.print("25");
        }

        if (i == -3)
        {
            canvas.setTextColor(TEXT_COLOR);

            canvas.setCursor(xEnd, yEnd - 20);

            canvas.print("LO");

            canvas.getTextBounds("HI", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);

            canvas.setCursor(overallBorderWidth - xEnd - textWidth, yEnd - 20);

            canvas.print("HI");
        }

        if (i == 0)
        {
            canvas.getTextBounds("0", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);

            canvas.setCursor(xEnd - textWidth / 2, yEnd - 5);
            canvas.setTextColor(TEXT_COLOR);

            canvas.print("0");
        }

        if (i == lineEnd)
        {
            canvas.getTextBounds("25", 0, 0, &textOriginX, &textOriginY, &textWidth, &textHeight);

            canvas.setCursor(overallBorderWidth - textWidth - meterSpacer, yEnd - 10);
            canvas.setTextColor(TEXT_COLOR);
            canvas.print("25");
        }

        // draw all the little tick marks
        for (int i = lineStart * 4; i <= lineEnd * 4; i++)
        {
            float angle = (i * 0.25 * (90.0 / points)) + 270; // distribute over 90 deg and shift by 270

            // Convert angle to radians
            float rad = radians(angle);

            // Calculate the endpoint of the line (on the circle's perimeter) // outer ring i think
            int xEnd = centerX + (radius - 10) * cos(rad);
            int yEnd = centerY + (radius - 10) * sin(rad);

            // Calculate the endpoint of the line (on the circle's perimeter)
            int xStart = centerX + (radius - 20) * cos(rad);
            int yStart = centerY + (radius - 20) * sin(rad);

            // Draw a normal line
            canvas.drawLine(xStart, yStart, xEnd, yEnd, ST7789V_BLACK);
        }
    }
}
