################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/widgets/textarea/lv_example_textarea_1.c \
../lvgl/examples/widgets/textarea/lv_example_textarea_2.c \
../lvgl/examples/widgets/textarea/lv_example_textarea_3.c \
../lvgl/examples/widgets/textarea/lv_example_textarea_4.c 

C_DEPS += \
./lvgl/examples/widgets/textarea/lv_example_textarea_1.d \
./lvgl/examples/widgets/textarea/lv_example_textarea_2.d \
./lvgl/examples/widgets/textarea/lv_example_textarea_3.d \
./lvgl/examples/widgets/textarea/lv_example_textarea_4.d 

OBJS += \
./lvgl/examples/widgets/textarea/lv_example_textarea_1.o \
./lvgl/examples/widgets/textarea/lv_example_textarea_2.o \
./lvgl/examples/widgets/textarea/lv_example_textarea_3.o \
./lvgl/examples/widgets/textarea/lv_example_textarea_4.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/widgets/textarea/%.o lvgl/examples/widgets/textarea/%.su lvgl/examples/widgets/textarea/%.cyclo: ../lvgl/examples/widgets/textarea/%.c lvgl/examples/widgets/textarea/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-widgets-2f-textarea

clean-lvgl-2f-examples-2f-widgets-2f-textarea:
	-$(RM) ./lvgl/examples/widgets/textarea/lv_example_textarea_1.cyclo ./lvgl/examples/widgets/textarea/lv_example_textarea_1.d ./lvgl/examples/widgets/textarea/lv_example_textarea_1.o ./lvgl/examples/widgets/textarea/lv_example_textarea_1.su ./lvgl/examples/widgets/textarea/lv_example_textarea_2.cyclo ./lvgl/examples/widgets/textarea/lv_example_textarea_2.d ./lvgl/examples/widgets/textarea/lv_example_textarea_2.o ./lvgl/examples/widgets/textarea/lv_example_textarea_2.su ./lvgl/examples/widgets/textarea/lv_example_textarea_3.cyclo ./lvgl/examples/widgets/textarea/lv_example_textarea_3.d ./lvgl/examples/widgets/textarea/lv_example_textarea_3.o ./lvgl/examples/widgets/textarea/lv_example_textarea_3.su ./lvgl/examples/widgets/textarea/lv_example_textarea_4.cyclo ./lvgl/examples/widgets/textarea/lv_example_textarea_4.d ./lvgl/examples/widgets/textarea/lv_example_textarea_4.o ./lvgl/examples/widgets/textarea/lv_example_textarea_4.su

.PHONY: clean-lvgl-2f-examples-2f-widgets-2f-textarea

