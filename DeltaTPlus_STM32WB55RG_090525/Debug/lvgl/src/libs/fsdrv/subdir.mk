################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.cpp \
../lvgl/src/libs/fsdrv/lv_fs_arduino_sd.cpp 

C_SRCS += \
../lvgl/src/libs/fsdrv/lv_fs_cbfs.c \
../lvgl/src/libs/fsdrv/lv_fs_fatfs.c \
../lvgl/src/libs/fsdrv/lv_fs_frogfs.c \
../lvgl/src/libs/fsdrv/lv_fs_littlefs.c \
../lvgl/src/libs/fsdrv/lv_fs_memfs.c \
../lvgl/src/libs/fsdrv/lv_fs_posix.c \
../lvgl/src/libs/fsdrv/lv_fs_stdio.c \
../lvgl/src/libs/fsdrv/lv_fs_uefi.c \
../lvgl/src/libs/fsdrv/lv_fs_win32.c 

C_DEPS += \
./lvgl/src/libs/fsdrv/lv_fs_cbfs.d \
./lvgl/src/libs/fsdrv/lv_fs_fatfs.d \
./lvgl/src/libs/fsdrv/lv_fs_frogfs.d \
./lvgl/src/libs/fsdrv/lv_fs_littlefs.d \
./lvgl/src/libs/fsdrv/lv_fs_memfs.d \
./lvgl/src/libs/fsdrv/lv_fs_posix.d \
./lvgl/src/libs/fsdrv/lv_fs_stdio.d \
./lvgl/src/libs/fsdrv/lv_fs_uefi.d \
./lvgl/src/libs/fsdrv/lv_fs_win32.d 

OBJS += \
./lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.o \
./lvgl/src/libs/fsdrv/lv_fs_arduino_sd.o \
./lvgl/src/libs/fsdrv/lv_fs_cbfs.o \
./lvgl/src/libs/fsdrv/lv_fs_fatfs.o \
./lvgl/src/libs/fsdrv/lv_fs_frogfs.o \
./lvgl/src/libs/fsdrv/lv_fs_littlefs.o \
./lvgl/src/libs/fsdrv/lv_fs_memfs.o \
./lvgl/src/libs/fsdrv/lv_fs_posix.o \
./lvgl/src/libs/fsdrv/lv_fs_stdio.o \
./lvgl/src/libs/fsdrv/lv_fs_uefi.o \
./lvgl/src/libs/fsdrv/lv_fs_win32.o 

CPP_DEPS += \
./lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.d \
./lvgl/src/libs/fsdrv/lv_fs_arduino_sd.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/fsdrv/%.o lvgl/src/libs/fsdrv/%.su lvgl/src/libs/fsdrv/%.cyclo: ../lvgl/src/libs/fsdrv/%.cpp lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/FT5436" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
lvgl/src/libs/fsdrv/%.o lvgl/src/libs/fsdrv/%.su lvgl/src/libs/fsdrv/%.cyclo: ../lvgl/src/libs/fsdrv/%.c lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-fsdrv

clean-lvgl-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.d ./lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.o ./lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.su ./lvgl/src/libs/fsdrv/lv_fs_arduino_sd.cyclo ./lvgl/src/libs/fsdrv/lv_fs_arduino_sd.d ./lvgl/src/libs/fsdrv/lv_fs_arduino_sd.o ./lvgl/src/libs/fsdrv/lv_fs_arduino_sd.su ./lvgl/src/libs/fsdrv/lv_fs_cbfs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_cbfs.d ./lvgl/src/libs/fsdrv/lv_fs_cbfs.o ./lvgl/src/libs/fsdrv/lv_fs_cbfs.su ./lvgl/src/libs/fsdrv/lv_fs_fatfs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_fatfs.d ./lvgl/src/libs/fsdrv/lv_fs_fatfs.o ./lvgl/src/libs/fsdrv/lv_fs_fatfs.su ./lvgl/src/libs/fsdrv/lv_fs_frogfs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_frogfs.d ./lvgl/src/libs/fsdrv/lv_fs_frogfs.o ./lvgl/src/libs/fsdrv/lv_fs_frogfs.su ./lvgl/src/libs/fsdrv/lv_fs_littlefs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_littlefs.d ./lvgl/src/libs/fsdrv/lv_fs_littlefs.o ./lvgl/src/libs/fsdrv/lv_fs_littlefs.su ./lvgl/src/libs/fsdrv/lv_fs_memfs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_memfs.d ./lvgl/src/libs/fsdrv/lv_fs_memfs.o ./lvgl/src/libs/fsdrv/lv_fs_memfs.su ./lvgl/src/libs/fsdrv/lv_fs_posix.cyclo ./lvgl/src/libs/fsdrv/lv_fs_posix.d ./lvgl/src/libs/fsdrv/lv_fs_posix.o ./lvgl/src/libs/fsdrv/lv_fs_posix.su ./lvgl/src/libs/fsdrv/lv_fs_stdio.cyclo ./lvgl/src/libs/fsdrv/lv_fs_stdio.d ./lvgl/src/libs/fsdrv/lv_fs_stdio.o ./lvgl/src/libs/fsdrv/lv_fs_stdio.su ./lvgl/src/libs/fsdrv/lv_fs_uefi.cyclo ./lvgl/src/libs/fsdrv/lv_fs_uefi.d ./lvgl/src/libs/fsdrv/lv_fs_uefi.o ./lvgl/src/libs/fsdrv/lv_fs_uefi.su ./lvgl/src/libs/fsdrv/lv_fs_win32.cyclo ./lvgl/src/libs/fsdrv/lv_fs_win32.d ./lvgl/src/libs/fsdrv/lv_fs_win32.o ./lvgl/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-fsdrv

