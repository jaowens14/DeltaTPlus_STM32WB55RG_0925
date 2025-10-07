################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../AD7124_Library/ad7124-driver.cpp \
../AD7124_Library/ad7124-private.cpp \
../AD7124_Library/ad7124.cpp 

OBJS += \
./AD7124_Library/ad7124-driver.o \
./AD7124_Library/ad7124-private.o \
./AD7124_Library/ad7124.o 

CPP_DEPS += \
./AD7124_Library/ad7124-driver.d \
./AD7124_Library/ad7124-private.d \
./AD7124_Library/ad7124.d 


# Each subdirectory must supply rules for building sources it contributes
AD7124_Library/%.o AD7124_Library/%.su AD7124_Library/%.cyclo: ../AD7124_Library/%.cpp AD7124_Library/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/FT5436" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-AD7124_Library

clean-AD7124_Library:
	-$(RM) ./AD7124_Library/ad7124-driver.cyclo ./AD7124_Library/ad7124-driver.d ./AD7124_Library/ad7124-driver.o ./AD7124_Library/ad7124-driver.su ./AD7124_Library/ad7124-private.cyclo ./AD7124_Library/ad7124-private.d ./AD7124_Library/ad7124-private.o ./AD7124_Library/ad7124-private.su ./AD7124_Library/ad7124.cyclo ./AD7124_Library/ad7124.d ./AD7124_Library/ad7124.o ./AD7124_Library/ad7124.su

.PHONY: clean-AD7124_Library

