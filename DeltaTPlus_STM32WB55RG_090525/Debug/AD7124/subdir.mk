################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../AD7124/ad7124.c \
../AD7124/ad7124_regs.c \
../AD7124/ad7124_regs_config_a.c \
../AD7124/ad7124_regs_config_b.c \
../AD7124/ad7124_support.c \
../AD7124/adi_console_menu.c \
../AD7124/delay.c \
../AD7124/platform_support.c 

C_DEPS += \
./AD7124/ad7124.d \
./AD7124/ad7124_regs.d \
./AD7124/ad7124_regs_config_a.d \
./AD7124/ad7124_regs_config_b.d \
./AD7124/ad7124_support.d \
./AD7124/adi_console_menu.d \
./AD7124/delay.d \
./AD7124/platform_support.d 

OBJS += \
./AD7124/ad7124.o \
./AD7124/ad7124_regs.o \
./AD7124/ad7124_regs_config_a.o \
./AD7124/ad7124_regs_config_b.o \
./AD7124/ad7124_support.o \
./AD7124/adi_console_menu.o \
./AD7124/delay.o \
./AD7124/platform_support.o 


# Each subdirectory must supply rules for building sources it contributes
AD7124/%.o AD7124/%.su AD7124/%.cyclo: ../AD7124/%.c AD7124/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_GFX_Library-1.12.0" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_MAX31856_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Screen" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-AD7124

clean-AD7124:
	-$(RM) ./AD7124/ad7124.cyclo ./AD7124/ad7124.d ./AD7124/ad7124.o ./AD7124/ad7124.su ./AD7124/ad7124_regs.cyclo ./AD7124/ad7124_regs.d ./AD7124/ad7124_regs.o ./AD7124/ad7124_regs.su ./AD7124/ad7124_regs_config_a.cyclo ./AD7124/ad7124_regs_config_a.d ./AD7124/ad7124_regs_config_a.o ./AD7124/ad7124_regs_config_a.su ./AD7124/ad7124_regs_config_b.cyclo ./AD7124/ad7124_regs_config_b.d ./AD7124/ad7124_regs_config_b.o ./AD7124/ad7124_regs_config_b.su ./AD7124/ad7124_support.cyclo ./AD7124/ad7124_support.d ./AD7124/ad7124_support.o ./AD7124/ad7124_support.su ./AD7124/adi_console_menu.cyclo ./AD7124/adi_console_menu.d ./AD7124/adi_console_menu.o ./AD7124/adi_console_menu.su ./AD7124/delay.cyclo ./AD7124/delay.d ./AD7124/delay.o ./AD7124/delay.su ./AD7124/platform_support.cyclo ./AD7124/platform_support.d ./AD7124/platform_support.o ./AD7124/platform_support.su

.PHONY: clean-AD7124

