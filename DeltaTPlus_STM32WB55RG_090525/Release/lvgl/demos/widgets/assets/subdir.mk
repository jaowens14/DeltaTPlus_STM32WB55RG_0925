################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/demos/widgets/assets/img_clothes.c \
../lvgl/demos/widgets/assets/img_demo_widgets_avatar.c \
../lvgl/demos/widgets/assets/img_demo_widgets_needle.c \
../lvgl/demos/widgets/assets/img_lvgl_logo.c 

C_DEPS += \
./lvgl/demos/widgets/assets/img_clothes.d \
./lvgl/demos/widgets/assets/img_demo_widgets_avatar.d \
./lvgl/demos/widgets/assets/img_demo_widgets_needle.d \
./lvgl/demos/widgets/assets/img_lvgl_logo.d 

OBJS += \
./lvgl/demos/widgets/assets/img_clothes.o \
./lvgl/demos/widgets/assets/img_demo_widgets_avatar.o \
./lvgl/demos/widgets/assets/img_demo_widgets_needle.o \
./lvgl/demos/widgets/assets/img_lvgl_logo.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/demos/widgets/assets/%.o lvgl/demos/widgets/assets/%.su lvgl/demos/widgets/assets/%.cyclo: ../lvgl/demos/widgets/assets/%.c lvgl/demos/widgets/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-demos-2f-widgets-2f-assets

clean-lvgl-2f-demos-2f-widgets-2f-assets:
	-$(RM) ./lvgl/demos/widgets/assets/img_clothes.cyclo ./lvgl/demos/widgets/assets/img_clothes.d ./lvgl/demos/widgets/assets/img_clothes.o ./lvgl/demos/widgets/assets/img_clothes.su ./lvgl/demos/widgets/assets/img_demo_widgets_avatar.cyclo ./lvgl/demos/widgets/assets/img_demo_widgets_avatar.d ./lvgl/demos/widgets/assets/img_demo_widgets_avatar.o ./lvgl/demos/widgets/assets/img_demo_widgets_avatar.su ./lvgl/demos/widgets/assets/img_demo_widgets_needle.cyclo ./lvgl/demos/widgets/assets/img_demo_widgets_needle.d ./lvgl/demos/widgets/assets/img_demo_widgets_needle.o ./lvgl/demos/widgets/assets/img_demo_widgets_needle.su ./lvgl/demos/widgets/assets/img_lvgl_logo.cyclo ./lvgl/demos/widgets/assets/img_lvgl_logo.d ./lvgl/demos/widgets/assets/img_lvgl_logo.o ./lvgl/demos/widgets/assets/img_lvgl_logo.su

.PHONY: clean-lvgl-2f-demos-2f-widgets-2f-assets

