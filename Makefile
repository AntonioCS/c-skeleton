#https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
TARGET=c-skeleton
CFLAGS=-std=c11 -Wall -Werror -g
LDFLAGS=
LDLIBS=
CC=gcc
SRC=$(wildcard ./src/*.c)
#https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
OBJ=$(subst ./src, ./src/obj, $(patsubst %.c, %.o, $(SRC)))

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
	
$(OBJ):	$(SRC)
	$(CC) $(CFLAGS) -c -o $@ $^
clean:
	rm -f $(TARGET) $(OBJ)
