%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char*);
int yylex();

%}

%token T_id
%token T_num
%%

expr : expr '+' factor
     | factor
     ;
    
factor : factor '*' term
       | term
       ;

term   : T_id
       | T_num
       | '(' expr ')'
       ;
%%

void yyerror(char* msg) {
       fprintf(stderr, "Error: %s\n", msg);
       exit(1);
}

int main() {
       int result = yyparse();
       if (result == 0)
              printf("Success\n");
       else
              printf("Failure\n");
}