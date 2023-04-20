# GRACE LANGUAGE-COMPILER

We're building a compiler for our new language, named Grace.
The file created for lexical analysis is named **grace_lexer.l**.


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