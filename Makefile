# base-project Makefile
# Author: Cristóvão Zuppardo Rufino <cristovaozr@gmail.com>

CC := arm-none-eabi-gcc
LD := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
OBJSIZE := arm-none-eabi-objsize
AS := arm-none-eabi-as
AR := arm-none-eabi-ar

include FreeRTOS.mk
include STM32CubeF4.mk

INCLUDEDIR += -Iinc

CFLAGS += -DSTM32F407xx -DUSE_FULL_LL_DRIVER -DHSE_VALUE=8000000 \
	-mthumb -mcpu=cortex-m4 -mfloat-abi=softfp \
	-ffunction-sections -fdata-sections \
	-Wall -Wextra -ggdb -Os $(INCLUDEDIR)

ASFLAGS += -mcpu=cortex-m4 -mthumb -mfloat-abi=softfp

LDFLAGS += -Wl,--gc-sections -Wl,-entry=Reset_Handler \
	-T STM32F407ZETx_FLASH.ld -mthumb -mcpu=cortex-m4 -mfloat-abi=softfp

ARFLAGS +=

# Both symbols FREERTOS_INC and STM32CUBEF4_SRC are included in mk files
FREERTOS_OBJ += $(FREERTOS_SRC:.c=.o)
STM32CUBEF4_OBJ += $(STM32CUBEF4_SRC:.c=.o)
STM32CUBEF4_OBJ += $(STM32CUBEF4_ASM:.s=.o)
INCLUDEDIR += $(FREERTOS_INCLUDEDIR) $(STM32CUBEF4_INCLUDEDIR)

all : freertos stm32cubef4

freertos : $(FREERTOS_OBJ)
	$(AR) $(ARFLAGS) freertos.a $(FREERTOS_OBJ)

stm32cubef4 : $(STM32CUBEF4_OBJ)
	$(AR) $(ARFLAGS) stm32cubef4.a $(STM32CUBEF4_OBJ)

clean:
	$(RM) $(FREERTOS_OBJ) $(STM32CUBEF4_OBJ)
	$(RM) freertos.a stm32cubef4.a