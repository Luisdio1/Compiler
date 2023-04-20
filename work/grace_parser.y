%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *msg);
int yylex();

%}

%token T_eof   
%token T_and    
%token T_char   
%token T_div    
%token T_do     
%token T_else   
%token T_fun    
%token T_if     
%token T_int    
%token T_mod    
%token T_not    
%token T_nothing
%token T_or     
%token T_ref    
%token T_return 
%token T_then   
%token T_var    
%token T_while 
%token T_id
%token T_num 
%token T_spacers  
%token T_string   
%token T_character
%token T_symb_oper
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

int main() {
       int result = yyparse();
       if (result == 0)
              printf("Success\n");
       else
              printf("Failure\n");
}