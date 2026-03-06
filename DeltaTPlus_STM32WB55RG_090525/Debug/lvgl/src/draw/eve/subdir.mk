################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/draw/eve/lv_draw_eve.c \
../lvgl/src/draw/eve/lv_draw_eve_arc.c \
../lvgl/src/draw/eve/lv_draw_eve_fill.c \
../lvgl/src/draw/eve/lv_draw_eve_image.c \
../lvgl/src/draw/eve/lv_draw_eve_letter.c \
../lvgl/src/draw/eve/lv_draw_eve_line.c \
../lvgl/src/draw/eve/lv_draw_eve_ram_g.c \
../lvgl/src/draw/eve/lv_draw_eve_triangle.c \
../lvgl/src/draw/eve/lv_eve.c 

C_DEPS += \
./lvgl/src/draw/eve/lv_draw_eve.d \
./lvgl/src/draw/eve/lv_draw_eve_arc.d \
./lvgl/src/draw/eve/lv_draw_eve_fill.d \
./lvgl/src/draw/eve/lv_draw_eve_image.d \
./lvgl/src/draw/eve/lv_draw_eve_letter.d \
./lvgl/src/draw/eve/lv_draw_eve_line.d \
./lvgl/src/draw/eve/lv_draw_eve_ram_g.d \
./lvgl/src/draw/eve/lv_draw_eve_triangle.d \
./lvgl/src/draw/eve/lv_eve.d 

OBJS += \
./lvgl/src/draw/eve/lv_draw_eve.o \
./lvgl/src/draw/eve/lv_draw_eve_arc.o \
./lvgl/src/draw/eve/lv_draw_eve_fill.o \
./lvgl/src/draw/eve/lv_draw_eve_image.o \
./lvgl/src/draw/eve/lv_draw_eve_letter.o \
./lvgl/src/draw/eve/lv_draw_eve_line.o \
./lvgl/src/draw/eve/lv_draw_eve_ram_g.o \
./lvgl/src/draw/eve/lv_draw_eve_triangle.o \
./lvgl/src/draw/eve/lv_eve.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/draw/eve/%.o lvgl/src/draw/eve/%.su lvgl/src/draw/eve/%.cyclo: ../lvgl/src/draw/eve/%.c lvgl/src/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Ofast -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-draw-2f-eve

clean-lvgl-2f-src-2f-draw-2f-eve:
	-$(RM) ./lvgl/src/draw/eve/lv_draw_eve.cyclo ./lvgl/src/draw/eve/lv_draw_eve.d ./lvgl/src/draw/eve/lv_draw_eve.o ./lvgl/src/draw/eve/lv_draw_eve.su ./lvgl/src/draw/eve/lv_draw_eve_arc.cyclo ./lvgl/src/draw/eve/lv_draw_eve_arc.d ./lvgl/src/draw/eve/lv_draw_eve_arc.o ./lvgl/src/draw/eve/lv_draw_eve_arc.su ./lvgl/src/draw/eve/lv_draw_eve_fill.cyclo ./lvgl/src/draw/eve/lv_draw_eve_fill.d ./lvgl/src/draw/eve/lv_draw_eve_fill.o ./lvgl/src/draw/eve/lv_draw_eve_fill.su ./lvgl/src/draw/eve/lv_draw_eve_image.cyclo ./lvgl/src/draw/eve/lv_draw_eve_image.d ./lvgl/src/draw/eve/lv_draw_eve_image.o ./lvgl/src/draw/eve/lv_draw_eve_image.su ./lvgl/src/draw/eve/lv_draw_eve_letter.cyclo ./lvgl/src/draw/eve/lv_draw_eve_letter.d ./lvgl/src/draw/eve/lv_draw_eve_letter.o ./lvgl/src/draw/eve/lv_draw_eve_letter.su ./lvgl/src/draw/eve/lv_draw_eve_line.cyclo ./lvgl/src/draw/eve/lv_draw_eve_line.d ./lvgl/src/draw/eve/lv_draw_eve_line.o ./lvgl/src/draw/eve/lv_draw_eve_line.su ./lvgl/src/draw/eve/lv_draw_eve_ram_g.cyclo ./lvgl/src/draw/eve/lv_draw_eve_ram_g.d ./lvgl/src/draw/eve/lv_draw_eve_ram_g.o ./lvgl/src/draw/eve/lv_draw_eve_ram_g.su ./lvgl/src/draw/eve/lv_draw_eve_triangle.cyclo ./lvgl/src/draw/eve/lv_draw_eve_triangle.d ./lvgl/src/draw/eve/lv_draw_eve_triangle.o ./lvgl/src/draw/eve/lv_draw_eve_triangle.su ./lvgl/src/draw/eve/lv_eve.cyclo ./lvgl/src/draw/eve/lv_eve.d ./lvgl/src/draw/eve/lv_eve.o ./lvgl/src/draw/eve/lv_eve.su

.PHONY: clean-lvgl-2f-src-2f-draw-2f-eve

