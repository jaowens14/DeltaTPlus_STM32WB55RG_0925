#ifndef SCREEN_HPP
#define SCREEN_HPP

#include "spi.h"

#include <Fonts/FreeSerif9pt7b.h>
#include "Adafruit_GFX.h"
#include "ST7789V_STM32.h"
#include <math.h>
// #include "Touch/Touch.hpp"
// #include "BatteryMonitor/BatteryMonitor.hpp"
// #include "Thermocouples/Thermocouples.hpp"
#include "Switch.hpp"
#define BACKGROUND_COLOR 0xDCFF
#define TEXT_COLOR 0xA329
#define ACCENT_COLOR 0x6763

class Screen
{
    // private:
    //  Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

public:
    ST7789V_STM32 tft = ST7789V_STM32(&hspi2,
                                      GPIOA, GPIO_PIN_3,  // CS pin
                                      GPIOA, GPIO_PIN_2,  // DC pin
                                      GPIOA, GPIO_PIN_1); // RST pin
    volatile int switchPageDelay = 0;                     // 200ms
    volatile int renderDelay = 0;                         // 60hz

    uint32_t totalPixels;

    GFXcanvas16 canvas = GFXcanvas16(240, 320); // Full screen canvas

    const int width = 240;  // tft.width();   // 240
    const int height = 320; // tft.height(); // 320
    // overall
    const int overallOffset = 2;
    const int overallBorderWidth = width - 2 * overallOffset; // 240 - 2 * 2
    const int overallBorderHeight = height - 2 * overallOffset;
    const int overallBorderX = overallOffset;
    const int overallBorderY = overallOffset;
    // status
    const int statusWidth = overallBorderWidth;
    const int statusHeight = 8 * 3;
    const int statusBorderX = overallBorderX;
    const int statusBorderY = overallBorderY;
    // battery
    int batteryX;
    int batteryY;
    int16_t batteryTextX;
    int16_t batteryTextY;
    uint16_t batteryW;
    uint16_t batteryH;

    int switchX;
    int switchY;
    int16_t switchTextX;
    int16_t switchTextY;
    uint16_t switchW;
    uint16_t switchH;

    const int batterySpacer = 4;
    int chargingX;
    int chargingY;
    int16_t chargingTextX;
    int16_t chargingTextY;
    uint16_t chargingW;
    uint16_t chargingH;

    // meter
    const int meterWidth = overallBorderWidth;
    const int meterHeight = 8 * 22;
    const int meterX = overallBorderX;
    const int meterY = overallBorderY + statusHeight;
    const int meterOriginX = meterX + meterWidth / 2;
    const int meterSpacer = 4;
    const int meterOriginY = meterY - meterSpacer + meterHeight;

    int needleX1;
    int needleX2;
    int needleY1;
    int needleY2;
    int lastNeedleX1;
    int lastNeedleX2;
    int lastNeedleY1;
    int lastNeedleY2;
    float needleRad;
    float needleAngle = 270.0;
    float currentAngle = 270.0;

    float angleDeadBandTolerance = 0.001;
    // label
    const int labelWidth = overallBorderWidth;
    const int labelHeight = 8 * 8;
    const int labelX = overallBorderX;
    const int labelY = meterY + meterHeight;
    // buttons
    const int buttonBorderWidth = overallBorderWidth;
    const int buttonBorderHeight = overallBorderHeight - statusHeight - meterHeight - labelHeight;
    const int buttonBorderX = overallBorderX;
    const int buttonBorderY = labelY + labelHeight;

    int16_t label1X;
    int16_t label1Y;
    uint16_t label1W;
    uint16_t label1H;

    int16_t label2X;
    int16_t label2Y;
    uint16_t label2W;
    uint16_t label2H;

    int16_t textOriginX;
    int16_t textOriginY;
    uint16_t textWidth;
    uint16_t textHeight;
    int textX;
    int textY;

    // button 1
    const int buttonSpacer = 4;
    const int buttonWidth = (overallBorderWidth - 3 * buttonSpacer) / 2; // 3 spacers 2 buttons
    const int buttonHeight = buttonBorderHeight - 2 * buttonSpacer;
    // button origins
    const int buttonX1 = buttonBorderX + 1 * buttonSpacer; // left button
    const int buttonY1 = buttonBorderY + 1 * buttonSpacer; // left button
    const int buttonX2 = buttonBorderX + 2 * buttonSpacer + buttonWidth;
    const int buttonY2 = buttonBorderY + 1 * buttonSpacer;
    // button 'settings extents
    const int button1MinX = buttonX1;
    const int button1MaxX = button1MinX + buttonWidth;
    const int button1MinY = buttonY1;
    const int button1MaxY = button1MinY + buttonHeight;
    // button extents
    const int button2MinX = buttonX2;
    const int button2MaxX = button2MinX + buttonWidth;
    const int button2MinY = buttonY2;
    const int button2MaxY = button2MinY + buttonHeight;

    const int buttonRadius = 10;
    const int buttonGap = 6;
    // const int meterWidth = 230;
    // const int meterHeight = 140;
    const int screenOffset = 5;
    const float pi = 3.14159265359;

    const int backlightChannel = 0;
    const int backlightFrequency = 5000;
    const int backlightResolution = 8;

    int buttonY; // these look messy but they are in the order of the elements on the screen

    const int needleX = screenOffset + meterWidth / 2;
    const int needleY = statusHeight + meterHeight;
    const int needleLength = 100;

    uint16_t dttextWidth, dttextHeight;
    uint16_t tictextWidth, tictextHeight;
    uint16_t fccotextWidth, fccotextHeight;
    uint16_t settextWidth, settextHeight;
    uint16_t sleeptextWidth, sleeptextHeight;
    uint16_t calitextWidth, calitextHeight;

    volatile int settingsDelay;

    bool switchPage = false;

    char lastBatteryLevel[32];

    char batteryLevel[32];
    char needleBuffer[32];
    char switchBuffer[32];
    char lastSwitchBuffer[32];
    enum Pages
    {
        METER,
        SETTINGS,
        CALIBRATION,
    };

    Pages page;

    void setup(void);
    void stateMachine(void);
    void renderMeter();
    void updateMeter();
    void drawMeterLines(int centerX, int centerY, int radius, int lineStart, int lineEnd);
    void writeCanvas(void);

    float radians(float degrees);

    // void renderSettings(void);
    // void fadeIn(void);
    // void drawMeterLines(int, int, int, int, int);
    // void renderStatus(void);

    // void updateMeter(void);
    // void updateSettings(void);
    //  void updateStatus(void);
};

#endif
