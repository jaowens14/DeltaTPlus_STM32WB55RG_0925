################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/drivers/wayland/lv_wayland.c \
../lvgl/src/drivers/wayland/lv_wayland_smm.c \
../lvgl/src/drivers/wayland/lv_wl_cache.c \
../lvgl/src/drivers/wayland/lv_wl_dmabuf.c \
../lvgl/src/drivers/wayland/lv_wl_keyboard.c \
../lvgl/src/drivers/wayland/lv_wl_pointer.c \
../lvgl/src/drivers/wayland/lv_wl_pointer_axis.c \
../lvgl/src/drivers/wayland/lv_wl_seat.c \
../lvgl/src/drivers/wayland/lv_wl_shm.c \
../lvgl/src/drivers/wayland/lv_wl_touch.c \
../lvgl/src/drivers/wayland/lv_wl_window.c \
../lvgl/src/drivers/wayland/lv_wl_window_decorations.c \
../lvgl/src/drivers/wayland/lv_wl_xdg_shell.c 

C_DEPS += \
./lvgl/src/drivers/wayland/lv_wayland.d \
./lvgl/src/drivers/wayland/lv_wayland_smm.d \
./lvgl/src/drivers/wayland/lv_wl_cache.d \
./lvgl/src/drivers/wayland/lv_wl_dmabuf.d \
./lvgl/src/drivers/wayland/lv_wl_keyboard.d \
./lvgl/src/drivers/wayland/lv_wl_pointer.d \
./lvgl/src/drivers/wayland/lv_wl_pointer_axis.d \
./lvgl/src/drivers/wayland/lv_wl_seat.d \
./lvgl/src/drivers/wayland/lv_wl_shm.d \
./lvgl/src/drivers/wayland/lv_wl_touch.d \
./lvgl/src/drivers/wayland/lv_wl_window.d \
./lvgl/src/drivers/wayland/lv_wl_window_decorations.d \
./lvgl/src/drivers/wayland/lv_wl_xdg_shell.d 

OBJS += \
./lvgl/src/drivers/wayland/lv_wayland.o \
./lvgl/src/drivers/wayland/lv_wayland_smm.o \
./lvgl/src/drivers/wayland/lv_wl_cache.o \
./lvgl/src/drivers/wayland/lv_wl_dmabuf.o \
./lvgl/src/drivers/wayland/lv_wl_keyboard.o \
./lvgl/src/drivers/wayland/lv_wl_pointer.o \
./lvgl/src/drivers/wayland/lv_wl_pointer_axis.o \
./lvgl/src/drivers/wayland/lv_wl_seat.o \
./lvgl/src/drivers/wayland/lv_wl_shm.o \
./lvgl/src/drivers/wayland/lv_wl_touch.o \
./lvgl/src/drivers/wayland/lv_wl_window.o \
./lvgl/src/drivers/wayland/lv_wl_window_decorations.o \
./lvgl/src/drivers/wayland/lv_wl_xdg_shell.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/drivers/wayland/%.o lvgl/src/drivers/wayland/%.su lvgl/src/drivers/wayland/%.cyclo: ../lvgl/src/drivers/wayland/%.c lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-drivers-2f-wayland

clean-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./lvgl/src/drivers/wayland/lv_wayland.cyclo ./lvgl/src/drivers/wayland/lv_wayland.d ./lvgl/src/drivers/wayland/lv_wayland.o ./lvgl/src/drivers/wayland/lv_wayland.su ./lvgl/src/drivers/wayland/lv_wayland_smm.cyclo ./lvgl/src/drivers/wayland/lv_wayland_smm.d ./lvgl/src/drivers/wayland/lv_wayland_smm.o ./lvgl/src/drivers/wayland/lv_wayland_smm.su ./lvgl/src/drivers/wayland/lv_wl_cache.cyclo ./lvgl/src/drivers/wayland/lv_wl_cache.d ./lvgl/src/drivers/wayland/lv_wl_cache.o ./lvgl/src/drivers/wayland/lv_wl_cache.su ./lvgl/src/drivers/wayland/lv_wl_dmabuf.cyclo ./lvgl/src/drivers/wayland/lv_wl_dmabuf.d ./lvgl/src/drivers/wayland/lv_wl_dmabuf.o ./lvgl/src/drivers/wayland/lv_wl_dmabuf.su ./lvgl/src/drivers/wayland/lv_wl_keyboard.cyclo ./lvgl/src/drivers/wayland/lv_wl_keyboard.d ./lvgl/src/drivers/wayland/lv_wl_keyboard.o ./lvgl/src/drivers/wayland/lv_wl_keyboard.su ./lvgl/src/drivers/wayland/lv_wl_pointer.cyclo ./lvgl/src/drivers/wayland/lv_wl_pointer.d ./lvgl/src/drivers/wayland/lv_wl_pointer.o ./lvgl/src/drivers/wayland/lv_wl_pointer.su ./lvgl/src/drivers/wayland/lv_wl_pointer_axis.cyclo ./lvgl/src/drivers/wayland/lv_wl_pointer_axis.d ./lvgl/src/drivers/wayland/lv_wl_pointer_axis.o ./lvgl/src/drivers/wayland/lv_wl_pointer_axis.su ./lvgl/src/drivers/wayland/lv_wl_seat.cyclo ./lvgl/src/drivers/wayland/lv_wl_seat.d ./lvgl/src/drivers/wayland/lv_wl_seat.o ./lvgl/src/drivers/wayland/lv_wl_seat.su ./lvgl/src/drivers/wayland/lv_wl_shm.cyclo ./lvgl/src/drivers/wayland/lv_wl_shm.d ./lvgl/src/drivers/wayland/lv_wl_shm.o ./lvgl/src/drivers/wayland/lv_wl_shm.su ./lvgl/src/drivers/wayland/lv_wl_touch.cyclo ./lvgl/src/drivers/wayland/lv_wl_touch.d ./lvgl/src/drivers/wayland/lv_wl_touch.o ./lvgl/src/drivers/wayland/lv_wl_touch.su ./lvgl/src/drivers/wayland/lv_wl_window.cyclo ./lvgl/src/drivers/wayland/lv_wl_window.d ./lvgl/src/drivers/wayland/lv_wl_window.o ./lvgl/src/drivers/wayland/lv_wl_window.su ./lvgl/src/drivers/wayland/lv_wl_window_decorations.cyclo ./lvgl/src/drivers/wayland/lv_wl_window_decorations.d ./lvgl/src/drivers/wayland/lv_wl_window_decorations.o ./lvgl/src/drivers/wayland/lv_wl_window_decorations.su ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.cyclo ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.d ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.o ./lvgl/src/drivers/wayland/lv_wl_xdg_shell.su

.PHONY: clean-lvgl-2f-src-2f-drivers-2f-wayland

