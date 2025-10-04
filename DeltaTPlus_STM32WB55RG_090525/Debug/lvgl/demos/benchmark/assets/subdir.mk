################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/demos/benchmark/assets/img_benchmark_avatar.c \
../lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.c \
../lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.c \
../lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.c 

C_DEPS += \
./lvgl/demos/benchmark/assets/img_benchmark_avatar.d \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d 

OBJS += \
./lvgl/demos/benchmark/assets/img_benchmark_avatar.o \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o \
./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o \
./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/demos/benchmark/assets/%.o lvgl/demos/benchmark/assets/%.su lvgl/demos/benchmark/assets/%.cyclo: ../lvgl/demos/benchmark/assets/%.c lvgl/demos/benchmark/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_MAX31856_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-demos-2f-benchmark-2f-assets

clean-lvgl-2f-demos-2f-benchmark-2f-assets:
	-$(RM) ./lvgl/demos/benchmark/assets/img_benchmark_avatar.cyclo ./lvgl/demos/benchmark/assets/img_benchmark_avatar.d ./lvgl/demos/benchmark/assets/img_benchmark_avatar.o ./lvgl/demos/benchmark/assets/img_benchmark_avatar.su ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.cyclo ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.su ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.cyclo ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o ./lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.su ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.cyclo ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o ./lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.su

.PHONY: clean-lvgl-2f-demos-2f-benchmark-2f-assets

