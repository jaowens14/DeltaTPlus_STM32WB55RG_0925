################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Screen/RenderMeter.cpp \
../Screen/RenderSettings.cpp \
../Screen/RenderStatus.cpp \
../Screen/Screen.cpp \
../Screen/UpdateMeter.cpp \
../Screen/UpdateSettings.cpp \
../Screen/UpdateStatus.cpp 

OBJS += \
./Screen/RenderMeter.o \
./Screen/RenderSettings.o \
./Screen/RenderStatus.o \
./Screen/Screen.o \
./Screen/UpdateMeter.o \
./Screen/UpdateSettings.o \
./Screen/UpdateStatus.o 

CPP_DEPS += \
./Screen/RenderMeter.d \
./Screen/RenderSettings.d \
./Screen/RenderStatus.d \
./Screen/Screen.d \
./Screen/UpdateMeter.d \
./Screen/UpdateSettings.d \
./Screen/UpdateStatus.d 


# Each subdirectory must supply rules for building sources it contributes
Screen/%.o Screen/%.su Screen/%.cyclo: ../Screen/%.cpp Screen/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_GFX_Library-1.12.0" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_MAX31856_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Screen" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Screen

clean-Screen:
	-$(RM) ./Screen/RenderMeter.cyclo ./Screen/RenderMeter.d ./Screen/RenderMeter.o ./Screen/RenderMeter.su ./Screen/RenderSettings.cyclo ./Screen/RenderSettings.d ./Screen/RenderSettings.o ./Screen/RenderSettings.su ./Screen/RenderStatus.cyclo ./Screen/RenderStatus.d ./Screen/RenderStatus.o ./Screen/RenderStatus.su ./Screen/Screen.cyclo ./Screen/Screen.d ./Screen/Screen.o ./Screen/Screen.su ./Screen/UpdateMeter.cyclo ./Screen/UpdateMeter.d ./Screen/UpdateMeter.o ./Screen/UpdateMeter.su ./Screen/UpdateSettings.cyclo ./Screen/UpdateSettings.d ./Screen/UpdateSettings.o ./Screen/UpdateSettings.su ./Screen/UpdateStatus.cyclo ./Screen/UpdateStatus.d ./Screen/UpdateStatus.o ./Screen/UpdateStatus.su

.PHONY: clean-Screen

