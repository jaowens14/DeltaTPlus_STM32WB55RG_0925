################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lvgl/src/libs/thorvg/tvgAccessor.cpp \
../lvgl/src/libs/thorvg/tvgAnimation.cpp \
../lvgl/src/libs/thorvg/tvgCanvas.cpp \
../lvgl/src/libs/thorvg/tvgCapi.cpp \
../lvgl/src/libs/thorvg/tvgCompressor.cpp \
../lvgl/src/libs/thorvg/tvgFill.cpp \
../lvgl/src/libs/thorvg/tvgGlCanvas.cpp \
../lvgl/src/libs/thorvg/tvgInitializer.cpp \
../lvgl/src/libs/thorvg/tvgLoader.cpp \
../lvgl/src/libs/thorvg/tvgLottieAnimation.cpp \
../lvgl/src/libs/thorvg/tvgLottieBuilder.cpp \
../lvgl/src/libs/thorvg/tvgLottieExpressions.cpp \
../lvgl/src/libs/thorvg/tvgLottieInterpolator.cpp \
../lvgl/src/libs/thorvg/tvgLottieLoader.cpp \
../lvgl/src/libs/thorvg/tvgLottieModel.cpp \
../lvgl/src/libs/thorvg/tvgLottieModifier.cpp \
../lvgl/src/libs/thorvg/tvgLottieParser.cpp \
../lvgl/src/libs/thorvg/tvgLottieParserHandler.cpp \
../lvgl/src/libs/thorvg/tvgMath.cpp \
../lvgl/src/libs/thorvg/tvgPaint.cpp \
../lvgl/src/libs/thorvg/tvgPicture.cpp \
../lvgl/src/libs/thorvg/tvgRawLoader.cpp \
../lvgl/src/libs/thorvg/tvgRender.cpp \
../lvgl/src/libs/thorvg/tvgSaver.cpp \
../lvgl/src/libs/thorvg/tvgScene.cpp \
../lvgl/src/libs/thorvg/tvgShape.cpp \
../lvgl/src/libs/thorvg/tvgStr.cpp \
../lvgl/src/libs/thorvg/tvgSvgCssStyle.cpp \
../lvgl/src/libs/thorvg/tvgSvgLoader.cpp \
../lvgl/src/libs/thorvg/tvgSvgPath.cpp \
../lvgl/src/libs/thorvg/tvgSvgSceneBuilder.cpp \
../lvgl/src/libs/thorvg/tvgSvgUtil.cpp \
../lvgl/src/libs/thorvg/tvgSwCanvas.cpp \
../lvgl/src/libs/thorvg/tvgSwFill.cpp \
../lvgl/src/libs/thorvg/tvgSwImage.cpp \
../lvgl/src/libs/thorvg/tvgSwMath.cpp \
../lvgl/src/libs/thorvg/tvgSwMemPool.cpp \
../lvgl/src/libs/thorvg/tvgSwPostEffect.cpp \
../lvgl/src/libs/thorvg/tvgSwRaster.cpp \
../lvgl/src/libs/thorvg/tvgSwRenderer.cpp \
../lvgl/src/libs/thorvg/tvgSwRle.cpp \
../lvgl/src/libs/thorvg/tvgSwShape.cpp \
../lvgl/src/libs/thorvg/tvgSwStroke.cpp \
../lvgl/src/libs/thorvg/tvgTaskScheduler.cpp \
../lvgl/src/libs/thorvg/tvgText.cpp \
../lvgl/src/libs/thorvg/tvgWgCanvas.cpp \
../lvgl/src/libs/thorvg/tvgXmlParser.cpp 

