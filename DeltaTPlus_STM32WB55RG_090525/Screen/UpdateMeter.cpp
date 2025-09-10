

#include "Screen.hpp"
#include "BatteryMonitor.hpp"
#include "Thermocouples.hpp"
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

    //{
    //  Serial.println(Thermocouples::deltaTemp);
    //  Serial.println();

    needleAngle = Thermocouples::deltaTemp - 90.0;

    canvas.setCursor(switchX, switchY);
    if (Switch::state)
    {
        snprintf(switchBuffer, sizeof(switchBuffer), "HIGH\r\n");
    }
    else
    {
        snprintf(switchBuffer, sizeof(switchBuffer), "LOW\r\n");
    }

    // only if state changes
    if (strcmp(switchBuffer, lastSwitchBuffer) != 0)
    {

        int16_t x1, y1;
        uint16_t w, h;
        canvas.getTextBounds(lastSwitchBuffer, switchX, switchY, &x1, &y1, &w, &h); // calculate area to erase
        canvas.fillRect(x1, y1, w, h, BACKGROUND_COLOR);                            // erase

        canvas.setCursor(switchX, switchY); // draw new text
        canvas.setTextColor(TEXT_COLOR);
        canvas.print(switchBuffer);
        strcpy(lastSwitchBuffer, switchBuffer); // update buffer
    }

    // are switchbuffer, lastswitchbuffer, text position, and uint16_t passed in??

    if (needleAngle > -45)
    {
        needleAngle = -45;
    }

    if (needleAngle < -135)
    {
        needleAngle = -135;
    }

    //-45 to -135

    // snprintf(usbBuffer, sizeof(usbBuffer), "needleAngle: %f\r\n", needleAngle);
    //  CDC_Transmit_FS((uint8_t *)usbBuffer, strlen(usbBuffer));
    //
    //   if (currentAngle > needleAngle + angleDeadBandTolerance)
    //{
    //       needleAngle = needleAngle + 1.0; // increase by 1 deg
    //   }
    //   if (currentAngle < needleAngle - angleDeadBandTolerance)
    //{
    //       needleAngle = needleAngle - 1.0; // decrease by 1 deg
    //   }

    // 90 / 2 is degs per point
    // Convert angle to radians
    needleRad = radians(needleAngle);
    // Serial.println(needleAngle);

    // Calculate the endpoint of the line (on the circle's perimeter)
    needleX1 = float(meterOriginX) + (float(meterHeight) - 80) * std::cos(needleRad);
    needleY1 = float(meterOriginY) + (float(meterHeight) - 80) * std::sin(needleRad);
    // Serial.println(needleX1);
    // Serial.println(needleY1);
    //  Calculate the endpoint of the line (on the circle's perimeter)
    needleX2 = float(meterOriginX) + (float(meterHeight) - 170) * std::cos(needleRad);
    needleY2 = float(meterOriginY) + (float(meterHeight) - 170) * std::sin(needleRad);

    canvas.drawLine(lastNeedleX1, lastNeedleY1, lastNeedleX2, lastNeedleY2, BACKGROUND_COLOR);
    // writeNeedleFromCanvas(x0, y0, x1, y1, color);

    // Draw a normal line
    canvas.drawLine(needleX1, needleY1, needleX2, needleY2, ST7789V_BLACK);
    // writeNeedleFromCanvas(x0, y0, x1, y1, color);

    lastNeedleX1 = needleX1;
    lastNeedleX2 = needleX2;
    lastNeedleY1 = needleY1;
    lastNeedleY2 = needleY2;
    // renderDelay = 15; // about a 60hz refresh rate
    writeCanvas();

    // writeCanvas();
    //}

    // if (button1MinX < Touch::x && Touch::x < button1MaxX && button1MinY < Touch::y && Touch::y < button1MaxY)
    // { // touch point in the left button
    //     Serial.println("you pressed the left button");
    //
    //     switchPage = true;
    //     Serial.println("switchpage");
    //
    //     canvas.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, TEXT_COLOR);
    //
    //     canvas.getTextBounds("Settings", 0, 0, &label1X, &label1Y, &label1W, &label1H);
    //     label1X = buttonX1 + buttonWidth / 2 - label1W / 2;
    //     label1Y = buttonY1 + buttonHeight - label1H;
    //     canvas.setTextColor(BACKGROUND_COLOR);
    //     Serial.println(label1X);
    //     Serial.println(label1Y);
    //     canvas.setCursor(label1X, label1Y);
    //     canvas.print("Settings");
    //
    //     canvas.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
    //     canvas.setCursor(label1X, label1Y);
    //
    //     canvas.print("Settings");
    // }
    //
    // if (button2MinX < Touch::x && Touch::x < button2MaxX && button2MinY < Touch::y && Touch::y < button2MaxY)
    // { // touch point in right button
    //     Serial.println("you pressed the right button");
    //     canvas.fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, TEXT_COLOR);
    //     canvas.getTextBounds("Sleep", 0, 0, &label2X, &label2Y, &label2W, &label2H);
    //     label2X = buttonX2 + buttonWidth / 2 - label2W / 2;
    //     label2Y = buttonY2 + buttonHeight - label2H;
    //     canvas.setTextColor(BACKGROUND_COLOR);
    //     Serial.println(label2X);
    //     Serial.println(label2Y);
    //     canvas.setCursor(label2X, label2Y);
    //     canvas.print("Sleep");
    //     canvas.fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
    //     canvas.setCursor(label2X, label2Y);
    //
    //     canvas.print("Sleep");
    //
    //     // this needs work probably sleep then wait for accelerometer
    //     ledcWrite(backlightChannel, 0);
    //     esp_sleep_enable_timer_wakeup(1000000);
    //     esp_light_sleep_start();
    //     fadeIn();
    // }
} // update meter f(x)
