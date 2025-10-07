################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/demos/widgets/lv_demo_widgets.c \
../lvgl/demos/widgets/lv_demo_widgets_analytics.c \
../lvgl/demos/widgets/lv_demo_widgets_components.c \
../lvgl/demos/widgets/lv_demo_widgets_profile.c \
../lvgl/demos/widgets/lv_demo_widgets_shop.c 

C_DEPS += \
./lvgl/demos/widgets/lv_demo_widgets.d \
./lvgl/demos/widgets/lv_demo_widgets_analytics.d \
./lvgl/demos/widgets/lv_demo_widgets_components.d \
./lvgl/demos/widgets/lv_demo_widgets_profile.d \
./lvgl/demos/widgets/lv_demo_widgets_shop.d 

OBJS += \
./lvgl/demos/widgets/lv_demo_widgets.o \
./lvgl/demos/widgets/lv_demo_widgets_analytics.o \
./lvgl/demos/widgets/lv_demo_widgets_components.o \
./lvgl/demos/widgets/lv_demo_widgets_profile.o \
./lvgl/demos/widgets/lv_demo_widgets_shop.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/demos/widgets/%.o lvgl/demos/widgets/%.su lvgl/demos/widgets/%.cyclo: ../lvgl/demos/widgets/%.c lvgl/demos/widgets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-demos-2f-widgets

clean-lvgl-2f-demos-2f-widgets:
	-$(RM) ./lvgl/demos/widgets/lv_demo_widgets.cyclo ./lvgl/demos/widgets/lv_demo_widgets.d ./lvgl/demos/widgets/lv_demo_widgets.o ./lvgl/demos/widgets/lv_demo_widgets.su ./lvgl/demos/widgets/lv_demo_widgets_analytics.cyclo ./lvgl/demos/widgets/lv_demo_widgets_analytics.d ./lvgl/demos/widgets/lv_demo_widgets_analytics.o ./lvgl/demos/widgets/lv_demo_widgets_analytics.su ./lvgl/demos/widgets/lv_demo_widgets_components.cyclo ./lvgl/demos/widgets/lv_demo_widgets_components.d ./lvgl/demos/widgets/lv_demo_widgets_components.o ./lvgl/demos/widgets/lv_demo_widgets_components.su ./lvgl/demos/widgets/lv_demo_widgets_profile.cyclo ./lvgl/demos/widgets/lv_demo_widgets_profile.d ./lvgl/demos/widgets/lv_demo_widgets_profile.o ./lvgl/demos/widgets/lv_demo_widgets_profile.su ./lvgl/demos/widgets/lv_demo_widgets_shop.cyclo ./lvgl/demos/widgets/lv_demo_widgets_shop.d ./lvgl/demos/widgets/lv_demo_widgets_shop.o ./lvgl/demos/widgets/lv_demo_widgets_shop.su

.PHONY: clean-lvgl-2f-demos-2f-widgets

