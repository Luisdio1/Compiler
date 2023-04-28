%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *msg);
int yylex();

%}
 
%token T_and       "and"
%token T_char      "char"
%token T_div       "div"
%token T_do        "do"
%token T_else      "else"   
%token T_fun       "fun"    
%token T_if        "if"    
%token T_int       "int"    
%token T_mod       "mod"    
%token T_not       "not"    
%token T_nothing   "nothing"
%token T_or        "or"     
%token T_ref       "ref"    
%token T_return    "return"
%token T_then      "then"
%token T_var       "var"    
%token T_while     "while" 
%token T_id        "id"
%token T_num       "num"
%token T_spacers   "spaces"
%token T_string    "string"
%token T_character "character"
%token T_symb_oper "symb_oper"

%start stmts
%expect 1
%left '+' '-'
%left '*' '/'
%%

stmts  : stmts stmt
       | stmt
       ;

stmt   : decl 
       | variable '=' expr
       | "if" expr "then" stmt
       | "if" expr "then" stmt "else" stmt
       | "while" expr "do" stmt
       | "return" expr
       ;

decls  : decls decl
       | decl
       ;

decl   : "var" variable ':' type ';'
       | variable
       ;

type   : "int" '[' T_num ']'
       | "char" '[' T_num ']'
       | "int"
       | "char"
       ;

variable : "id" ',' variable
         | "id"
         ;

expr   : expr '+' expr
       | expr '-' expr
       | expr '*' expr
       | expr '/' expr
       | "id"
       | "num"
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