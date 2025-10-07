################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/others/monkey/lv_example_monkey_1.c \
../lvgl/examples/others/monkey/lv_example_monkey_2.c \
../lvgl/examples/others/monkey/lv_example_monkey_3.c 

C_DEPS += \
./lvgl/examples/others/monkey/lv_example_monkey_1.d \
./lvgl/examples/others/monkey/lv_example_monkey_2.d \
./lvgl/examples/others/monkey/lv_example_monkey_3.d 

OBJS += \
./lvgl/examples/others/monkey/lv_example_monkey_1.o \
./lvgl/examples/others/monkey/lv_example_monkey_2.o \
./lvgl/examples/others/monkey/lv_example_monkey_3.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/others/monkey/%.o lvgl/examples/others/monkey/%.su lvgl/examples/others/monkey/%.cyclo: ../lvgl/examples/others/monkey/%.c lvgl/examples/others/monkey/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-others-2f-monkey

clean-lvgl-2f-examples-2f-others-2f-monkey:
	-$(RM) ./lvgl/examples/others/monkey/lv_example_monkey_1.cyclo ./lvgl/examples/others/monkey/lv_example_monkey_1.d ./lvgl/examples/others/monkey/lv_example_monkey_1.o ./lvgl/examples/others/monkey/lv_example_monkey_1.su ./lvgl/examples/others/monkey/lv_example_monkey_2.cyclo ./lvgl/examples/others/monkey/lv_example_monkey_2.d ./lvgl/examples/others/monkey/lv_example_monkey_2.o ./lvgl/examples/others/monkey/lv_example_monkey_2.su ./lvgl/examples/others/monkey/lv_example_monkey_3.cyclo ./lvgl/examples/others/monkey/lv_example_monkey_3.d ./lvgl/examples/others/monkey/lv_example_monkey_3.o ./lvgl/examples/others/monkey/lv_example_monkey_3.su

.PHONY: clean-lvgl-2f-examples-2f-others-2f-monkey

