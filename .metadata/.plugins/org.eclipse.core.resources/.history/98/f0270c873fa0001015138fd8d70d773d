/*

#include "Screen.hpp"
void Screen::renderSettings(void)
{

    // background
    tft.fillRect(0, 0, tft.width(), tft.height(), BACKGROUND_COLOR);

    // tft.fillScreen(BACKGROUND_COLOR);

    // border
    for (int i = 0; i < 3; i++)
    {
        tft.drawRect(overallBorderX - i, overallBorderY - i, overallBorderWidth + 2 * i, overallBorderHeight + 2 * i, TEXT_COLOR);
    }
    // yield();
    // status border
    tft.drawRect(statusBorderX, statusBorderY, statusWidth, statusHeight, TEXT_COLOR);

    tft.drawRect(meterX, meterY, meterWidth, meterHeight, TEXT_COLOR);
    tft.drawRect(labelX, labelY, labelWidth, labelHeight, TEXT_COLOR);
    tft.drawRect(buttonBorderX, buttonBorderY, buttonBorderWidth, buttonBorderHeight, TEXT_COLOR);
    tft.fillRoundRect(buttonX1, buttonY1, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);
    tft.fillRoundRect(buttonX2, buttonY2, buttonWidth, buttonHeight, buttonRadius, ACCENT_COLOR);

    tft.drawPixel(10, 10, ACCENT_COLOR);
    tft.drawPixel(11, 10, ACCENT_COLOR);
    tft.drawPixel(12, 10, ACCENT_COLOR);
    tft.drawPixel(13, 10, ACCENT_COLOR);
    tft.drawPixel(10, 11, ACCENT_COLOR);
    tft.drawPixel(10, 12, ACCENT_COLOR);
    tft.drawPixel(10, 13, ACCENT_COLOR);

    // calculate the size of a few things....
    tft.getTextBounds(BatteryMonitor::percent, 0, 0, &batteryTextX, &batteryTextY, &batteryW, &batteryH);
    // origin of battery text based on its size...
    batteryX = overallBorderWidth - batteryW - 2 * batterySpacer;
    batteryY = statusBorderY + statusHeight / 2 + batteryH / 2;

    Serial.println(batteryX);
    Serial.println(batteryY);
    tft.setTextColor(TEXT_COLOR);
    tft.setCursor(batteryX, batteryY);
    tft.print(BatteryMonitor::percent);

    // calculate size of charging:
    tft.getTextBounds("+ ", 0, 0, &chargingTextX, &chargingTextY, &chargingW, &chargingH);
    chargingX = overallBorderWidth - batteryW - chargingW - 2 * batterySpacer;
    chargingY = statusBorderY + statusHeight / 2 + chargingH / 2;
    tft.setTextColor(TEXT_COLOR);
    Serial.println(chargingX);
    Serial.println(chargingY);
    tft.setCursor(chargingX, chargingY);
    tft.print("+");

    // calculate size of Meter:
    tft.getTextBounds("Meter", 0, 0, &label1X, &label1Y, &label1W, &label1H);

    label1X = buttonX1 + buttonWidth / 2 - label1W / 2;
    label1Y = buttonY1 + buttonHeight - label2H;
    tft.setTextColor(BACKGROUND_COLOR);
    Serial.println(label1X);
    Serial.println(label1Y);
    tft.setCursor(label1X, label1Y);
    tft.print("Meter");

    tft.getTextBounds("Sleep", 0, 0, &label2X, &label2Y, &label2W, &label2H);
    label2X = buttonX2 + buttonWidth / 2 - label2W / 2;
    label2Y = buttonY2 + buttonHeight - label2H;
    tft.setTextColor(BACKGROUND_COLOR);
    Serial.println(label2X);
    Serial.println(label2Y);
    tft.setCursor(label2X, label2Y);
    tft.print("Sleep");
}

*/