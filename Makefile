all:
	nasm -f bin ./src/boot.asm -o ./bint/boot.bin

clean:
	rm -f ./bin/boot.bin