
/*


#include "Screen.hpp"
void Screen::updateSettings(void)
{

    if (!renderDelay)
    {

        tft.setTextSize(1);
        int previousBatteryX = 0; // Store previous position

        // In your update function:
        if (BatteryMonitor::newData)
        {
            // Calculate new position
            tft.getTextBounds(BatteryMonitor::percent, 0, 0, &batteryTextX, &batteryTextY, &batteryW, &batteryH);
            batteryX = overallBorderWidth - batteryW - batterySpacer;

            // Clear the larger of the two areas (old and new position)
            int clearX = min(previousBatteryX, batteryX);
            int clearWidth = max(previousBatteryX + batteryW,
                                 batteryX + batteryW) -
                             clearX;

            tft.fillRect(clearX, batteryY - batteryH + 1,
                         clearWidth, batteryH, BACKGROUND_COLOR);

            // Draw new percentage
            tft.setTextColor(TEXT_COLOR);
            tft.setCursor(batteryX, batteryY);
            tft.print(BatteryMonitor::percent);

            // Store position for next update
            previousBatteryX = batteryX;
        }

        if (!BatteryMonitor::charging)
        {
            tft.drawChar(chargingX, chargingY, '+ ', BACKGROUND_COLOR, BACKGROUND_COLOR, 1);
            // Serial.println("not charging");
        }
        else
        {
            tft.drawChar(chargingX, chargingY, '+ ', TEXT_COLOR, BACKGROUND_COLOR, 1);
            // Serial.println("charging");
        }
    }

    if (button1MinX < Touch::x && Touch::x < button1MaxX && button1MinY < Touch::y && Touch::y < button1MaxY)
    { // touch point in the left button
        Serial.println("you pressed the left button");

        switchPage = true;
        Serial.println("switchpage");

        tft.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, TEXT_COLOR);

        tft.getTextBounds("Meter", 0, 0, &label1X, &label1Y, &label1W, &label1H);
        label1X = buttonX1 + buttonWidth / 2 - label1W / 2;
        label1Y = buttonY1 + buttonHeight - label1H;
        tft.setTextColor(BACKGROUND_COLOR);
        Serial.println(label1X);
        Serial.println(label1Y);
        tft.setCursor(label1X, label1Y);
        tft.print("Meter");

        tft.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
        tft.setCursor(label1X, label1Y);

        tft.print("Meter");
    }

    if (button2MinX < Touch::x && Touch::x < button2MaxX && button2MinY < Touch::y && Touch::y < button2MaxY)
    { // touch point in right button
        Serial.println("you pressed the right button");
        tft.fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, TEXT_COLOR);
        tft.getTextBounds("Sleep", 0, 0, &label2X, &label2Y, &label2W, &label2H);
        label2X = buttonX2 + buttonWidth / 2 - label2W / 2;
        label2Y = buttonY2 + buttonHeight - label2H;
        tft.setTextColor(BACKGROUND_COLOR);
        Serial.println(label2X);
        Serial.println(label2Y);
        tft.setCursor(label2X, label2Y);
        tft.print("Sleep");
        tft.fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
        tft.setCursor(label2X, label2Y);

        tft.print("Sleep");
    }
} // update meter f(x)

*/