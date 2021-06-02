NAME = Cmm

LLVM_CONFIG = /usr/lib/llvm-10/bin/llvm-config

CXXFLAGS = `$(LLVM_CONFIG) --cppflags` -std=c++14 $(NO_WARNING)
LDFLAGS = `$(LLVM_CONFIG) --ldflags`
LIBS = `$(LLVM_CONFIG) --libs all`

OBJS = treenode.o codegen.o syntaxparser.o lexscanner.o main.o

all : $(NAME)

syntaxparser.cpp: syntax.y
	yacc -d -Wno-yacc -o syntaxparser.cpp syntax.y

syntaxparser.hpp: syntaxparser.cpp

lexscanner.cpp: lexical.l
	lex -o lexscanner.cpp lexical.l

%.o: %.cpp
	g++ -c $(CXXFLAGS) -g -o $@ $< 

$(NAME): $(OBJS)
	g++ -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

.PHONY: clean
clean:
	-rm -f lexscanner.cpp
	-rm -f syntaxparser.cpp
	-rm -f syntaxparser.hpp
	-rm -f *.o
	-rm -f $(NAME)

draw: 
	dot -Tpng drawsyntextree.dot -o syntextree.png