BIN=c-skeleton

CFLAGS=-std=c11 -Wall -Werror -g
LDFLAGS=
LDLIBS=

SOURCES=$(wildcard *.c)
OBJECTS=$(patsubst %.c, %.o, $(SOURCES))

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

clean:
	rm -f $(BIN) $(OBJECTS)
