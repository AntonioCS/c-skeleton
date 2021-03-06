#https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
BIN=c-skeleton
TARGET=./build/$(BIN)
CFLAGS=-std=c11 -Wall -Werror -g
LDFLAGS=
LDLIBS=
CC=gcc
SRC=$(wildcard ./src/*.c)
#https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
OBJ=$(subst ./src, ./src/obj, $(patsubst %.c, %.o, $(SRC)))
#http://stackoverflow.com/a/1951111/8715
dir_guard=@mkdir -p $(@D)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(dir_guard)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
	
$(OBJ):	$(SRC)
	$(dir_guard)
	$(CC) $(CFLAGS) -c -o $@ $^
clean:
	rm -rf $(TARGET) $(OBJ)
