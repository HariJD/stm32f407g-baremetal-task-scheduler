CC=arm-none-eabi-gcc
MACH=cortex-m4

CFLAGS= -c -mcpu=$(MACH) -mthumb -mfloat-abi=soft -std=gnu11 -Wall -O0

# normal build
//LDFLAGS= -mcpu=$(MACH) -mthumb -mfloat-abi=soft \
         -T stm32_lksc.ld \
         -nostartfiles \
         -Wl,-Map=final.map

# semihosting build
LDFLAGS_SH = -mcpu=$(MACH) -mthumb -mfloat-abi=soft \
             --specs=rdimon.specs \
             --specs=nano.specs \
             -T stm32_lksc.ld \
             -Wl,-Map=final_sh.map


all: main.o led.o stm32_starup.o syscalls.o final.elf

semi: main.o led.o stm32_starup.o final_sh.elf


main.o: main.c
	$(CC) $(CFLAGS) -o $@ $^

led.o: led.c
	$(CC) $(CFLAGS) -o $@ $^

stm32_starup.o: stm32_starup.c
	$(CC) $(CFLAGS) -o $@ $^

syscalls.o: syscalls.c
	$(CC) $(CFLAGS) -o $@ $^


final.elf: main.o led.o stm32_starup.o syscalls.o
	$(CC) $(LDFLAGS) -o $@ $^

final_sh.elf: main.o led.o stm32_starup.o
	$(CC) $(LDFLAGS_SH) -o $@ $^


clean:
	rm -rf *.o *.elf *.map

load:
	openocd -f board/stm32f4discovery.cfg

