################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/libs/expat/xmlparse.c \
../lvgl/src/libs/expat/xmlrole.c \
../lvgl/src/libs/expat/xmltok.c \
../lvgl/src/libs/expat/xmltok_impl.c \
../lvgl/src/libs/expat/xmltok_ns.c 

C_DEPS += \
./lvgl/src/libs/expat/xmlparse.d \
./lvgl/src/libs/expat/xmlrole.d \
./lvgl/src/libs/expat/xmltok.d \
./lvgl/src/libs/expat/xmltok_impl.d \
./lvgl/src/libs/expat/xmltok_ns.d 

OBJS += \
./lvgl/src/libs/expat/xmlparse.o \
./lvgl/src/libs/expat/xmlrole.o \
./lvgl/src/libs/expat/xmltok.o \
./lvgl/src/libs/expat/xmltok_impl.o \
./lvgl/src/libs/expat/xmltok_ns.o 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/expat/%.o lvgl/src/libs/expat/%.su lvgl/src/libs/expat/%.cyclo: ../lvgl/src/libs/expat/%.c lvgl/src/libs/expat/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl/examples" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -Ofast -ffunction-sections -fdata-sections -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-expat

clean-lvgl-2f-src-2f-libs-2f-expat:
	-$(RM) ./lvgl/src/libs/expat/xmlparse.cyclo ./lvgl/src/libs/expat/xmlparse.d ./lvgl/src/libs/expat/xmlparse.o ./lvgl/src/libs/expat/xmlparse.su ./lvgl/src/libs/expat/xmlrole.cyclo ./lvgl/src/libs/expat/xmlrole.d ./lvgl/src/libs/expat/xmlrole.o ./lvgl/src/libs/expat/xmlrole.su ./lvgl/src/libs/expat/xmltok.cyclo ./lvgl/src/libs/expat/xmltok.d ./lvgl/src/libs/expat/xmltok.o ./lvgl/src/libs/expat/xmltok.su ./lvgl/src/libs/expat/xmltok_impl.cyclo ./lvgl/src/libs/expat/xmltok_impl.d ./lvgl/src/libs/expat/xmltok_impl.o ./lvgl/src/libs/expat/xmltok_impl.su ./lvgl/src/libs/expat/xmltok_ns.cyclo ./lvgl/src/libs/expat/xmltok_ns.d ./lvgl/src/libs/expat/xmltok_ns.o ./lvgl/src/libs/expat/xmltok_ns.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-expat