OBJS += \
./lvgl/src/libs/thorvg/tvgAccessor.o \
./lvgl/src/libs/thorvg/tvgAnimation.o \
./lvgl/src/libs/thorvg/tvgCanvas.o \
./lvgl/src/libs/thorvg/tvgCapi.o \
./lvgl/src/libs/thorvg/tvgCompressor.o \
./lvgl/src/libs/thorvg/tvgFill.o \
./lvgl/src/libs/thorvg/tvgGlCanvas.o \
./lvgl/src/libs/thorvg/tvgInitializer.o \
./lvgl/src/libs/thorvg/tvgLoader.o \
./lvgl/src/libs/thorvg/tvgLottieAnimation.o \
./lvgl/src/libs/thorvg/tvgLottieBuilder.o \
./lvgl/src/libs/thorvg/tvgLottieExpressions.o \
./lvgl/src/libs/thorvg/tvgLottieInterpolator.o \
./lvgl/src/libs/thorvg/tvgLottieLoader.o \
./lvgl/src/libs/thorvg/tvgLottieModel.o \
./lvgl/src/libs/thorvg/tvgLottieModifier.o \
./lvgl/src/libs/thorvg/tvgLottieParser.o \
./lvgl/src/libs/thorvg/tvgLottieParserHandler.o \
./lvgl/src/libs/thorvg/tvgMath.o \
./lvgl/src/libs/thorvg/tvgPaint.o \
./lvgl/src/libs/thorvg/tvgPicture.o \
./lvgl/src/libs/thorvg/tvgRawLoader.o \
./lvgl/src/libs/thorvg/tvgRender.o \
./lvgl/src/libs/thorvg/tvgSaver.o \
./lvgl/src/libs/thorvg/tvgScene.o \
./lvgl/src/libs/thorvg/tvgShape.o \
./lvgl/src/libs/thorvg/tvgStr.o \
./lvgl/src/libs/thorvg/tvgSvgCssStyle.o \
./lvgl/src/libs/thorvg/tvgSvgLoader.o \
./lvgl/src/libs/thorvg/tvgSvgPath.o \
./lvgl/src/libs/thorvg/tvgSvgSceneBuilder.o \
./lvgl/src/libs/thorvg/tvgSvgUtil.o \
./lvgl/src/libs/thorvg/tvgSwCanvas.o \
./lvgl/src/libs/thorvg/tvgSwFill.o \
./lvgl/src/libs/thorvg/tvgSwImage.o \
./lvgl/src/libs/thorvg/tvgSwMath.o \
./lvgl/src/libs/thorvg/tvgSwMemPool.o \
./lvgl/src/libs/thorvg/tvgSwPostEffect.o \
./lvgl/src/libs/thorvg/tvgSwRaster.o \
./lvgl/src/libs/thorvg/tvgSwRenderer.o \
./lvgl/src/libs/thorvg/tvgSwRle.o \
./lvgl/src/libs/thorvg/tvgSwShape.o \
./lvgl/src/libs/thorvg/tvgSwStroke.o \
./lvgl/src/libs/thorvg/tvgTaskScheduler.o \
./lvgl/src/libs/thorvg/tvgText.o \
./lvgl/src/libs/thorvg/tvgWgCanvas.o \
./lvgl/src/libs/thorvg/tvgXmlParser.o 

