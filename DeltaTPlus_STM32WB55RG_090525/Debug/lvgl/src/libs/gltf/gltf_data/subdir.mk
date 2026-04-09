################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.cpp \
../lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.cpp 

OBJS += \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.o \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.o 

CPP_DEPS += \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.d \
./lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/gltf/gltf_data/%.o lvgl/src/libs/gltf/gltf_data/%.su lvgl/src/libs/gltf/gltf_data/%.cyclo: ../lvgl/src/libs/gltf/gltf_data/%.cpp lvgl/src/libs/gltf/gltf_data/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/FT5436" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/NHB_AD7124-main/src" -Ofast -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_data

clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_data:
	-$(RM) ./lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_bind.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_animations.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_cache.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_injest.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_mesh.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_node.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_primitive.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_shader.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_skin.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_data_texture.su ./lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.cyclo ./lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.d ./lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.o ./lvgl/src/libs/gltf/gltf_data/lv_gltf_uniform_locations.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-gltf-2f-gltf_data

