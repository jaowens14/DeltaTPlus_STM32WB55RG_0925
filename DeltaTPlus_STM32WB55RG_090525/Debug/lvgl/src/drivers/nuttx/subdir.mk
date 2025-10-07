################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/nuttx/lv_nuttx_cache.c \
../lvgl/src/drivers/nuttx/lv_nuttx_entry.c \
../lvgl/src/drivers/nuttx/lv_nuttx_fbdev.c \
../lvgl/src/drivers/nuttx/lv_nuttx_image_cache.c \
../lvgl/src/drivers/nuttx/lv_nuttx_lcd.c \
../lvgl/src/drivers/nuttx/lv_nuttx_libuv.c \
../lvgl/src/drivers/nuttx/lv_nuttx_mouse.c \
../lvgl/src/drivers/nuttx/lv_nuttx_profiler.c \
../lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.c 

C_DEPS += \
./lvgl/src/drivers/nuttx/lv_nuttx_cache.d \
./lvgl/src/drivers/nuttx/lv_nuttx_entry.d \
./lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d \
./lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d \
./lvgl/src/drivers/nuttx/lv_nuttx_lcd.d \
./lvgl/src/drivers/nuttx/lv_nuttx_libuv.d \
./lvgl/src/drivers/nuttx/lv_nuttx_mouse.d \
./lvgl/src/drivers/nuttx/lv_nuttx_profiler.d \
./lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d 

OBJS += \
./lvgl/src/drivers/nuttx/lv_nuttx_cache.o \
./lvgl/src/drivers/nuttx/lv_nuttx_entry.o \
./lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o \
./lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o \
./lvgl/src/drivers/nuttx/lv_nuttx_lcd.o \
./lvgl/src/drivers/nuttx/lv_nuttx_libuv.o \
./lvgl/src/drivers/nuttx/lv_nuttx_mouse.o \
./lvgl/src/drivers/nuttx/lv_nuttx_profiler.o \
./lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/nuttx/%.o lvgl/src/drivers/nuttx/%.su lvgl/src/drivers/nuttx/%.cyclo: ../lvgl/src/drivers/nuttx/%.c lvgl/src/drivers/nuttx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-nuttx

clean-lvgl-2f-src-2f-drivers-2f-nuttx:
	-$(RM) ./lvgl/src/drivers/nuttx/lv_nuttx_cache.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_cache.d ./lvgl/src/drivers/nuttx/lv_nuttx_cache.o ./lvgl/src/drivers/nuttx/lv_nuttx_cache.su ./lvgl/src/drivers/nuttx/lv_nuttx_entry.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_entry.d ./lvgl/src/drivers/nuttx/lv_nuttx_entry.o ./lvgl/src/drivers/nuttx/lv_nuttx_entry.su ./lvgl/src/drivers/nuttx/lv_nuttx_fbdev.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d ./lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o ./lvgl/src/drivers/nuttx/lv_nuttx_fbdev.su ./lvgl/src/drivers/nuttx/lv_nuttx_image_cache.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d ./lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o ./lvgl/src/drivers/nuttx/lv_nuttx_image_cache.su ./lvgl/src/drivers/nuttx/lv_nuttx_lcd.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_lcd.d ./lvgl/src/drivers/nuttx/lv_nuttx_lcd.o ./lvgl/src/drivers/nuttx/lv_nuttx_lcd.su ./lvgl/src/drivers/nuttx/lv_nuttx_libuv.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_libuv.d ./lvgl/src/drivers/nuttx/lv_nuttx_libuv.o ./lvgl/src/drivers/nuttx/lv_nuttx_libuv.su ./lvgl/src/drivers/nuttx/lv_nuttx_mouse.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_mouse.d ./lvgl/src/drivers/nuttx/lv_nuttx_mouse.o ./lvgl/src/drivers/nuttx/lv_nuttx_mouse.su ./lvgl/src/drivers/nuttx/lv_nuttx_profiler.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_profiler.d ./lvgl/src/drivers/nuttx/lv_nuttx_profiler.o ./lvgl/src/drivers/nuttx/lv_nuttx_profiler.su ./lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.cyclo ./lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d ./lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o ./lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-nuttx

