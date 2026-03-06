################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/misc/cache/class/lv_cache_lru_ll.c \
../lvgl/src/misc/cache/class/lv_cache_lru_rb.c \
../lvgl/src/misc/cache/class/lv_cache_sc_da.c 

C_DEPS += \
./lvgl/src/misc/cache/class/lv_cache_lru_ll.d \
./lvgl/src/misc/cache/class/lv_cache_lru_rb.d \
./lvgl/src/misc/cache/class/lv_cache_sc_da.d 

OBJS += \
./lvgl/src/misc/cache/class/lv_cache_lru_ll.o \
./lvgl/src/misc/cache/class/lv_cache_lru_rb.o \
./lvgl/src/misc/cache/class/lv_cache_sc_da.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/misc/cache/class/%.o lvgl/src/misc/cache/class/%.su lvgl/src/misc/cache/class/%.cyclo: ../lvgl/src/misc/cache/class/%.c lvgl/src/misc/cache/class/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Ofast -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-misc-2f-cache-2f-class

clean-lvgl-2f-src-2f-misc-2f-cache-2f-class:
	-$(RM) ./lvgl/src/misc/cache/class/lv_cache_lru_ll.cyclo ./lvgl/src/misc/cache/class/lv_cache_lru_ll.d ./lvgl/src/misc/cache/class/lv_cache_lru_ll.o ./lvgl/src/misc/cache/class/lv_cache_lru_ll.su ./lvgl/src/misc/cache/class/lv_cache_lru_rb.cyclo ./lvgl/src/misc/cache/class/lv_cache_lru_rb.d ./lvgl/src/misc/cache/class/lv_cache_lru_rb.o ./lvgl/src/misc/cache/class/lv_cache_lru_rb.su ./lvgl/src/misc/cache/class/lv_cache_sc_da.cyclo ./lvgl/src/misc/cache/class/lv_cache_sc_da.d ./lvgl/src/misc/cache/class/lv_cache_sc_da.o ./lvgl/src/misc/cache/class/lv_cache_sc_da.su

.PHONY: clean-lvgl-2f-src-2f-misc-2f-cache-2f-class

