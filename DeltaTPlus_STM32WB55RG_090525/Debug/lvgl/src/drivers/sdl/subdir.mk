################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/sdl/lv_sdl_keyboard.c \
../lvgl/src/drivers/sdl/lv_sdl_mouse.c \
../lvgl/src/drivers/sdl/lv_sdl_mousewheel.c \
../lvgl/src/drivers/sdl/lv_sdl_window.c 

C_DEPS += \
./lvgl/src/drivers/sdl/lv_sdl_keyboard.d \
./lvgl/src/drivers/sdl/lv_sdl_mouse.d \
./lvgl/src/drivers/sdl/lv_sdl_mousewheel.d \
./lvgl/src/drivers/sdl/lv_sdl_window.d 

OBJS += \
./lvgl/src/drivers/sdl/lv_sdl_keyboard.o \
./lvgl/src/drivers/sdl/lv_sdl_mouse.o \
./lvgl/src/drivers/sdl/lv_sdl_mousewheel.o \
./lvgl/src/drivers/sdl/lv_sdl_window.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/sdl/%.o lvgl/src/drivers/sdl/%.su lvgl/src/drivers/sdl/%.cyclo: ../lvgl/src/drivers/sdl/%.c lvgl/src/drivers/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-sdl

clean-lvgl-2f-src-2f-drivers-2f-sdl:
	-$(RM) ./lvgl/src/drivers/sdl/lv_sdl_keyboard.cyclo ./lvgl/src/drivers/sdl/lv_sdl_keyboard.d ./lvgl/src/drivers/sdl/lv_sdl_keyboard.o ./lvgl/src/drivers/sdl/lv_sdl_keyboard.su ./lvgl/src/drivers/sdl/lv_sdl_mouse.cyclo ./lvgl/src/drivers/sdl/lv_sdl_mouse.d ./lvgl/src/drivers/sdl/lv_sdl_mouse.o ./lvgl/src/drivers/sdl/lv_sdl_mouse.su ./lvgl/src/drivers/sdl/lv_sdl_mousewheel.cyclo ./lvgl/src/drivers/sdl/lv_sdl_mousewheel.d ./lvgl/src/drivers/sdl/lv_sdl_mousewheel.o ./lvgl/src/drivers/sdl/lv_sdl_mousewheel.su ./lvgl/src/drivers/sdl/lv_sdl_window.cyclo ./lvgl/src/drivers/sdl/lv_sdl_window.d ./lvgl/src/drivers/sdl/lv_sdl_window.o ./lvgl/src/drivers/sdl/lv_sdl_window.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-sdl

