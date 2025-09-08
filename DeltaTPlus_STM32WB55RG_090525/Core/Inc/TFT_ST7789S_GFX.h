/**
 * @file    TFT_ST7789S_GFX.h
 * @brief   ST7789S Adafruit GFX subclass with batched SPI transactions
 * @author  Your Name
 */


#ifndef TFT_ST7789S_GFX_H
#define TFT_ST7789S_GFX_H
//#ifdef __cplusplus
//extern "C"{
//#endif
//#include <Adafruit_GFX.h>
#include <TFT_ST7789S.h>
/*
class TFT_ST7789S_GFX : public Adafruit_GFX {
public:
    TFT_ST7789S_GFX(int16_t w, int16_t h);

    // Required GFX overrides
    void drawPixel(int16_t x, int16_t y, uint16_t color) override;

    // Batched transaction methods
    void startWrite(void);
    void endWrite(void);

    // Optimized methods that work within batched transactions
    void writePixel(int16_t x, int16_t y, uint16_t color);
    void writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
    void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);

    // Override some GFX methods for better performance
    void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) override;
    void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) override;
    void fillScreen(uint16_t color) override;

    // Display control
    void initDisplay(void);
    void setRotation(uint8_t r);

    // Color conversion utility
    uint16_t color565(uint8_t r, uint8_t g, uint8_t b);

private:
    bool _inTransaction;
    uint16_t _width, _height;
    uint8_t _rotation;

    // Internal optimized pixel writing (assumes transaction is active)
    void writePixelPreclipped(int16_t x, int16_t y, uint16_t color);

    // Set drawing window for optimized operations
    void setAddrWindow(int16_t x, int16_t y, int16_t w, int16_t h);
};
*/
/**
 * @brief Constructor
 */
TFT_ST7789S_GFX::TFT_ST7789S_GFX(int16_t w, int16_t h)
    : Adafruit_GFX(w, h), _inTransaction(false), _width(w), _height(h), _rotation(0) {
}

/**
 * @brief Initialize the display
 */
void TFT_ST7789S_GFX::initDisplay(void) {
    LCD_Init();
}

/**
 * @brief Start a batched write transaction
 * This keeps CS low for the entire transaction
 */
void TFT_ST7789S_GFX::startWrite(void) {
    if (!_inTransaction) {
        LCD_CS_LOW();
        _inTransaction = true;
    }
}

/**
 * @brief End a batched write transaction
 * This releases CS high
 */
void TFT_ST7789S_GFX::endWrite(void) {
    if (_inTransaction) {
        LCD_CS_HIGH();
        _inTransaction = false;
    }
}

/**
 * @brief Set address window for drawing operations
 */
void TFT_ST7789S_GFX::setAddrWindow(int16_t x, int16_t y, int16_t w, int16_t h) {
    int16_t x1 = x + w - 1;
    int16_t y1 = y + h - 1;

    // Column address set
    LCD_DC_LOW();
    uint8_t cmd = 0x2A;
    HAL_SPI_Transmit(&hspi1, &cmd, 1, HAL_MAX_DELAY);

    LCD_DC_HIGH();
    uint8_t data[4] = {
        (uint8_t)(x >> 8),
        (uint8_t)(x & 0xFF),
        (uint8_t)(x1 >> 8),
        (uint8_t)(x1 & 0xFF)
    };
    HAL_SPI_Transmit(&hspi1, data, 4, HAL_MAX_DELAY);

    // Row address set
    LCD_DC_LOW();
    cmd = 0x2B;
    HAL_SPI_Transmit(&hspi1, &cmd, 1, HAL_MAX_DELAY);

    LCD_DC_HIGH();
    data[0] = (uint8_t)(y >> 8);
    data[1] = (uint8_t)(y & 0xFF);
    data[2] = (uint8_t)(y1 >> 8);
    data[3] = (uint8_t)(y1 & 0xFF);
    HAL_SPI_Transmit(&hspi1, data, 4, HAL_MAX_DELAY);

    // Memory write command
    LCD_DC_LOW();
    cmd = 0x2C;
    HAL_SPI_Transmit(&hspi1, &cmd, 1, HAL_MAX_DELAY);
    LCD_DC_HIGH();
}

/**
 * @brief Write a single pixel (assumes transaction is active)
 */
void TFT_ST7789S_GFX::writePixelPreclipped(int16_t x, int16_t y, uint16_t color) {
    setAddrWindow(x, y, 1, 1);

    uint8_t data[2] = {
        (uint8_t)(color >> 8),
        (uint8_t)(color & 0xFF)
    };
    HAL_SPI_Transmit(&hspi1, data, 2, HAL_MAX_DELAY);
}

/**
 * @brief Write a pixel with bounds checking (for use in batched operations)
 */
void TFT_ST7789S_GFX::writePixel(int16_t x, int16_t y, uint16_t color) {
    if (x < 0 || x >= _width || y < 0 || y >= _height) return;

    if (!_inTransaction) {
        startWrite();
        writePixelPreclipped(x, y, color);
        endWrite();
    } else {
        writePixelPreclipped(x, y, color);
    }
}

