################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/env_support/pikascript/pika_lv_point_t.c \
../lvgl/env_support/pikascript/pika_lv_timer_t.c \
../lvgl/env_support/pikascript/pika_lv_wegit.c \
../lvgl/env_support/pikascript/pika_lvgl.c \
../lvgl/env_support/pikascript/pika_lvgl_indev_t.c \
../lvgl/env_support/pikascript/pika_lvgl_lv_event.c \
../lvgl/env_support/pikascript/pika_lvgl_lv_obj.c \
../lvgl/env_support/pikascript/pika_lvgl_lv_style_t.c 

C_DEPS += \
./lvgl/env_support/pikascript/pika_lv_point_t.d \
./lvgl/env_support/pikascript/pika_lv_timer_t.d \
./lvgl/env_support/pikascript/pika_lv_wegit.d \
./lvgl/env_support/pikascript/pika_lvgl.d \
./lvgl/env_support/pikascript/pika_lvgl_indev_t.d \
./lvgl/env_support/pikascript/pika_lvgl_lv_event.d \
./lvgl/env_support/pikascript/pika_lvgl_lv_obj.d \
./lvgl/env_support/pikascript/pika_lvgl_lv_style_t.d 

OBJS += \
./lvgl/env_support/pikascript/pika_lv_point_t.o \
./lvgl/env_support/pikascript/pika_lv_timer_t.o \
./lvgl/env_support/pikascript/pika_lv_wegit.o \
./lvgl/env_support/pikascript/pika_lvgl.o \
./lvgl/env_support/pikascript/pika_lvgl_indev_t.o \
./lvgl/env_support/pikascript/pika_lvgl_lv_event.o \
./lvgl/env_support/pikascript/pika_lvgl_lv_obj.o \
./lvgl/env_support/pikascript/pika_lvgl_lv_style_t.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/env_support/pikascript/%.o lvgl/env_support/pikascript/%.su lvgl/env_support/pikascript/%.cyclo: ../lvgl/env_support/pikascript/%.c lvgl/env_support/pikascript/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_MAX31856_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-env_support-2f-pikascript

clean-lvgl-2f-env_support-2f-pikascript:
	-$(RM) ./lvgl/env_support/pikascript/pika_lv_point_t.cyclo ./lvgl/env_support/pikascript/pika_lv_point_t.d ./lvgl/env_support/pikascript/pika_lv_point_t.o ./lvgl/env_support/pikascript/pika_lv_point_t.su ./lvgl/env_support/pikascript/pika_lv_timer_t.cyclo ./lvgl/env_support/pikascript/pika_lv_timer_t.d ./lvgl/env_support/pikascript/pika_lv_timer_t.o ./lvgl/env_support/pikascript/pika_lv_timer_t.su ./lvgl/env_support/pikascript/pika_lv_wegit.cyclo ./lvgl/env_support/pikascript/pika_lv_wegit.d ./lvgl/env_support/pikascript/pika_lv_wegit.o ./lvgl/env_support/pikascript/pika_lv_wegit.su ./lvgl/env_support/pikascript/pika_lvgl.cyclo ./lvgl/env_support/pikascript/pika_lvgl.d ./lvgl/env_support/pikascript/pika_lvgl.o ./lvgl/env_support/pikascript/pika_lvgl.su ./lvgl/env_support/pikascript/pika_lvgl_indev_t.cyclo ./lvgl/env_support/pikascript/pika_lvgl_indev_t.d ./lvgl/env_support/pikascript/pika_lvgl_indev_t.o ./lvgl/env_support/pikascript/pika_lvgl_indev_t.su ./lvgl/env_support/pikascript/pika_lvgl_lv_event.cyclo ./lvgl/env_support/pikascript/pika_lvgl_lv_event.d ./lvgl/env_support/pikascript/pika_lvgl_lv_event.o ./lvgl/env_support/pikascript/pika_lvgl_lv_event.su ./lvgl/env_support/pikascript/pika_lvgl_lv_obj.cyclo ./lvgl/env_support/pikascript/pika_lvgl_lv_obj.d ./lvgl/env_support/pikascript/pika_lvgl_lv_obj.o ./lvgl/env_support/pikascript/pika_lvgl_lv_obj.su ./lvgl/env_support/pikascript/pika_lvgl_lv_style_t.cyclo ./lvgl/env_support/pikascript/pika_lvgl_lv_style_t.d ./lvgl/env_support/pikascript/pika_lvgl_lv_style_t.o ./lvgl/env_support/pikascript/pika_lvgl_lv_style_t.su

.PHONY: clean-lvgl-2f-env_support-2f-pikascript

