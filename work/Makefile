grace_parser: grace_lexer.o grace_parser.o utils.c
	gcc grace_lexer.o grace_parser.o utils.c -o grace_parser

grace_lexer.o: grace.c grace_parser.tab.h
	gcc -c grace.c -o grace_lexer.o

grace_parser.o: grace_parser.tab.c
	gcc -c grace_parser.tab.c -o grace_parser.o

grace_parser.tab.c grace_parser.tab.h: grace_parser.y
	bison -d grace_parser.y

grace.c: grace_lexer.l
	flex -o grace.c grace_lexer.l

clean:
	rm -f grace_parser grace_lexer.o grace_parser.o grace_parser.tab.c grace_parser.tab.h grace.c