/**
 * @brief Standard GFX drawPixel implementation
 */
void TFT_ST7789S_GFX::drawPixel(int16_t x, int16_t y, uint16_t color) {
    writePixel(x, y, color);
}

/**
 * @brief Optimized fill rectangle for batched operations
 */
void TFT_ST7789S_GFX::writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
    if (x < 0 || y < 0 || x >= _width || y >= _height) return;

    // Clip rectangle to screen bounds
    if (x + w > _width) w = _width - x;
    if (y + h > _height) h = _height - y;

    setAddrWindow(x, y, w, h);

    // Create pixel data
    uint8_t pixelData[2] = {
        (uint8_t)(color >> 8),
        (uint8_t)(color & 0xFF)
    };

    // For large areas, use a buffer to reduce SPI overhead
    uint32_t pixels = w * h;
    if (pixels > 256) {
        // Use 512-byte buffer (256 pixels)
        uint8_t buffer[512];
        for (int i = 0; i < 512; i += 2) {
            buffer[i] = pixelData[0];
            buffer[i + 1] = pixelData[1];
        }

        uint32_t remaining = pixels * 2;
        while (remaining > 0) {
            uint32_t chunk = min(remaining, 512);
            HAL_SPI_Transmit(&hspi1, buffer, chunk, HAL_MAX_DELAY);
            remaining -= chunk;
        }
    } else {
        // For small areas, send pixel by pixel
        for (uint32_t i = 0; i < pixels; i++) {
            HAL_SPI_Transmit(&hspi1, pixelData, 2, HAL_MAX_DELAY);
        }
    }
}

/**
 * @brief Optimized line drawing for batched operations
 */
void TFT_ST7789S_GFX::writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
    int16_t steep = abs(y1 - y0) > abs(x1 - x0);
    if (steep) {
        _swap_int16_t(x0, y0);
        _swap_int16_t(x1, y1);
    }

    if (x0 > x1) {
        _swap_int16_t(x0, x1);
        _swap_int16_t(y0, y1);
    }

    int16_t dx, dy;
    dx = x1 - x0;
    dy = abs(y1 - y0);

    int16_t err = dx / 2;
    int16_t ystep;

    if (y0 < y1) {
        ystep = 1;
    } else {
        ystep = -1;
    }

    for (; x0 <= x1; x0++) {
        if (steep) {
            writePixelPreclipped(y0, x0, color);
        } else {
            writePixelPreclipped(x0, y0, color);
        }
        err -= dy;
        if (err < 0) {
            y0 += ystep;
            err += dx;
        }
    }
}

/**
 * @brief Override GFX fillRect for better performance
 */
void TFT_ST7789S_GFX::fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
    startWrite();
    writeFillRect(x, y, w, h, color);
    endWrite();
}

/**
 * @brief Override GFX drawLine for better performance
 */
void TFT_ST7789S_GFX::drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
    // Check for vertical and horizontal lines for optimization
    if (x0 == x1) {
        if (y0 > y1) _swap_int16_t(y0, y1);
        fillRect(x0, y0, 1, y1 - y0 + 1, color);
    } else if (y0 == y1) {
        if (x0 > x1) _swap_int16_t(x0, x1);
        fillRect(x0, y0, x1 - x0 + 1, 1, color);
    } else {
        startWrite();
        writeLine(x0, y0, x1, y1, color);
        endWrite();
    }
}

/**
 * @brief Override GFX fillScreen for better performance
 */
void TFT_ST7789S_GFX::fillScreen(uint16_t color) {
    fillRect(0, 0, _width, _height, color);
}

/**
 * @brief Convert RGB888 to RGB565
 */
uint16_t TFT_ST7789S_GFX::color565(uint8_t r, uint8_t g, uint8_t b) {
    return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}

/**
 * @brief Set display rotation
 */
void TFT_ST7789S_GFX::setRotation(uint8_t r) {
    _rotation = r & 3;

    startWrite();
    LCD_DC_LOW();
    uint8_t cmd = 0x36; // Memory Access Control
    HAL_SPI_Transmit(&hspi1, &cmd, 1, HAL_MAX_DELAY);

    LCD_DC_HIGH();
    uint8_t madctl = 0;

    switch (_rotation) {
        case 0:
            madctl = 0x00;
            _width = WIDTH;
            _height = HEIGHT;
            break;
        case 1:
            madctl = 0x60;
            _width = HEIGHT;
            _height = WIDTH;
            break;
        case 2:
            madctl = 0xC0;
            _width = WIDTH;
            _height = HEIGHT;
            break;
        case 3:
            madctl = 0xA0;
            _width = HEIGHT;
            _height = WIDTH;
            break;
    }

    HAL_SPI_Transmit(&hspi1, &madctl, 1, HAL_MAX_DELAY);
    endWrite();
}


//#ifdef __cplusplus
//} /* extern "C" */
//#endif

#endif // TFT_ST7789S_GFX_H

