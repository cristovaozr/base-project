# Defines FreeRTOS sources and dependencies

FREERTOS_INCLUDEDIR += -IFreeRTOS/include -IFreeRTOS/portable/GCC/ARM_CM4F

FREERTOS_SRC += FreeRTOS/croutine.c FreeRTOS/event_groups.c FreeRTOS/list.c \
	FreeRTOS/queue.c FreeRTOS/stream_buffer.c FreeRTOS/tasks.c \
	FreeRTOS/timers.c FreeRTOS/portable/GCC/ARM_CM4F/port.c