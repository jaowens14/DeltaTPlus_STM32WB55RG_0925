

#include "Screen.hpp"
#include "BatteryMonitor.hpp"
#include "Thermocouples.hpp"
#include "Touch.hpp"
#include "Switch.hpp"
#include <stdlib.h>
void Screen::updateMeter(void)
{
    snprintf(batteryLevel, sizeof(batteryLevel), "%d %%\r\n", BatteryMonitor::charge);

    canvas.getTextBounds(batteryLevel, 0, 0, &batteryTextX, &batteryTextY, &batteryW, &batteryH);
    batteryX = overallBorderWidth - batteryW - batterySpacer;

    // Clear the larger of the two areas (old and new position)
    int clearX = batteryX;
    int clearWidth = batteryX + batteryW - clearX;

    canvas.fillRect(clearX, batteryY - batteryH + 1,
                    clearWidth, batteryH, BACKGROUND_COLOR);

    // Draw new percentage
    canvas.setTextColor(TEXT_COLOR);
    canvas.setCursor(batteryX, batteryY);
    canvas.print(batteryLevel);

    if (!BatteryMonitor::charging)
    {
        canvas.drawChar(chargingX, chargingY, '+ ', BACKGROUND_COLOR, BACKGROUND_COLOR, 1);
        // Serial.println("not charging");
    }
    else
    {
        canvas.drawChar(chargingX, chargingY, '+ ', TEXT_COLOR, BACKGROUND_COLOR, 1);
        // Serial.println("charging");
    }

    canvas.setCursor(switchX, switchY);

    if (Switch::state != Switch::lastState)
    {

        if (Switch::state)
        {
            snprintf(switchBuffer, sizeof(switchBuffer), "HIGH\r\n");
        }
        else
        {
            snprintf(switchBuffer, sizeof(switchBuffer), "LOW\r\n");
        }

        int16_t x1, y1;
        uint16_t w, h;
        canvas.getTextBounds(lastSwitchBuffer, switchX, switchY, &x1, &y1, &w, &h); // calculate area to erase
        canvas.fillRect(x1, y1, w, h, BACKGROUND_COLOR);                            // erase

        canvas.setCursor(switchX, switchY); // draw new text
        canvas.setTextColor(TEXT_COLOR);
        canvas.print(switchBuffer);
        strcpy(lastSwitchBuffer, switchBuffer); // update buffer

        writeCanvasRegion(x1, y1, x1 + w, y1 + h);
        // writeCanvas();
        Switch::lastState = Switch::state;
    }

    needleAngle = Thermocouples::deltaTemp - 90.0;

    if (needleAngle > -45)
    {
        needleAngle = -45;
    }

    if (needleAngle < -135)
    {
        needleAngle = -135;
    }

    // 90 / 2 is degs per point
    // Convert angle to radians
    needleRad = radians(needleAngle);
    // Serial.println(needleAngle);

    // Calculate the endpoint of the line (on the circle's perimeter)
    needleX1 = ceil(float(meterOriginX) + (float(meterHeight) - 80) * std::cos(needleRad));
    needleY1 = ceil(float(meterOriginY) + (float(meterHeight) - 80) * std::sin(needleRad));
    // Serial.println(needleX1);
    // Serial.println(needleY1);
    //  Calculate the endpoint of the line (on the circle's perimeter)
    needleX2 = ceil(float(meterOriginX) + (float(meterHeight) - 160) * std::cos(needleRad));
    needleY2 = ceil(float(meterOriginY) + (float(meterHeight) - 160) * std::sin(needleRad));
    // needleX2 = float(meterOriginX) + (float(meterHeight) - 82) * std::cos(needleRad);
    // needleY2 = float(meterOriginY) + (float(meterHeight) - 82) * std::sin(needleRad);

    if (needleX1 != lastNeedleX1 && needleX1 != 0 && needleY1 != 0)
    {

        // Calculate bounding box BEFORE updating last position variables
        int minX = std::min(std::min(lastNeedleX1, lastNeedleX2), std::min(needleX1, needleX2)) - 2;
        int maxX = std::max(std::max(lastNeedleX1, lastNeedleX2), std::max(needleX1, needleX2)) + 2;
        int minY = std::min(std::min(lastNeedleY1, lastNeedleY2), std::min(needleY1, needleY2)) - 2;
        int maxY = std::max(std::max(lastNeedleY1, lastNeedleY2), std::max(needleY1, needleY2)) + 2;
        int theWidth = maxX - minX + 1;
        int theHeight = maxY - minY + 1;

        canvas.fillRect(minX, minY, theWidth, theHeight, BACKGROUND_COLOR);
        canvas.drawLine(needleX1, needleY1, needleX2, needleY2, ST7789V_BLACK);

        writeCanvasRegion(minX, minY, maxX, maxY);

        lastNeedleX1 = needleX1;
        lastNeedleX2 = needleX2;
        lastNeedleY1 = needleY1;
        lastNeedleY2 = needleY2;
    }

    if (button1MinX < Touch::x && Touch::x < button1MaxX && button1MinY < Touch::y && Touch::y < button1MaxY)
    { // touch point in the left button
        // Serial.println("you pressed the left button");

        switchPage = true;
        // Serial.println("switchpage");

        canvas.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, TEXT_COLOR);

        canvas.getTextBounds("Settings", 0, 0, &label1X, &label1Y, &label1W, &label1H);
        label1X = buttonX1 + buttonWidth / 2 - label1W / 2;
        label1Y = buttonY1 + buttonHeight - label1H;
        canvas.setTextColor(BACKGROUND_COLOR);
        // Serial.println(label1X);
        // Serial.println(label1Y);
        canvas.setCursor(label1X, label1Y);
        canvas.print("Settings");

        canvas.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
        canvas.setCursor(label1X, label1Y);

        canvas.print("Settings");
    }

    if (button2MinX < Touch::x && Touch::x < button2MaxX && button2MinY < Touch::y && Touch::y < button2MaxY)
    { // touch point in right button

        snprintf((char *)UART_BUFFER, sizeof(UART_BUFFER), "CALIBRATE PRESSED\r\n");
        HAL_UART_Transmit(&huart1, UART_BUFFER, strlen((char *)UART_BUFFER), 300);

        Thermocouples::deltaTempOffset = Thermocouples::deltaTemp;
        Touch::x = 0;
        Touch::y = 0;
    }
} // update meter f(x)
