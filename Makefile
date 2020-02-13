# base-project Makefile
# Author: Cristóvão Zuppardo Rufino <cristovaozr@gmail.com>

CC := arm-none-eabi-gcc
LD := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
OBJSIZE := arm-none-eabi-objsize
AS := arm-none-eabi-as
AR := arm-none-eabi-ar

FREERTOS_INCLUDEDIR += -IFreeRTOS/include -IFreeRTOS/portable/GCC/ARM_CM4F

STM32CUBEF4_INCLUDEDIR += -ISTM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Inc \
	-ISTM32CubeF4/Drivers/CMSIS/Include \
	-ISTM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Include

INCLUDEDIR += $(FREERTOS_INCLUDEDIR) $(STM32CUBEF4_INCLUDEDIR) \
	-Iinc

CFLAGS += -DSTM32F407xx -DUSE_FULL_LL_DRIVER -DHSE_VALUE=8000000 \
	-mthumb -mcpu=cortex-m4 -mfloat-abi=softfp \
	-ffunction-sections -fdata-sections \
	-Wall -Wextra -ggdb -Os $(INCLUDEDIR)

ASFLAGS += -mcpu=cortex-m4 -mthumb -mfloat-abi=softfp

LDFLAGS += -Wl,--gc-sections -Wl,-entry=Reset_Handler \
	-T STM32F407ZETx_FLASH.ld -mthumb -mcpu=cortex-m4 -mfloat-abi=softfp

ARFLAGS +=

FREERTOS_SRC += FreeRTOS/croutine.c FreeRTOS/event_groups.c FreeRTOS/list.c \
	FreeRTOS/queue.c FreeRTOS/stream_buffer.c FreeRTOS/tasks.c \
	FreeRTOS/timers.c FreeRTOS/portable/GCC/ARM_CM4F/port.c

STM32CUBEF4_SRC +=

FREERTOS_OBJ := $(FREERTOS_SRC:.c=.o)
STM32CUBEF4_OBJ := $(STM32CUBEF4_OBJ:.c=.o)

freertos: $(FREERTOS_OBJ)
	$(AR) $(ARFLAGS) freertos.a $(FREERTOS_OBJ)

clean:
	$(RM) $(FREERTOS_OBJ) $(STM32CUBEF4_OBJ)
	$(RM) freertos.a

# STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s