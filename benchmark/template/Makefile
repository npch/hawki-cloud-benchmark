#modify compiler and source files
#do not change the executable name since it is used in submit.pl
CC = mpicc
CFLAGS = -c -lm 
LDFLAGS =
SOURCES = benchmark.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=benchmark
ARGS=

all: $(SOURCES) $(EXECUTABLE)
        
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -lm -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@
clean:
	rm $(EXECUTABLE) $(OBJECTS)

run :
	@$(MAKE) && ./$(EXECUTABLE) $(ARGS)
