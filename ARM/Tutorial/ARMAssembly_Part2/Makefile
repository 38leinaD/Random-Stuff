# Makefile for armtest
# 38leinaD (daniel.platz@me.com) 2011

PROJECT = armtest
CC = arm-elf-gcc
OBJECTS = asmlib.o main.o

$(PROJECT): $(OBJECTS)
	$(CC) -mcpu=arm7 -o $@ $(OBJECTS) -lc

main.o: main.c
	$(CC) -mcpu=arm7 -O2 -g -c $<  -o $@

asmlib.o: asmlib.s
	$(CC) -mcpu=arm7 -O2 -g -c $<  -o $@

clean:
	rm -f *.o $(PROJECT)

run:
	arm-elf-run $(PROJECT)

debug:
	arm-elf-gdb -exec=$(PROJECT)

dis:
	arm-elf-objdump -d $(PROJECT)