/*
 * ST7789S_GFX.h
 *
 *  Created on: Aug 26, 2025
 *      Author: jaowe
 */

#ifndef INC_ST7789S_GFX_H_
#define INC_ST7789S_GFX_H_




#ifdef __cplusplus
extern "C" {
#endif

#include "main.h"
#include "spi.h"
#include "dma.h"

#ifdef __cplusplus
}
#endif

#include "Adafruit_GFX.h"

// ST7789S Commands
#define ST7789_NOP        0x00
#define ST7789_SWRESET    0x01
#define ST7789_RDDID      0x04
#define ST7789_RDDST      0x09
#define ST7789_SLPIN      0x10
#define ST7789_SLPOUT     0x11
#define ST7789_PTLON      0x12
#define ST7789_NORON      0x13
#define ST7789_INVOFF     0x20
#define ST7789_INVON      0x21
#define ST7789_DISPOFF    0x28
#define ST7789_DISPON     0x29
#define ST7789_CASET      0x2A
#define ST7789_RASET      0x2B
#define ST7789_RAMWR      0x2C
#define ST7789_RAMRD      0x2E
#define ST7789_PTLAR      0x30
#define ST7789_COLMOD     0x3A
#define ST7789_MADCTL     0x36

// MADCTL bits
#define ST7789_MADCTL_MY  0x80
#define ST7789_MADCTL_MX  0x40
#define ST7789_MADCTL_MV  0x20
#define ST7789_MADCTL_ML  0x10
#define ST7789_MADCTL_RGB 0x00

// GPIO Pin definitions - adjust to match your hardware
#define LCD_CS_PIN   GPIO_PIN_3
#define LCD_CS_PORT  GPIOA
#define LCD_DC_PIN   GPIO_PIN_2
#define LCD_DC_PORT  GPIOA
#define LCD_RST_PIN  GPIO_PIN_1
#define LCD_RST_PORT GPIOA

// Display dimensions
#define DISPLAY_WIDTH  240
#define DISPLAY_HEIGHT 320

class ST7789S_GFX : public Adafruit_GFX {
public:
    ST7789S_GFX(SPI_HandleTypeDef *hspi, DMA_HandleTypeDef *hdma_tx = nullptr);
    ~ST7789S_GFX();

    // Core GFX overrides - REQUIRED
    void drawPixel(int16_t x, int16_t y, uint16_t color) override;

    // Transaction API overrides for optimization
    void startWrite(void) override;
    void writePixel(int16_t x, int16_t y, uint16_t color) override;
    void writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) override;
    void writeFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color) override;
    void writeFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color) override;
    void endWrite(void) override;

    // Control API overrides
    void setRotation(uint8_t r) override;
    void invertDisplay(bool i) override;

    // Basic draw API overrides for optimization
    void fillScreen(uint16_t color) override;
    void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) override;
    void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color) override;
    void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color) override;

    // ST7789S specific functions
    bool begin(void);
    void display(void);  // Send entire framebuffer to display
    void display(int16_t x, int16_t y, int16_t w, int16_t h);  // Send partial framebuffer
    void displayAsync(void);  // Send framebuffer using DMA (non-blocking)
    void displayRegionAsync(int16_t x, int16_t y, int16_t w, int16_t h);  // Send partial framebuffer with DMA

    // DMA and performance functions
    bool isDMATransferComplete(void);
    void waitForDMAComplete(void);
    void enableDoubleBuffering(bool enable);
    void swapBuffers(void);

    // Framebuffer access
    uint16_t* getFramebuffer(void) { return framebuffer; }
    uint32_t getFramebufferSize(void) { return framebuffer_size; }

    // Performance monitoring
    uint32_t getLastTransferTime(void) { return last_transfer_time; }
    uint32_t getFrameCount(void) { return frame_count; }
    void resetFrameCount(void) { frame_count = 0; }

private:
    SPI_HandleTypeDef *spi_handle;
    DMA_HandleTypeDef *dma_tx_handle;
    uint16_t *framebuffer;
    uint16_t *back_buffer;  // For double buffering
    uint32_t framebuffer_size;
    bool in_transaction;
    bool dma_transfer_active;
    bool double_buffering_enabled;
    bool current_buffer_is_front;
    uint32_t last_transfer_time;
    uint32_t frame_count;

    // ST7789S specific functions
    void writeCommand(uint8_t cmd);
    void writeData(uint8_t data);
    void writeData16(uint16_t data);
    void setAddrWindow(int16_t x, int16_t y, int16_t w, int16_t h);
    void initDisplay(void);
    void hardwareReset(void);

    // GPIO control macros converted to inline functions
    inline void csLow(void) {
        HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_RESET);
    }
    inline void csHigh(void) {
        HAL_GPIO_WritePin(LCD_CS_PORT, LCD_CS_PIN, GPIO_PIN_SET);
    }
    inline void dcLow(void) {
        HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_RESET);
    }
    inline void dcHigh(void) {
        HAL_GPIO_WritePin(LCD_DC_PORT, LCD_DC_PIN, GPIO_PIN_SET);
    }
    inline void rstLow(void) {
        HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_RESET);
    }
    inline void rstHigh(void) {
        HAL_GPIO_WritePin(LCD_RST_PORT, LCD_RST_PIN, GPIO_PIN_SET);
    }

    // Utility functions
    inline uint16_t color565(uint8_t r, uint8_t g, uint8_t b) {
        return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
    }

    void swapBytes(uint16_t *data, uint32_t len);
    uint16_t* getCurrentFramebuffer(void);
    uint16_t* getBackFramebuffer(void);

    // DMA callback setup
    void setupDMACallbacks(void);

    // Static callback functions for DMA
    static void dmaTransferCompleteCallback(DMA_HandleTypeDef *hdma);
    static void dmaTransferErrorCallback(DMA_HandleTypeDef *hdma);

    // Instance pointer for callbacks
    static ST7789S_GFX* instance;
};

// C-style callback functions for HAL integration
extern "C" {
    void ST7789S_DMA_TransferCompleteCallback(DMA_HandleTypeDef *hdma);
    void ST7789S_DMA_TransferErrorCallback(DMA_HandleTypeDef *hdma);
}




#endif /* INC_ST7789S_GFX_H_ */
