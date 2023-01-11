writer: writer.o
	gcc -std=c11 -fmax-errors=10 -Wextra writer.o -o writer

writer.o: writer.c
	gcc -std=c11 -fmax-errors=10 -Wextra -c writer.c -o writer.o

CROSS_COMPILE=
aarch64-none-linux-gnu-: writer1.o
	aarch64-none-linux-gnu-gcc -g -Wall writer1.o -o writer

writer1.o: writer.c
	aarch64-none-linux-gnu-gcc -g -Wall -c writer.c -o writer1.o

all: aarch64-none-linux-gnu- writer1.o

clean:
	rm -f *.o writer
