// FT5436_Touch.cpp - Implementation
#include "FT5436_Touch.h"

FT5436_Touch::FT5436_Touch(I2C_HandleTypeDef* hi2c, GPIO_TypeDef* int_port, uint16_t int_pin,
                           GPIO_TypeDef* rst_port, uint16_t rst_pin, uint16_t width, uint16_t height)
    : _hi2c(hi2c), _int_port(int_port), _int_pin(int_pin),
      _rst_port(rst_port), _rst_pin(rst_pin),
      _width(width), _height(height), _rotation(0)
{
}

bool FT5436_Touch::begin()
{
    // Hardware reset
    reset();

    // Wait for chip to initialize
    HAL_Delay(200);

    // Check if device is connected and get ID
    uint8_t deviceId = getDeviceID();
    if (deviceId != FT5436_REG_FT5436ID_VAL && deviceId != FT5436_REG_FT5336ID_VAL) {
        return false; // Device not found or wrong ID
    }

    // Configure device
    setThreshold(40); // Set touch threshold

    // Put device in working mode
    writeRegister(FT5436_REG_DEVICE_MODE, 0x00);

    return true;
}

void FT5436_Touch::reset()
{
    if (_rst_port != nullptr) {
        HAL_GPIO_WritePin(_rst_port, _rst_pin, GPIO_PIN_RESET);
        HAL_Delay(10);
        HAL_GPIO_WritePin(_rst_port, _rst_pin, GPIO_PIN_SET);
        HAL_Delay(300);
    }
}

bool FT5436_Touch::isConnected()
{
    uint8_t deviceId = getDeviceID();
    return (deviceId == FT5436_REG_FT5436ID_VAL || deviceId == FT5436_REG_FT5336ID_VAL);
}

uint8_t FT5436_Touch::getDeviceID()
{
    uint8_t deviceId = 0;
    readRegister(FT5436_REG_FT5436ID, &deviceId);
    return deviceId;
}

bool FT5436_Touch::getTouchData(FT5436_TouchData* touchData)
{
    uint8_t buffer[32];

    // Read touch data starting from gesture register
    if (readRegisters(FT5436_REG_GESTURE_ID, buffer, 31) != HAL_OK) {
        return false;
    }

    touchData->gestureId = buffer[0];
    touchData->numTouches = buffer[1] & 0x0F; // Lower 4 bits

    // Limit to maximum supported touches
    if (touchData->numTouches > 5) {
        touchData->numTouches = 5;
    }

    // Parse touch points
    for (uint8_t i = 0; i < touchData->numTouches; i++) {
        uint8_t offset = 2 + (i * 6); // Each touch point is 6 bytes

        touchData->touches[i].event = (buffer[offset] >> 6) & 0x03;
        touchData->touches[i].id = (buffer[offset] >> 2) & 0x0F;

        touchData->touches[i].x = ((buffer[offset] & 0x0F) << 8) | buffer[offset + 1];
        touchData->touches[i].y = ((buffer[offset + 2] & 0x0F) << 8) | buffer[offset + 3];

        // Apply rotation and bounds checking
        applyRotation(&touchData->touches[i].x, &touchData->touches[i].y);
    }

    return true;
}

bool FT5436_Touch::isTouched()
{
    uint8_t touchCount = getTouchCount();
    return (touchCount > 0);
}

uint8_t FT5436_Touch::getTouchCount()
{
    uint8_t status = 0;
    if (readRegister(FT5436_REG_TD_STATUS, &status) == HAL_OK) {
        return status & 0x0F;
    }
    return 0;
}

bool FT5436_Touch::getTouch(uint16_t* x, uint16_t* y)
{
    FT5436_TouchData touchData;
    if (getTouchData(&touchData) && touchData.numTouches > 0) {
        *x = touchData.touches[0].x;
        *y = touchData.touches[0].y;
        return true;
    }
    return false;
}

void FT5436_Touch::setThreshold(uint8_t threshold)
{
    writeRegister(FT5436_REG_THGROUP, threshold);
}

void FT5436_Touch::setRotation(uint8_t rotation)
{
    _rotation = rotation % 4;
}

void FT5436_Touch::applyRotation(uint16_t* x, uint16_t* y)
{
    uint16_t newX, newY;

    switch (_rotation) {
    case 0: // No rotation
        break;
    case 1: // 90 degrees clockwise
        newX = *y;
        newY = _height - *x - 1;
        *x = newX;
        *y = newY;
        break;
    case 2: // 180 degrees
        *x = _width - *x - 1;
        *y = _height - *y - 1;
        break;
    case 3: // 270 degrees clockwise (90 CCW)
        newX = _width - *y - 1;
        newY = *x;
        *x = newX;
        *y = newY;
        break;
    }
}

// Private I2C helper functions
HAL_StatusTypeDef FT5436_Touch::writeRegister(uint8_t reg, uint8_t value)
{
    uint8_t buffer[2] = {reg, value};
    return HAL_I2C_Master_Transmit(_hi2c, FT5436_I2C_ADDRESS << 1, buffer, 2, 100);
}

HAL_StatusTypeDef FT5436_Touch::readRegister(uint8_t reg, uint8_t* value)
{
    return HAL_I2C_Mem_Read(_hi2c, FT5436_I2C_ADDRESS << 1, reg, I2C_MEMADD_SIZE_8BIT, value, 1, 100);
}

HAL_StatusTypeDef FT5436_Touch::readRegisters(uint8_t reg, uint8_t* buffer, uint8_t length)
{
    return HAL_I2C_Mem_Read(_hi2c, FT5436_I2C_ADDRESS << 1, reg, I2C_MEMADD_SIZE_8BIT, buffer, length, 100);
}

// Usage Example:
/*
// In your header/global scope:
FT5436_Touch touch(&hi2c1, GPIOB, GPIO_PIN_1, GPIOB, GPIO_PIN_0, 320, 240);

// In setup():
if (touch.begin()) {
    Serial.println("Touch controller initialized");
    touch.setRotation(2); // Match display rotation
} else {
    Serial.println("Touch controller not found!");
}

// In main loop:
if (touch.isTouched()) {
    uint16_t x, y;
    if (touch.getTouch(&x, &y)) {
        printf("Touch at: %d, %d\n", x, y);
    }
}
*/
