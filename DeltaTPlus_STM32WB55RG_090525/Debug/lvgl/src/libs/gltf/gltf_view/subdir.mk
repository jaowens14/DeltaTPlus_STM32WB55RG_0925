################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lvgl/src/libs/gltf/gltf_view/lv_gltf_view.cpp \
../lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.cpp \
../lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.cpp 

OBJS += \
./lvgl/src/libs/gltf/gltf_view/lv_gltf_view.o \
./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.o \
./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.o 

CPP_DEPS += \
./lvgl/src/libs/gltf/gltf_view/lv_gltf_view.d \
./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.d \
./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/gltf/gltf_view/%.o lvgl/src/libs/gltf/gltf_view/%.su lvgl/src/libs/gltf/gltf_view/%.cyclo: ../lvgl/src/libs/gltf/gltf_view/%.cpp lvgl/src/libs/gltf/gltf_view/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/FT5436" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view

clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view:
	-$(RM) ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view.cyclo ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view.d ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view.o ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view.su ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.cyclo ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.d ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.o ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_render.su ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.cyclo ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.d ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.o ./lvgl/src/libs/gltf/gltf_view/lv_gltf_view_shader.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_view

