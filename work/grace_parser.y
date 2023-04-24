%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *msg);
int yylex();

%}
 
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

%start stmts
%expect 1
%%

stmts  : stmts stmt
       | stmt
       ;

stmt   : decl 
       | variable '=' expr
       | T_if expr T_then stmt
       | T_if expr T_then stmt T_else stmt
       | T_while expr T_do stmt
       | T_return expr
       ;

decl   : T_var variable ':' type ';'
       | variable
       ;

type   : T_int '[' T_num ']'
       | T_char '[' T_num ']'
       | T_int
       | T_char
       ;

variable : T_id ',' variable
         | T_id
         ;

expr   : expr '+' factor
       | expr '-' factor
       | factor
       ;
    
factor : factor '*' term
       | factor '/' term
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