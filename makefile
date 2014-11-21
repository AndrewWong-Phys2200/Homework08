GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O0 -g 
LFLAGS = -O0 -g
LIBS = -lgsl -lm

all: hw08-1   hw08-2   hw08-3

hw08-1: hw08-1.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res1: hw08-1
	./hw08-1 > res1

hw08-1.png: hw08-1.gpl res1
	$(GRAPH) hw08-1.gpl

hw08-2: hw08-2.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res2: hw08-2
	./hw08-2 > res2

hw08-2.png: hw08-2.gpl res2
	$(GRAPH) hw08-2.gpl

hw08-3: hw08-3.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res3: hw08-3
	./hw08-3 > res3

hw08-3.png: hw08-3.gpl res3
	$(GRAPH) hw08-3.gpl


clean : 
	rm -f *~
	rm -f *.o
	rm -f hw08-1 hw08-2 hw08-3

veryclean : clean
	rm -f res1 hw08-1.png  res2 hw08-2.png  res3 hw08-3.png
