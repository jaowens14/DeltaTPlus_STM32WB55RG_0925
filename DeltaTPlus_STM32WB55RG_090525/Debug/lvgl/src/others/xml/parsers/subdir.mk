################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/others/xml/parsers/lv_xml_arc_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_bar_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_button_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_calendar_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_canvas_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_chart_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_image_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_label_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_obj_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_roller_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_scale_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_slider_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_switch_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_table_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_tabview_parser.c \
../lvgl/src/others/xml/parsers/lv_xml_textarea_parser.c 

C_DEPS += \
./lvgl/src/others/xml/parsers/lv_xml_arc_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_bar_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_button_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_calendar_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_canvas_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_chart_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_image_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_label_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_obj_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_roller_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_scale_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_slider_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_switch_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_table_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_tabview_parser.d \
./lvgl/src/others/xml/parsers/lv_xml_textarea_parser.d 

OBJS += \
./lvgl/src/others/xml/parsers/lv_xml_arc_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_bar_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_button_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_calendar_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_canvas_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_chart_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_image_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_label_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_obj_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_roller_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_scale_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_slider_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_switch_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_table_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_tabview_parser.o \
./lvgl/src/others/xml/parsers/lv_xml_textarea_parser.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/others/xml/parsers/%.o lvgl/src/others/xml/parsers/%.su lvgl/src/others/xml/parsers/%.cyclo: ../lvgl/src/others/xml/parsers/%.c lvgl/src/others/xml/parsers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Ofast -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-others-2f-xml-2f-parsers

clean-lvgl-2f-src-2f-others-2f-xml-2f-parsers:
	-$(RM) ./lvgl/src/others/xml/parsers/lv_xml_arc_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_arc_parser.d ./lvgl/src/others/xml/parsers/lv_xml_arc_parser.o ./lvgl/src/others/xml/parsers/lv_xml_arc_parser.su ./lvgl/src/others/xml/parsers/lv_xml_bar_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_bar_parser.d ./lvgl/src/others/xml/parsers/lv_xml_bar_parser.o ./lvgl/src/others/xml/parsers/lv_xml_bar_parser.su ./lvgl/src/others/xml/parsers/lv_xml_button_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_button_parser.d ./lvgl/src/others/xml/parsers/lv_xml_button_parser.o ./lvgl/src/others/xml/parsers/lv_xml_button_parser.su ./lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.d ./lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.o ./lvgl/src/others/xml/parsers/lv_xml_buttonmatrix_parser.su ./lvgl/src/others/xml/parsers/lv_xml_calendar_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_calendar_parser.d ./lvgl/src/others/xml/parsers/lv_xml_calendar_parser.o ./lvgl/src/others/xml/parsers/lv_xml_calendar_parser.su ./lvgl/src/others/xml/parsers/lv_xml_canvas_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_canvas_parser.d ./lvgl/src/others/xml/parsers/lv_xml_canvas_parser.o ./lvgl/src/others/xml/parsers/lv_xml_canvas_parser.su ./lvgl/src/others/xml/parsers/lv_xml_chart_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_chart_parser.d ./lvgl/src/others/xml/parsers/lv_xml_chart_parser.o ./lvgl/src/others/xml/parsers/lv_xml_chart_parser.su ./lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.d ./lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.o ./lvgl/src/others/xml/parsers/lv_xml_checkbox_parser.su ./lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.d ./lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.o ./lvgl/src/others/xml/parsers/lv_xml_dropdown_parser.su ./lvgl/src/others/xml/parsers/lv_xml_image_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_image_parser.d ./lvgl/src/others/xml/parsers/lv_xml_image_parser.o ./lvgl/src/others/xml/parsers/lv_xml_image_parser.su ./lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.d ./lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.o ./lvgl/src/others/xml/parsers/lv_xml_keyboard_parser.su ./lvgl/src/others/xml/parsers/lv_xml_label_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_label_parser.d ./lvgl/src/others/xml/parsers/lv_xml_label_parser.o ./lvgl/src/others/xml/parsers/lv_xml_label_parser.su ./lvgl/src/others/xml/parsers/lv_xml_obj_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_obj_parser.d ./lvgl/src/others/xml/parsers/lv_xml_obj_parser.o ./lvgl/src/others/xml/parsers/lv_xml_obj_parser.su ./lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.d ./lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.o ./lvgl/src/others/xml/parsers/lv_xml_qrcode_parser.su ./lvgl/src/others/xml/parsers/lv_xml_roller_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_roller_parser.d ./lvgl/src/others/xml/parsers/lv_xml_roller_parser.o ./lvgl/src/others/xml/parsers/lv_xml_roller_parser.su ./lvgl/src/others/xml/parsers/lv_xml_scale_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_scale_parser.d ./lvgl/src/others/xml/parsers/lv_xml_scale_parser.o ./lvgl/src/others/xml/parsers/lv_xml_scale_parser.su ./lvgl/src/others/xml/parsers/lv_xml_slider_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_slider_parser.d ./lvgl/src/others/xml/parsers/lv_xml_slider_parser.o ./lvgl/src/others/xml/parsers/lv_xml_slider_parser.su ./lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.d ./lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.o ./lvgl/src/others/xml/parsers/lv_xml_spangroup_parser.su ./lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.d ./lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.o ./lvgl/src/others/xml/parsers/lv_xml_spinbox_parser.su ./lvgl/src/others/xml/parsers/lv_xml_switch_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_switch_parser.d ./lvgl/src/others/xml/parsers/lv_xml_switch_parser.o ./lvgl/src/others/xml/parsers/lv_xml_switch_parser.su ./lvgl/src/others/xml/parsers/lv_xml_table_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_table_parser.d ./lvgl/src/others/xml/parsers/lv_xml_table_parser.o ./lvgl/src/others/xml/parsers/lv_xml_table_parser.su ./lvgl/src/others/xml/parsers/lv_xml_tabview_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_tabview_parser.d ./lvgl/src/others/xml/parsers/lv_xml_tabview_parser.o ./lvgl/src/others/xml/parsers/lv_xml_tabview_parser.su ./lvgl/src/others/xml/parsers/lv_xml_textarea_parser.cyclo ./lvgl/src/others/xml/parsers/lv_xml_textarea_parser.d ./lvgl/src/others/xml/parsers/lv_xml_textarea_parser.o ./lvgl/src/others/xml/parsers/lv_xml_textarea_parser.su

.PHONY: clean-lvgl-2f-src-2f-others-2f-xml-2f-parsers

