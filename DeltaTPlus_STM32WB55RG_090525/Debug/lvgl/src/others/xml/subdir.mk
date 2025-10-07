################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/others/xml/lv_xml.c \
../lvgl/src/others/xml/lv_xml_base_types.c \
../lvgl/src/others/xml/lv_xml_component.c \
../lvgl/src/others/xml/lv_xml_load.c \
../lvgl/src/others/xml/lv_xml_parser.c \
../lvgl/src/others/xml/lv_xml_style.c \
../lvgl/src/others/xml/lv_xml_test.c \
../lvgl/src/others/xml/lv_xml_translation.c \
../lvgl/src/others/xml/lv_xml_update.c \
../lvgl/src/others/xml/lv_xml_utils.c \
../lvgl/src/others/xml/lv_xml_widget.c 

C_DEPS += \
./lvgl/src/others/xml/lv_xml.d \
./lvgl/src/others/xml/lv_xml_base_types.d \
./lvgl/src/others/xml/lv_xml_component.d \
./lvgl/src/others/xml/lv_xml_load.d \
./lvgl/src/others/xml/lv_xml_parser.d \
./lvgl/src/others/xml/lv_xml_style.d \
./lvgl/src/others/xml/lv_xml_test.d \
./lvgl/src/others/xml/lv_xml_translation.d \
./lvgl/src/others/xml/lv_xml_update.d \
./lvgl/src/others/xml/lv_xml_utils.d \
./lvgl/src/others/xml/lv_xml_widget.d 

OBJS += \
./lvgl/src/others/xml/lv_xml.o \
./lvgl/src/others/xml/lv_xml_base_types.o \
./lvgl/src/others/xml/lv_xml_component.o \
./lvgl/src/others/xml/lv_xml_load.o \
./lvgl/src/others/xml/lv_xml_parser.o \
./lvgl/src/others/xml/lv_xml_style.o \
./lvgl/src/others/xml/lv_xml_test.o \
./lvgl/src/others/xml/lv_xml_translation.o \
./lvgl/src/others/xml/lv_xml_update.o \
./lvgl/src/others/xml/lv_xml_utils.o \
./lvgl/src/others/xml/lv_xml_widget.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/others/xml/%.o lvgl/src/others/xml/%.su lvgl/src/others/xml/%.cyclo: ../lvgl/src/others/xml/%.c lvgl/src/others/xml/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-others-2f-xml

clean-lvgl-2f-src-2f-others-2f-xml:
	-$(RM) ./lvgl/src/others/xml/lv_xml.cyclo ./lvgl/src/others/xml/lv_xml.d ./lvgl/src/others/xml/lv_xml.o ./lvgl/src/others/xml/lv_xml.su ./lvgl/src/others/xml/lv_xml_base_types.cyclo ./lvgl/src/others/xml/lv_xml_base_types.d ./lvgl/src/others/xml/lv_xml_base_types.o ./lvgl/src/others/xml/lv_xml_base_types.su ./lvgl/src/others/xml/lv_xml_component.cyclo ./lvgl/src/others/xml/lv_xml_component.d ./lvgl/src/others/xml/lv_xml_component.o ./lvgl/src/others/xml/lv_xml_component.su ./lvgl/src/others/xml/lv_xml_load.cyclo ./lvgl/src/others/xml/lv_xml_load.d ./lvgl/src/others/xml/lv_xml_load.o ./lvgl/src/others/xml/lv_xml_load.su ./lvgl/src/others/xml/lv_xml_parser.cyclo ./lvgl/src/others/xml/lv_xml_parser.d ./lvgl/src/others/xml/lv_xml_parser.o ./lvgl/src/others/xml/lv_xml_parser.su ./lvgl/src/others/xml/lv_xml_style.cyclo ./lvgl/src/others/xml/lv_xml_style.d ./lvgl/src/others/xml/lv_xml_style.o ./lvgl/src/others/xml/lv_xml_style.su ./lvgl/src/others/xml/lv_xml_test.cyclo ./lvgl/src/others/xml/lv_xml_test.d ./lvgl/src/others/xml/lv_xml_test.o ./lvgl/src/others/xml/lv_xml_test.su ./lvgl/src/others/xml/lv_xml_translation.cyclo ./lvgl/src/others/xml/lv_xml_translation.d ./lvgl/src/others/xml/lv_xml_translation.o ./lvgl/src/others/xml/lv_xml_translation.su ./lvgl/src/others/xml/lv_xml_update.cyclo ./lvgl/src/others/xml/lv_xml_update.d ./lvgl/src/others/xml/lv_xml_update.o ./lvgl/src/others/xml/lv_xml_update.su ./lvgl/src/others/xml/lv_xml_utils.cyclo ./lvgl/src/others/xml/lv_xml_utils.d ./lvgl/src/others/xml/lv_xml_utils.o ./lvgl/src/others/xml/lv_xml_utils.su ./lvgl/src/others/xml/lv_xml_widget.cyclo ./lvgl/src/others/xml/lv_xml_widget.d ./lvgl/src/others/xml/lv_xml_widget.o ./lvgl/src/others/xml/lv_xml_widget.su

.PHONY: clean-lvgl-2f-src-2f-others-2f-xml

