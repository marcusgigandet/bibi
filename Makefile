.PHONY: build clean flash erase deploy

TARGET := R7FA4M1AB
BINARY := bin/bibi

build:
	@alr build

clean:
	@alr clean

flash-elf:
	@pyocd flash -t $(TARGET) $(BINARY) --format=elf

flash-bin:
	@arm-none-eabi-objcopy -O binary $(BINARY) $(BINARY).bin
	@pyocd flash -t $(TARGET) $(BINARY).bin

erase:
	@pyocd erase -t $(TARGET) --chip
