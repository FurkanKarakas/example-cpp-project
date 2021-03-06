# all - compile the program even if the source files haven't changed (only runs the command present under this target)
# main - compile the program only if some source files have changed
.PHONY: all
all main: Polygon.o Rectangle.o Triangle.o
	g++ Polygon.o Rectangle.o Triangle.o main.cpp -o main

# the Polygon.o object file needs recompiled if Polygon.cpp or Polygon.hpp changes
Polygon.o: Polygon.cpp Polygon.hpp
	g++ -c Polygon.cpp -o Polygon.o

# the Rectangle.o object file needs recompiled if Rectangle.cpp or Rectangle.hpp changes
Rectangle.o: Rectangle.cpp Rectangle.hpp
	g++ -c Rectangle.cpp -o Rectangle.o

# the Triangle.o object file needs recompiled if Triangle.cpp or Triangle.hpp changes
Triangle.o: Triangle.cpp Triangle.hpp
	g++ -c Triangle.cpp -o Triangle.o

# clean - delete the compiled version of your program and any object files or other temporary files created during compilation.
.PHONY: clean
clean:
	rm -f *.o main
