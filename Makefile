.PHONY: build clean flash-elf flash-bin erase deploy

TARGET := R7FA4M1AB
BINARY := bin/bibi
BOARD ?= uno_r4_minima
SWD_FREQUENCY ?= 100000

build:
	@BOARD=$(BOARD) alr build

clean:
	@alr clean

flash-elf:
	@pyocd flash -t $(TARGET) -f $(SWD_FREQUENCY) $(BINARY) --format=elf

flash-bin:
	@arm-none-eabi-objcopy -O binary --gap-fill 0xff $(BINARY) $(BINARY).bin
	@pyocd flash -t $(TARGET) -f $(SWD_FREQUENCY) $(BINARY).bin

erase:
	@pyocd erase -t $(TARGET) --chip