CPP_DEPS += \
./lvgl/src/libs/thorvg/tvgAccessor.d \
./lvgl/src/libs/thorvg/tvgAnimation.d \
./lvgl/src/libs/thorvg/tvgCanvas.d \
./lvgl/src/libs/thorvg/tvgCapi.d \
./lvgl/src/libs/thorvg/tvgCompressor.d \
./lvgl/src/libs/thorvg/tvgFill.d \
./lvgl/src/libs/thorvg/tvgGlCanvas.d \
./lvgl/src/libs/thorvg/tvgInitializer.d \
./lvgl/src/libs/thorvg/tvgLoader.d \
./lvgl/src/libs/thorvg/tvgLottieAnimation.d \
./lvgl/src/libs/thorvg/tvgLottieBuilder.d \
./lvgl/src/libs/thorvg/tvgLottieExpressions.d \
./lvgl/src/libs/thorvg/tvgLottieInterpolator.d \
./lvgl/src/libs/thorvg/tvgLottieLoader.d \
./lvgl/src/libs/thorvg/tvgLottieModel.d \
./lvgl/src/libs/thorvg/tvgLottieModifier.d \
./lvgl/src/libs/thorvg/tvgLottieParser.d \
./lvgl/src/libs/thorvg/tvgLottieParserHandler.d \
./lvgl/src/libs/thorvg/tvgMath.d \
./lvgl/src/libs/thorvg/tvgPaint.d \
./lvgl/src/libs/thorvg/tvgPicture.d \
./lvgl/src/libs/thorvg/tvgRawLoader.d \
./lvgl/src/libs/thorvg/tvgRender.d \
./lvgl/src/libs/thorvg/tvgSaver.d \
./lvgl/src/libs/thorvg/tvgScene.d \
./lvgl/src/libs/thorvg/tvgShape.d \
./lvgl/src/libs/thorvg/tvgStr.d \
./lvgl/src/libs/thorvg/tvgSvgCssStyle.d \
./lvgl/src/libs/thorvg/tvgSvgLoader.d \
./lvgl/src/libs/thorvg/tvgSvgPath.d \
./lvgl/src/libs/thorvg/tvgSvgSceneBuilder.d \
./lvgl/src/libs/thorvg/tvgSvgUtil.d \
./lvgl/src/libs/thorvg/tvgSwCanvas.d \
./lvgl/src/libs/thorvg/tvgSwFill.d \
./lvgl/src/libs/thorvg/tvgSwImage.d \
./lvgl/src/libs/thorvg/tvgSwMath.d \
./lvgl/src/libs/thorvg/tvgSwMemPool.d \
./lvgl/src/libs/thorvg/tvgSwPostEffect.d \
./lvgl/src/libs/thorvg/tvgSwRaster.d \
./lvgl/src/libs/thorvg/tvgSwRenderer.d \
./lvgl/src/libs/thorvg/tvgSwRle.d \
./lvgl/src/libs/thorvg/tvgSwShape.d \
./lvgl/src/libs/thorvg/tvgSwStroke.d \
./lvgl/src/libs/thorvg/tvgTaskScheduler.d \
./lvgl/src/libs/thorvg/tvgText.d \
./lvgl/src/libs/thorvg/tvgWgCanvas.d \
./lvgl/src/libs/thorvg/tvgXmlParser.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/thorvg/%.o lvgl/src/libs/thorvg/%.su lvgl/src/libs/thorvg/%.cyclo: ../lvgl/src/libs/thorvg/%.cpp lvgl/src/libs/thorvg/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32WB55xx -c -I../Core/Inc -I../STM32_WPAN/App -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32WBxx_HAL_Driver/Inc -I../Drivers/STM32WBxx_HAL_Driver/Inc/Legacy -I../Utilities/lpm/tiny_lpm -I../Middlewares/ST/STM32_WPAN -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../Middlewares/ST/STM32_WPAN/utilities -I../Middlewares/ST/STM32_WPAN/ble/core -I../Middlewares/ST/STM32_WPAN/ble/core/auto -I../Middlewares/ST/STM32_WPAN/ble/core/template -I../Middlewares/ST/STM32_WPAN/ble/svc/Inc -I../Middlewares/ST/STM32_WPAN/ble/svc/Src -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../Utilities/sequencer -I../Middlewares/ST/STM32_WPAN/ble -I../Drivers/CMSIS/Include -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/Adafruit_1704X_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/lvgl" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/AD7124_Library" -I"C:/Users/jaowe/Documents/Projects/DeltaTPlus_STM32WB55RG_Workspace/DeltaTPlus_STM32WB55RG_090525/FT5436" -I../Middlewares/ST/STM32_USB_Device_Library/Class/DFU/Inc -Ofast -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -pedantic -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-thorvg

