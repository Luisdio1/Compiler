# **GRACE LANGUAGE-COMPILER**

We're building a compiler for our new language, named Grace, using Flex and Bison.

The file we create, for our lexical analysis rules, is named **grace_lexer.l**, and then with flex we create the **grace.c** file.
It's then compiled, using **gcc**, creating the **grace** executable file. This file is used to check the lexical analysis, which is the process of breaking down the input source code into a sequence of tokens. Each token represents a meaningful sequence of characters, such as keywords, identifiers, constants and operators.

We create the **grace.c** file, only to test the lexical analysis rules. Otherwise, as you will se later,
we create an object file named **grace.o**, to link it with the **grace_parser.tab.o**.


### **IMPORTANT**: If you want to use grace.c (to test the tokenizing, with **./grace**), make sure that the **main()** in grace_lexer.l is not commented out. It's, by default, commented out, because the linker doesn't work if the two object files have both a main().


## To create the grace.c file
```
flex -o grace.c grace_lexer.l
```

## To create the compiler executable
```
gcc grace.c -o grace
```

## To test it using the .gra files 
```
./grace <path-to-.gra-file>
```

## For example
```
./grace ../Grace_Examples/Hello.gra
```

## Now for the Syntax Analysis
We create the **grace_parser.y** file, that contains the rules for the Syntax Analysis.
We create the **grace_parser.tab.c** file, we run
```
bison grace_parser.y
```

We cannot compile it yet, because it will complain for the missing yylex(),
so we create the object file **grace_parser.tab.o** and we link it with **grace.o**.
```
gcc -c grace_parser.tab.c
```

```
gcc -c grace.c
```

## Linking them
```
gcc grace_parser.tab.o grace.o -o grace_parser
```
(**If only grace_parser.y has a main(), the linking will work**)
