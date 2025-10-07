################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/libs/freetype/lv_freetype.c \
../lvgl/src/libs/freetype/lv_freetype_glyph.c \
../lvgl/src/libs/freetype/lv_freetype_image.c \
../lvgl/src/libs/freetype/lv_freetype_outline.c \
../lvgl/src/libs/freetype/lv_ftsystem.c 

C_DEPS += \
./lvgl/src/libs/freetype/lv_freetype.d \
./lvgl/src/libs/freetype/lv_freetype_glyph.d \
./lvgl/src/libs/freetype/lv_freetype_image.d \
./lvgl/src/libs/freetype/lv_freetype_outline.d \
./lvgl/src/libs/freetype/lv_ftsystem.d 

OBJS += \
./lvgl/src/libs/freetype/lv_freetype.o \
./lvgl/src/libs/freetype/lv_freetype_glyph.o \
./lvgl/src/libs/freetype/lv_freetype_image.o \
./lvgl/src/libs/freetype/lv_freetype_outline.o \
./lvgl/src/libs/freetype/lv_ftsystem.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/freetype/%.o lvgl/src/libs/freetype/%.su lvgl/src/libs/freetype/%.cyclo: ../lvgl/src/libs/freetype/%.c lvgl/src/libs/freetype/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-freetype

clean-lvgl-2f-src-2f-libs-2f-freetype:
	-$(RM) ./lvgl/src/libs/freetype/lv_freetype.cyclo ./lvgl/src/libs/freetype/lv_freetype.d ./lvgl/src/libs/freetype/lv_freetype.o ./lvgl/src/libs/freetype/lv_freetype.su ./lvgl/src/libs/freetype/lv_freetype_glyph.cyclo ./lvgl/src/libs/freetype/lv_freetype_glyph.d ./lvgl/src/libs/freetype/lv_freetype_glyph.o ./lvgl/src/libs/freetype/lv_freetype_glyph.su ./lvgl/src/libs/freetype/lv_freetype_image.cyclo ./lvgl/src/libs/freetype/lv_freetype_image.d ./lvgl/src/libs/freetype/lv_freetype_image.o ./lvgl/src/libs/freetype/lv_freetype_image.su ./lvgl/src/libs/freetype/lv_freetype_outline.cyclo ./lvgl/src/libs/freetype/lv_freetype_outline.d ./lvgl/src/libs/freetype/lv_freetype_outline.o ./lvgl/src/libs/freetype/lv_freetype_outline.su ./lvgl/src/libs/freetype/lv_ftsystem.cyclo ./lvgl/src/libs/freetype/lv_ftsystem.d ./lvgl/src/libs/freetype/lv_ftsystem.o ./lvgl/src/libs/freetype/lv_ftsystem.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-freetype

