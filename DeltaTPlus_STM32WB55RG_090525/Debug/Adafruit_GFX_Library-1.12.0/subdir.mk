################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Adafruit_GFX_Library-1.12.0/Adafruit_GFX.cpp \
../Adafruit_GFX_Library-1.12.0/Print.cpp \
../Adafruit_GFX_Library-1.12.0/ST7789V_STM32.cpp 

C_SRCS += \
../Adafruit_GFX_Library-1.12.0/glcdfont.c 

C_DEPS += \
./Adafruit_GFX_Library-1.12.0/glcdfont.d 

OBJS += \
./Adafruit_GFX_Library-1.12.0/Adafruit_GFX.o \
./Adafruit_GFX_Library-1.12.0/Print.o \
./Adafruit_GFX_Library-1.12.0/ST7789V_STM32.o \
./Adafruit_GFX_Library-1.12.0/glcdfont.o 

CPP_DEPS += \
./Adafruit_GFX_Library-1.12.0/Adafruit_GFX.d \
./Adafruit_GFX_Library-1.12.0/Print.d \
./Adafruit_GFX_Library-1.12.0/ST7789V_STM32.d 


# Each subdirectory must supply rules for building sources it contributes
Adafruit_GFX_Library-1.12.0/%.o Adafruit_GFX_Library-1.12.0/%.su Adafruit_GFX_Library-1.12.0/%.cyclo: ../Adafruit_GFX_Library-1.12.0/%.cpp Adafruit_GFX_Library-1.12.0/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_GFX_Library-1.12.0" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_MAX31856_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Screen" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Adafruit_GFX_Library-1.12.0/%.o Adafruit_GFX_Library-1.12.0/%.su Adafruit_GFX_Library-1.12.0/%.cyclo: ../Adafruit_GFX_Library-1.12.0/%.c Adafruit_GFX_Library-1.12.0/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_GFX_Library-1.12.0" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_MAX31856_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Screen" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Adafruit_GFX_Library-2d-1-2e-12-2e-0

clean-Adafruit_GFX_Library-2d-1-2e-12-2e-0:
	-$(RM) ./Adafruit_GFX_Library-1.12.0/Adafruit_GFX.cyclo ./Adafruit_GFX_Library-1.12.0/Adafruit_GFX.d ./Adafruit_GFX_Library-1.12.0/Adafruit_GFX.o ./Adafruit_GFX_Library-1.12.0/Adafruit_GFX.su ./Adafruit_GFX_Library-1.12.0/Print.cyclo ./Adafruit_GFX_Library-1.12.0/Print.d ./Adafruit_GFX_Library-1.12.0/Print.o ./Adafruit_GFX_Library-1.12.0/Print.su ./Adafruit_GFX_Library-1.12.0/ST7789V_STM32.cyclo ./Adafruit_GFX_Library-1.12.0/ST7789V_STM32.d ./Adafruit_GFX_Library-1.12.0/ST7789V_STM32.o ./Adafruit_GFX_Library-1.12.0/ST7789V_STM32.su ./Adafruit_GFX_Library-1.12.0/glcdfont.cyclo ./Adafruit_GFX_Library-1.12.0/glcdfont.d ./Adafruit_GFX_Library-1.12.0/glcdfont.o ./Adafruit_GFX_Library-1.12.0/glcdfont.su

.PHONY: clean-Adafruit_GFX_Library-2d-1-2e-12-2e-0

