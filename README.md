# **GRACE LANGUAGE-COMPILER**

We're building a compiler for our new language, named Grace, using Flex and Bison.

## To simply compile the parser, use the make file, by running:
```
make
```
(**It throws warnings for the string literals ("var", "id" etc.)**)

It creates an executable file **grace_parser**, which you can execute to test any file for its grammar.

### **IMPORTANT**: If you want to use grace.c (to test the tokenizing, with **./grace**), make sure that the **main()** in grace_lexer.l is not commented out. It's, by default, commented out, because the linker doesn't work if the two object files have both a main().

# More detailed guide

## To create the grace.c file:
```
flex -o grace.c grace_lexer.l
```

## To create the compiler executable:
```
gcc grace.c -o grace
```

## To test it using the .gra files:
```
./grace <path-to-.gra-file>
```

## For example:
```
./grace ~/Grace_Examples/Hello.gra
```

## Now for the Syntax Analysis:
We create the **grace_parser.y** file, that contains the rules for the Syntax Analysis.
We create the **grace_parser.tab.c** and **grace_parser.tab.h** files with **bison** 
```
bison -d grace_parser.y
```
or
```
bison -H grace_parser.y
```


We cannot compile it yet, because it will complain for the missing yylex(),
so we create the object file **grace_parser.tab.o** and we link it with **grace.o**.
```
gcc -c grace_parser.tab.c
```

```
gcc -c grace.c
```

## Linking them:
```
gcc grace_parser.tab.o grace.o utils.c -o grace_parser
```
(**If only grace_parser.y has a main(), the linking will work**)
