################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/draw/dma2d/lv_draw_dma2d.c \
../lvgl/src/draw/dma2d/lv_draw_dma2d_fill.c \
../lvgl/src/draw/dma2d/lv_draw_dma2d_img.c 

C_DEPS += \
./lvgl/src/draw/dma2d/lv_draw_dma2d.d \
./lvgl/src/draw/dma2d/lv_draw_dma2d_fill.d \
./lvgl/src/draw/dma2d/lv_draw_dma2d_img.d 

OBJS += \
./lvgl/src/draw/dma2d/lv_draw_dma2d.o \
./lvgl/src/draw/dma2d/lv_draw_dma2d_fill.o \
./lvgl/src/draw/dma2d/lv_draw_dma2d_img.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/draw/dma2d/%.o lvgl/src/draw/dma2d/%.su lvgl/src/draw/dma2d/%.cyclo: ../lvgl/src/draw/dma2d/%.c lvgl/src/draw/dma2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-draw-2f-dma2d

clean-lvgl-2f-src-2f-draw-2f-dma2d:
	-$(RM) ./lvgl/src/draw/dma2d/lv_draw_dma2d.cyclo ./lvgl/src/draw/dma2d/lv_draw_dma2d.d ./lvgl/src/draw/dma2d/lv_draw_dma2d.o ./lvgl/src/draw/dma2d/lv_draw_dma2d.su ./lvgl/src/draw/dma2d/lv_draw_dma2d_fill.cyclo ./lvgl/src/draw/dma2d/lv_draw_dma2d_fill.d ./lvgl/src/draw/dma2d/lv_draw_dma2d_fill.o ./lvgl/src/draw/dma2d/lv_draw_dma2d_fill.su ./lvgl/src/draw/dma2d/lv_draw_dma2d_img.cyclo ./lvgl/src/draw/dma2d/lv_draw_dma2d_img.d ./lvgl/src/draw/dma2d/lv_draw_dma2d_img.o ./lvgl/src/draw/dma2d/lv_draw_dma2d_img.su

.PHONY: clean-lvgl-2f-src-2f-draw-2f-dma2d

