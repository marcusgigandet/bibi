.PHONY: build clean flash-elf flash-bin erase deploy

TARGET := R7FA4M1AB
BINARY := bin/bibi
BOARD ?= uno_r4_minima

build:
	@BOARD=$(BOARD) alr build
	@arm-none-eabi-objcopy -O binary --gap-fill 0xff $(BINARY) $(BINARY).bin

clean:
	@alr clean

flash-elf:
	@pyocd flash -t $(TARGET) $(BINARY) --format=elf

flash-bin:
	@pyocd flash -t $(TARGET) $(BINARY).bin

erase:
	@pyocd erase -t $(TARGET) --chip
