CC = gcc
OBJS = base.o binary.o

base: $(OBJS)
	$(CC) $(OBJS) -o base

base.o: base.c binary.h
binary.o: binary.c binary.h
