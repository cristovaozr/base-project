# Defines STM32CubeF4 sources and dependencies

STM32CUBEF4_INCLUDEDIR += -ISTM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Inc \
	-ISTM32CubeF4/Drivers/CMSIS/Include \
	-ISTM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Include 

STM32CUBEF4_ASM += STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s

STM32CUBEF4_SRC += STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_adc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_crc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_dac.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_dma.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_dma2d.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_exti.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fmc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fsmc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_gpio.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_i2c.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_lptim.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_pwr.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_rcc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_rng.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_rtc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_sdmmc.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_spi.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_tim.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usart.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c \
	STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_utils.c