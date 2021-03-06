CC = gcc
CFLAGS = -ggdb -Wall -Wextra -std=c11 -O2
TARGET = ppmrw
SRC = $(wildcard src/*.c)
OBJ = $(patsubst %.c, %.o, $(SRC))

all: dir out/$(TARGET)

dir:
	mkdir -p out

out/$(TARGET): $(OBJ)
	$(CC) -o $@ $(OBJ)

$(OBJ): src/%.o : src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	find . -type f -name '*.o' -exec rm {} \;
	rm -rf out
