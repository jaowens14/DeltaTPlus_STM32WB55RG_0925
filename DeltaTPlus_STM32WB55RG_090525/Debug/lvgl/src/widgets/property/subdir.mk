################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/widgets/property/lv_animimage_properties.c \
../lvgl/src/widgets/property/lv_dropdown_properties.c \
../lvgl/src/widgets/property/lv_image_properties.c \
../lvgl/src/widgets/property/lv_keyboard_properties.c \
../lvgl/src/widgets/property/lv_label_properties.c \
../lvgl/src/widgets/property/lv_obj_properties.c \
../lvgl/src/widgets/property/lv_roller_properties.c \
../lvgl/src/widgets/property/lv_slider_properties.c \
../lvgl/src/widgets/property/lv_style_properties.c \
../lvgl/src/widgets/property/lv_textarea_properties.c 

C_DEPS += \
./lvgl/src/widgets/property/lv_animimage_properties.d \
./lvgl/src/widgets/property/lv_dropdown_properties.d \
./lvgl/src/widgets/property/lv_image_properties.d \
./lvgl/src/widgets/property/lv_keyboard_properties.d \
./lvgl/src/widgets/property/lv_label_properties.d \
./lvgl/src/widgets/property/lv_obj_properties.d \
./lvgl/src/widgets/property/lv_roller_properties.d \
./lvgl/src/widgets/property/lv_slider_properties.d \
./lvgl/src/widgets/property/lv_style_properties.d \
./lvgl/src/widgets/property/lv_textarea_properties.d 

OBJS += \
./lvgl/src/widgets/property/lv_animimage_properties.o \
./lvgl/src/widgets/property/lv_dropdown_properties.o \
./lvgl/src/widgets/property/lv_image_properties.o \
./lvgl/src/widgets/property/lv_keyboard_properties.o \
./lvgl/src/widgets/property/lv_label_properties.o \
./lvgl/src/widgets/property/lv_obj_properties.o \
./lvgl/src/widgets/property/lv_roller_properties.o \
./lvgl/src/widgets/property/lv_slider_properties.o \
./lvgl/src/widgets/property/lv_style_properties.o \
./lvgl/src/widgets/property/lv_textarea_properties.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/widgets/property/%.o lvgl/src/widgets/property/%.su lvgl/src/widgets/property/%.cyclo: ../lvgl/src/widgets/property/%.c lvgl/src/widgets/property/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -Ofast -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-widgets-2f-property

clean-lvgl-2f-src-2f-widgets-2f-property:
	-$(RM) ./lvgl/src/widgets/property/lv_animimage_properties.cyclo ./lvgl/src/widgets/property/lv_animimage_properties.d ./lvgl/src/widgets/property/lv_animimage_properties.o ./lvgl/src/widgets/property/lv_animimage_properties.su ./lvgl/src/widgets/property/lv_dropdown_properties.cyclo ./lvgl/src/widgets/property/lv_dropdown_properties.d ./lvgl/src/widgets/property/lv_dropdown_properties.o ./lvgl/src/widgets/property/lv_dropdown_properties.su ./lvgl/src/widgets/property/lv_image_properties.cyclo ./lvgl/src/widgets/property/lv_image_properties.d ./lvgl/src/widgets/property/lv_image_properties.o ./lvgl/src/widgets/property/lv_image_properties.su ./lvgl/src/widgets/property/lv_keyboard_properties.cyclo ./lvgl/src/widgets/property/lv_keyboard_properties.d ./lvgl/src/widgets/property/lv_keyboard_properties.o ./lvgl/src/widgets/property/lv_keyboard_properties.su ./lvgl/src/widgets/property/lv_label_properties.cyclo ./lvgl/src/widgets/property/lv_label_properties.d ./lvgl/src/widgets/property/lv_label_properties.o ./lvgl/src/widgets/property/lv_label_properties.su ./lvgl/src/widgets/property/lv_obj_properties.cyclo ./lvgl/src/widgets/property/lv_obj_properties.d ./lvgl/src/widgets/property/lv_obj_properties.o ./lvgl/src/widgets/property/lv_obj_properties.su ./lvgl/src/widgets/property/lv_roller_properties.cyclo ./lvgl/src/widgets/property/lv_roller_properties.d ./lvgl/src/widgets/property/lv_roller_properties.o ./lvgl/src/widgets/property/lv_roller_properties.su ./lvgl/src/widgets/property/lv_slider_properties.cyclo ./lvgl/src/widgets/property/lv_slider_properties.d ./lvgl/src/widgets/property/lv_slider_properties.o ./lvgl/src/widgets/property/lv_slider_properties.su ./lvgl/src/widgets/property/lv_style_properties.cyclo ./lvgl/src/widgets/property/lv_style_properties.d ./lvgl/src/widgets/property/lv_style_properties.o ./lvgl/src/widgets/property/lv_style_properties.su ./lvgl/src/widgets/property/lv_textarea_properties.cyclo ./lvgl/src/widgets/property/lv_textarea_properties.d ./lvgl/src/widgets/property/lv_textarea_properties.o ./lvgl/src/widgets/property/lv_textarea_properties.su

.PHONY: clean-lvgl-2f-src-2f-widgets-2f-property

