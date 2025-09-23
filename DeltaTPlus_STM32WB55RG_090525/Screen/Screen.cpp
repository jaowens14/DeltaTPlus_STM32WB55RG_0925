#include "Screen.hpp"

float Screen::needleAngle = 270.0;
float Screen::lastNeedleAngle = 270.0;

void Screen::setup(void)
{

    needleBuffer[32] = {0};
    switchBuffer[32] = {0};
    lastSwitchBuffer[32] = {0};

    // SPI_Set_Mode(0);

    totalPixels = canvas.width() * canvas.height();

    tft.begin();
    tft.setRotation(2); // places the screen connector further away from the probe tubes
    canvas.setFont(&FreeSerif9pt7b);
    canvas.setTextWrap(true);
    canvas.setTextSize(0);
    tft.setWindow(0, 0, canvas.width() - 1, canvas.height() - 1);

    // initial state: meter
    page = METER;
    renderMeter();
    // canvas.byteSwap();

    writeCanvas();
    // renderMeter(canvas);

    // fadeIn();
}

void Screen::stateMachine(void)

{

    // switch (page)
    // {
    // case METER:
    //
    if (!renderDelay)
    {
        updateMeter();
        renderDelay = 20; // 20 ms...
    }
    //
    //     if (!switchPageDelay && switchPage)
    //     {
    //         //Serial.println("Going to settings");
    //         page = SETTINGS;
    //         //renderSettings();
    //         switchPage = false;
    //         switchPageDelay = 2; // 200ms
    //     }
    //
    //     break;
    //
    // case SETTINGS:
    //
    //     updateSettings();
    //     if (!switchPageDelay && switchPage)
    //     {
    //         Serial.println("Going to meter");
    //         page = METER;
    //         renderMeter();
    //         switchPage = false;
    //         switchPageDelay = 2; // 200ms
    //     }
    //
    //     break;
    //
    // case CALIBRATION:
    //     break;
    //
    // default:
    //     break;
    // }
}

void Screen::writeCanvas(void)
{

    // SPI_Set_Mode(0);
    uint16_t *buffer = canvas.getBuffer();
    // tft.startWrite();
    // tft.writeBuffer(buffer, totalPixels);
    //  tft.writeBufferDMA(buffer, totalPixels);
    tft.writeBufferDMA(buffer, totalPixels);
    // tft.endWrite();
    //  SPI_Set_Mode(1);
}

void Screen::writeCanvasRegion(int x0, int y0, int x1, int y1)
{
    // Set display window to the specific region
    int width = abs(x0 - x1) + 1;
    int height = abs(y0 - y1) + 1;

    tft.setWindow(x0, y0, x1, y1);

    uint16_t *fullBuffer = canvas.getBuffer();
    uint16_t regionBuffer[width * height];

    // Copy only the needle region from the full canvas
    for (int row = 0; row < height; row++)
    {
        int srcOffset = (y0 + row) * 240 + x0;
        int dstOffset = row * width;
        memcpy(&regionBuffer[dstOffset], &fullBuffer[srcOffset], width * sizeof(uint16_t));
    }

    // Write just this small region via DMA
    tft.writeBufferDMA(regionBuffer, width * height);
}

// void Screen::writeNeedleFromCanvas(x0, y0, x1, y1, color);
//
//{
//
//     int x = (x0 < x1) ? x0 : x1;
//     int y = (y0 > y1) ? y0 : y1;
//
//     x =
//         SPI_Set_Mode(0);
//     uint16_t *buffer = canvas.getBuffer();
//
//     // buffer[x + y * WIDTH] = color;
//
//     // 1. get buffer
//     // 2. get region of buffer
//     // 3. write region with offset...
//     tft.startWrite();
//     tft.writeBuffer(buffer, totalPixels);
//     tft.endWrite();
//     SPI_Set_Mode(1);
// }

float Screen::radians(float degrees)
{
    return degrees * M_PI / 180.0f;
}
