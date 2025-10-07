################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/widgets/scale/lv_example_scale_1.c \
../lvgl/examples/widgets/scale/lv_example_scale_10.c \
../lvgl/examples/widgets/scale/lv_example_scale_11.c \
../lvgl/examples/widgets/scale/lv_example_scale_12.c \
../lvgl/examples/widgets/scale/lv_example_scale_2.c \
../lvgl/examples/widgets/scale/lv_example_scale_3.c \
../lvgl/examples/widgets/scale/lv_example_scale_4.c \
../lvgl/examples/widgets/scale/lv_example_scale_5.c \
../lvgl/examples/widgets/scale/lv_example_scale_6.c \
../lvgl/examples/widgets/scale/lv_example_scale_7.c \
../lvgl/examples/widgets/scale/lv_example_scale_8.c \
../lvgl/examples/widgets/scale/lv_example_scale_9.c 

C_DEPS += \
./lvgl/examples/widgets/scale/lv_example_scale_1.d \
./lvgl/examples/widgets/scale/lv_example_scale_10.d \
./lvgl/examples/widgets/scale/lv_example_scale_11.d \
./lvgl/examples/widgets/scale/lv_example_scale_12.d \
./lvgl/examples/widgets/scale/lv_example_scale_2.d \
./lvgl/examples/widgets/scale/lv_example_scale_3.d \
./lvgl/examples/widgets/scale/lv_example_scale_4.d \
./lvgl/examples/widgets/scale/lv_example_scale_5.d \
./lvgl/examples/widgets/scale/lv_example_scale_6.d \
./lvgl/examples/widgets/scale/lv_example_scale_7.d \
./lvgl/examples/widgets/scale/lv_example_scale_8.d \
./lvgl/examples/widgets/scale/lv_example_scale_9.d 

OBJS += \
./lvgl/examples/widgets/scale/lv_example_scale_1.o \
./lvgl/examples/widgets/scale/lv_example_scale_10.o \
./lvgl/examples/widgets/scale/lv_example_scale_11.o \
./lvgl/examples/widgets/scale/lv_example_scale_12.o \
./lvgl/examples/widgets/scale/lv_example_scale_2.o \
./lvgl/examples/widgets/scale/lv_example_scale_3.o \
./lvgl/examples/widgets/scale/lv_example_scale_4.o \
./lvgl/examples/widgets/scale/lv_example_scale_5.o \
./lvgl/examples/widgets/scale/lv_example_scale_6.o \
./lvgl/examples/widgets/scale/lv_example_scale_7.o \
./lvgl/examples/widgets/scale/lv_example_scale_8.o \
./lvgl/examples/widgets/scale/lv_example_scale_9.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/widgets/scale/%.o lvgl/examples/widgets/scale/%.su lvgl/examples/widgets/scale/%.cyclo: ../lvgl/examples/widgets/scale/%.c lvgl/examples/widgets/scale/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -O0 -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-widgets-2f-scale

clean-lvgl-2f-examples-2f-widgets-2f-scale:
	-$(RM) ./lvgl/examples/widgets/scale/lv_example_scale_1.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_1.d ./lvgl/examples/widgets/scale/lv_example_scale_1.o ./lvgl/examples/widgets/scale/lv_example_scale_1.su ./lvgl/examples/widgets/scale/lv_example_scale_10.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_10.d ./lvgl/examples/widgets/scale/lv_example_scale_10.o ./lvgl/examples/widgets/scale/lv_example_scale_10.su ./lvgl/examples/widgets/scale/lv_example_scale_11.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_11.d ./lvgl/examples/widgets/scale/lv_example_scale_11.o ./lvgl/examples/widgets/scale/lv_example_scale_11.su ./lvgl/examples/widgets/scale/lv_example_scale_12.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_12.d ./lvgl/examples/widgets/scale/lv_example_scale_12.o ./lvgl/examples/widgets/scale/lv_example_scale_12.su ./lvgl/examples/widgets/scale/lv_example_scale_2.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_2.d ./lvgl/examples/widgets/scale/lv_example_scale_2.o ./lvgl/examples/widgets/scale/lv_example_scale_2.su ./lvgl/examples/widgets/scale/lv_example_scale_3.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_3.d ./lvgl/examples/widgets/scale/lv_example_scale_3.o ./lvgl/examples/widgets/scale/lv_example_scale_3.su ./lvgl/examples/widgets/scale/lv_example_scale_4.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_4.d ./lvgl/examples/widgets/scale/lv_example_scale_4.o ./lvgl/examples/widgets/scale/lv_example_scale_4.su ./lvgl/examples/widgets/scale/lv_example_scale_5.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_5.d ./lvgl/examples/widgets/scale/lv_example_scale_5.o ./lvgl/examples/widgets/scale/lv_example_scale_5.su ./lvgl/examples/widgets/scale/lv_example_scale_6.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_6.d ./lvgl/examples/widgets/scale/lv_example_scale_6.o ./lvgl/examples/widgets/scale/lv_example_scale_6.su ./lvgl/examples/widgets/scale/lv_example_scale_7.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_7.d ./lvgl/examples/widgets/scale/lv_example_scale_7.o ./lvgl/examples/widgets/scale/lv_example_scale_7.su ./lvgl/examples/widgets/scale/lv_example_scale_8.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_8.d ./lvgl/examples/widgets/scale/lv_example_scale_8.o ./lvgl/examples/widgets/scale/lv_example_scale_8.su ./lvgl/examples/widgets/scale/lv_example_scale_9.cyclo ./lvgl/examples/widgets/scale/lv_example_scale_9.d ./lvgl/examples/widgets/scale/lv_example_scale_9.o ./lvgl/examples/widgets/scale/lv_example_scale_9.su

.PHONY: clean-lvgl-2f-examples-2f-widgets-2f-scale

