# Popa Maria-Catalina 331CC
all: temaA

lex.yy.c: temaA.l
		flex temaA.l

temaA: lex.yy.c temaA.o 
		gcc -o temaA lex.yy.c -lfl

clean: 
	rm temaA