clean-lvgl-2f-src-2f-libs-2f-thorvg:
	-$(RM) ./lvgl/src/libs/thorvg/tvgAccessor.cyclo ./lvgl/src/libs/thorvg/tvgAccessor.d ./lvgl/src/libs/thorvg/tvgAccessor.o ./lvgl/src/libs/thorvg/tvgAccessor.su ./lvgl/src/libs/thorvg/tvgAnimation.cyclo ./lvgl/src/libs/thorvg/tvgAnimation.d ./lvgl/src/libs/thorvg/tvgAnimation.o ./lvgl/src/libs/thorvg/tvgAnimation.su ./lvgl/src/libs/thorvg/tvgCanvas.cyclo ./lvgl/src/libs/thorvg/tvgCanvas.d ./lvgl/src/libs/thorvg/tvgCanvas.o ./lvgl/src/libs/thorvg/tvgCanvas.su ./lvgl/src/libs/thorvg/tvgCapi.cyclo ./lvgl/src/libs/thorvg/tvgCapi.d ./lvgl/src/libs/thorvg/tvgCapi.o ./lvgl/src/libs/thorvg/tvgCapi.su ./lvgl/src/libs/thorvg/tvgCompressor.cyclo ./lvgl/src/libs/thorvg/tvgCompressor.d ./lvgl/src/libs/thorvg/tvgCompressor.o ./lvgl/src/libs/thorvg/tvgCompressor.su ./lvgl/src/libs/thorvg/tvgFill.cyclo ./lvgl/src/libs/thorvg/tvgFill.d ./lvgl/src/libs/thorvg/tvgFill.o ./lvgl/src/libs/thorvg/tvgFill.su ./lvgl/src/libs/thorvg/tvgGlCanvas.cyclo ./lvgl/src/libs/thorvg/tvgGlCanvas.d ./lvgl/src/libs/thorvg/tvgGlCanvas.o ./lvgl/src/libs/thorvg/tvgGlCanvas.su ./lvgl/src/libs/thorvg/tvgInitializer.cyclo ./lvgl/src/libs/thorvg/tvgInitializer.d ./lvgl/src/libs/thorvg/tvgInitializer.o ./lvgl/src/libs/thorvg/tvgInitializer.su ./lvgl/src/libs/thorvg/tvgLoader.cyclo ./lvgl/src/libs/thorvg/tvgLoader.d ./lvgl/src/libs/thorvg/tvgLoader.o ./lvgl/src/libs/thorvg/tvgLoader.su ./lvgl/src/libs/thorvg/tvgLottieAnimation.cyclo ./lvgl/src/libs/thorvg/tvgLottieAnimation.d ./lvgl/src/libs/thorvg/tvgLottieAnimation.o ./lvgl/src/libs/thorvg/tvgLottieAnimation.su ./lvgl/src/libs/thorvg/tvgLottieBuilder.cyclo ./lvgl/src/libs/thorvg/tvgLottieBuilder.d ./lvgl/src/libs/thorvg/tvgLottieBuilder.o ./lvgl/src/libs/thorvg/tvgLottieBuilder.su ./lvgl/src/libs/thorvg/tvgLottieExpressions.cyclo ./lvgl/src/libs/thorvg/tvgLottieExpressions.d ./lvgl/src/libs/thorvg/tvgLottieExpressions.o ./lvgl/src/libs/thorvg/tvgLottieExpressions.su ./lvgl/src/libs/thorvg/tvgLottieInterpolator.cyclo ./lvgl/src/libs/thorvg/tvgLottieInterpolator.d ./lvgl/src/libs/thorvg/tvgLottieInterpolator.o ./lvgl/src/libs/thorvg/tvgLottieInterpolator.su ./lvgl/src/libs/thorvg/tvgLottieLoader.cyclo ./lvgl/src/libs/thorvg/tvgLottieLoader.d ./lvgl/src/libs/thorvg/tvgLottieLoader.o ./lvgl/src/libs/thorvg/tvgLottieLoader.su ./lvgl/src/libs/thorvg/tvgLottieModel.cyclo ./lvgl/src/libs/thorvg/tvgLottieModel.d ./lvgl/src/libs/thorvg/tvgLottieModel.o ./lvgl/src/libs/thorvg/tvgLottieModel.su ./lvgl/src/libs/thorvg/tvgLottieModifier.cyclo ./lvgl/src/libs/thorvg/tvgLottieModifier.d ./lvgl/src/libs/thorvg/tvgLottieModifier.o ./lvgl/src/libs/thorvg/tvgLottieModifier.su ./lvgl/src/libs/thorvg/tvgLottieParser.cyclo ./lvgl/src/libs/thorvg/tvgLottieParser.d ./lvgl/src/libs/thorvg/tvgLottieParser.o ./lvgl/src/libs/thorvg/tvgLottieParser.su ./lvgl/src/libs/thorvg/tvgLottieParserHandler.cyclo ./lvgl/src/libs/thorvg/tvgLottieParserHandler.d ./lvgl/src/libs/thorvg/tvgLottieParserHandler.o ./lvgl/src/libs/thorvg/tvgLottieParserHandler.su ./lvgl/src/libs/thorvg/tvgMath.cyclo ./lvgl/src/libs/thorvg/tvgMath.d ./lvgl/src/libs/thorvg/tvgMath.o ./lvgl/src/libs/thorvg/tvgMath.su ./lvgl/src/libs/thorvg/tvgPaint.cyclo ./lvgl/src/libs/thorvg/tvgPaint.d ./lvgl/src/libs/thorvg/tvgPaint.o ./lvgl/src/libs/thorvg/tvgPaint.su ./lvgl/src/libs/thorvg/tvgPicture.cyclo ./lvgl/src/libs/thorvg/tvgPicture.d ./lvgl/src/libs/thorvg/tvgPicture.o ./lvgl/src/libs/thorvg/tvgPicture.su ./lvgl/src/libs/thorvg/tvgRawLoader.cyclo ./lvgl/src/libs/thorvg/tvgRawLoader.d ./lvgl/src/libs/thorvg/tvgRawLoader.o ./lvgl/src/libs/thorvg/tvgRawLoader.su ./lvgl/src/libs/thorvg/tvgRender.cyclo ./lvgl/src/libs/thorvg/tvgRender.d ./lvgl/src/libs/thorvg/tvgRender.o ./lvgl/src/libs/thorvg/tvgRender.su ./lvgl/src/libs/thorvg/tvgSaver.cyclo ./lvgl/src/libs/thorvg/tvgSaver.d ./lvgl/src/libs/thorvg/tvgSaver.o ./lvgl/src/libs/thorvg/tvgSaver.su ./lvgl/src/libs/thorvg/tvgScene.cyclo ./lvgl/src/libs/thorvg/tvgScene.d ./lvgl/src/libs/thorvg/tvgScene.o ./lvgl/src/libs/thorvg/tvgScene.su ./lvgl/src/libs/thorvg/tvgShape.cyclo ./lvgl/src/libs/thorvg/tvgShape.d ./lvgl/src/libs/thorvg/tvgShape.o ./lvgl/src/libs/thorvg/tvgShape.su ./lvgl/src/libs/thorvg/tvgStr.cyclo ./lvgl/src/libs/thorvg/tvgStr.d ./lvgl/src/libs/thorvg/tvgStr.o ./lvgl/src/libs/thorvg/tvgStr.su ./lvgl/src/libs/thorvg/tvgSvgCssStyle.cyclo ./lvgl/src/libs/thorvg/tvgSvgCssStyle.d ./lvgl/src/libs/thorvg/tvgSvgCssStyle.o ./lvgl/src/libs/thorvg/tvgSvgCssStyle.su ./lvgl/src/libs/thorvg/tvgSvgLoader.cyclo ./lvgl/src/libs/thorvg/tvgSvgLoader.d ./lvgl/src/libs/thorvg/tvgSvgLoader.o ./lvgl/src/libs/thorvg/tvgSvgLoader.su ./lvgl/src/libs/thorvg/tvgSvgPath.cyclo ./lvgl/src/libs/thorvg/tvgSvgPath.d ./lvgl/src/libs/thorvg/tvgSvgPath.o ./lvgl/src/libs/thorvg/tvgSvgPath.su ./lvgl/src/libs/thorvg/tvgSvgSceneBuilder.cyclo ./lvgl/src/libs/thorvg/tvgSvgSceneBuilder.d ./lvgl/src/libs/thorvg/tvgSvgSceneBuilder.o ./lvgl/src/libs/thorvg/tvgSvgSceneBuilder.su ./lvgl/src/libs/thorvg/tvgSvgUtil.cyclo ./lvgl/src/libs/thorvg/tvgSvgUtil.d ./lvgl/src/libs/thorvg/tvgSvgUtil.o ./lvgl/src/libs/thorvg/tvgSvgUtil.su ./lvgl/src/libs/thorvg/tvgSwCanvas.cyclo ./lvgl/src/libs/thorvg/tvgSwCanvas.d ./lvgl/src/libs/thorvg/tvgSwCanvas.o ./lvgl/src/libs/thorvg/tvgSwCanvas.su ./lvgl/src/libs/thorvg/tvgSwFill.cyclo ./lvgl/src/libs/thorvg/tvgSwFill.d ./lvgl/src/libs/thorvg/tvgSwFill.o ./lvgl/src/libs/thorvg/tvgSwFill.su ./lvgl/src/libs/thorvg/tvgSwImage.cyclo ./lvgl/src/libs/thorvg/tvgSwImage.d ./lvgl/src/libs/thorvg/tvgSwImage.o ./lvgl/src/libs/thorvg/tvgSwImage.su ./lvgl/src/libs/thorvg/tvgSwMath.cyclo ./lvgl/src/libs/thorvg/tvgSwMath.d ./lvgl/src/libs/thorvg/tvgSwMath.o ./lvgl/src/libs/thorvg/tvgSwMath.su ./lvgl/src/libs/thorvg/tvgSwMemPool.cyclo ./lvgl/src/libs/thorvg/tvgSwMemPool.d ./lvgl/src/libs/thorvg/tvgSwMemPool.o ./lvgl/src/libs/thorvg/tvgSwMemPool.su ./lvgl/src/libs/thorvg/tvgSwPostEffect.cyclo ./lvgl/src/libs/thorvg/tvgSwPostEffect.d ./lvgl/src/libs/thorvg/tvgSwPostEffect.o ./lvgl/src/libs/thorvg/tvgSwPostEffect.su
	-$(RM) ./lvgl/src/libs/thorvg/tvgSwRaster.cyclo ./lvgl/src/libs/thorvg/tvgSwRaster.d ./lvgl/src/libs/thorvg/tvgSwRaster.o ./lvgl/src/libs/thorvg/tvgSwRaster.su ./lvgl/src/libs/thorvg/tvgSwRenderer.cyclo ./lvgl/src/libs/thorvg/tvgSwRenderer.d ./lvgl/src/libs/thorvg/tvgSwRenderer.o ./lvgl/src/libs/thorvg/tvgSwRenderer.su ./lvgl/src/libs/thorvg/tvgSwRle.cyclo ./lvgl/src/libs/thorvg/tvgSwRle.d ./lvgl/src/libs/thorvg/tvgSwRle.o ./lvgl/src/libs/thorvg/tvgSwRle.su ./lvgl/src/libs/thorvg/tvgSwShape.cyclo ./lvgl/src/libs/thorvg/tvgSwShape.d ./lvgl/src/libs/thorvg/tvgSwShape.o ./lvgl/src/libs/thorvg/tvgSwShape.su ./lvgl/src/libs/thorvg/tvgSwStroke.cyclo ./lvgl/src/libs/thorvg/tvgSwStroke.d ./lvgl/src/libs/thorvg/tvgSwStroke.o ./lvgl/src/libs/thorvg/tvgSwStroke.su ./lvgl/src/libs/thorvg/tvgTaskScheduler.cyclo ./lvgl/src/libs/thorvg/tvgTaskScheduler.d ./lvgl/src/libs/thorvg/tvgTaskScheduler.o ./lvgl/src/libs/thorvg/tvgTaskScheduler.su ./lvgl/src/libs/thorvg/tvgText.cyclo ./lvgl/src/libs/thorvg/tvgText.d ./lvgl/src/libs/thorvg/tvgText.o ./lvgl/src/libs/thorvg/tvgText.su ./lvgl/src/libs/thorvg/tvgWgCanvas.cyclo ./lvgl/src/libs/thorvg/tvgWgCanvas.d ./lvgl/src/libs/thorvg/tvgWgCanvas.o ./lvgl/src/libs/thorvg/tvgWgCanvas.su ./lvgl/src/libs/thorvg/tvgXmlParser.cyclo ./lvgl/src/libs/thorvg/tvgXmlParser.d ./lvgl/src/libs/thorvg/tvgXmlParser.o ./lvgl/src/libs/thorvg/tvgXmlParser.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-thorvg

