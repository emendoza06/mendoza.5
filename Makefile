CC         = gcc
CFLAGS     = -Wall -g

STANDARD   = standardlib.h constant.h shared.h
SRC        = queue.h banker.h
MASTER_SRC = oss.c
USER_SRC   = user_proc.c

OBJ        = queue.o banker.o
MASTER_OBJ = $(MASTER_SRC:.c=.o)
USER_OBJ   = $(USER_SRC:.c=.o)

MASTER     = oss
USER       = user_proc

OUTPUT    = $(MASTER) $(USER)
all: $(OUTPUT)


%.o: %.c $(STANDARD) $(SRC)
	$(CC) $(CFLAGS) -c $< -o $@

$(MASTER): $(MASTER_OBJ) $(OBJ)
	$(CC) $(CFLAGS) $(MASTER_OBJ) $(OBJ) -o $(MASTER)

$(USER): $(USER_OBJ)
	$(CC) $(CFLAGS) $(USER_OBJ) -o $(USER)


.PHONY: clean
clean:
	/bin/rm -f $(OUTPUT) *.o *.dat
