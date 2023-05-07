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
%token T_spacers   "spacers"
%token T_string    "string"
%token T_character "character"
%token T_NE        "not_equal"
%token T_LE        "less_equal"
%token T_GE        "greater_equal"

%start program
%expect 2
%left "or"
%left "and"
%nonassoc "not"
%nonassoc '=' '#' '<' '>' "less_equal" "greater_equal" "not_equal"
%left '+' '-'
%left '*' "div" "mod"
%%

program : func_def ;

func_def : header local_defs block ;

header : "fun" "id" '(' fpar_defs ')' ':' ret_type ;

fpar_defs : fpar_def ';' fpar_defs
          | 
          ;

fpar_def : "ref" ids ':' fpar_type
         |  ids ':' fpar_type    
         ;

ids      : "id" ',' ids
         | "id"
         ;

data_type : "int" 
          | "char"
          ;

type : data_type int_consts ; 

int_consts :
           | int_consts '[' "num" ']'
           ;

ret_type : data_type
         | "nothing"
         ;

fpar_type : data_type '[' ']' int_consts
          | data_type int_consts
          ;

local_defs : local_defs local_def
           | 
           ;

local_def : func_def
          | func_decl
          | var_def
          ;

func_decl : header ';'
          ;

var_def : "var" ids ':' type ';'
        ;

stmts : stmts stmt
      |
      ;

l_value : "id"
        | "string"
        | l_value '[' expr ']'
        ;

stmt : ';'
     | l_value "<-" expr ';'
     | block
     | func_call ';'
     | "if" cond "then" stmt "else" stmt
     | "if" cond "then" stmt
     | "while" cond "do" stmt
     | "return" expr ';'
     | "return" ';'
     ;

block : '{' stmts '}' ;

func_call : "id" '(' ')'
          | "id" '(' exprs ')'
          ; 

exprs    : expr ',' exprs
         | expr
         ;

expr : "num"
     | "character"
     | l_value
     | func_call
     |'(' expr ')'
     | '+' expr
     | '-' expr
     | expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr T_div expr
     | expr T_mod expr
     ;

cond : '(' cond ')'
     | T_not cond
     | cond T_and cond
     | cond T_or cond
     | expr '=' expr
     | expr '#' expr
     | expr '<' expr
     | expr '>' expr
     | expr T_LE expr
     | expr T_GE expr
     ;

// stmts  : stmts stmt
//        | stmt
//        ;

// stmt   : decl 
//        | variable '=' expr
//        | "if" expr "then" stmt
//        | "if" expr "then" stmt "else" stmt
//        | "while" expr "do" stmt
//        | "return" expr
//        ;

// decls  : decls decl
//        | decl
//        ;

// decl   : "var" variable ':' type ';'
//        | variable
//        ;

// type   : "int" '[' T_num ']'
//        | "char" '[' T_num ']'
//        | "int"
//        | "char"
//        ;

// variable : "id" ',' variable
//          | "id"
//          ;

// expr   : expr '+' expr
//        | expr '-' expr
//        | expr '*' expr
//        | expr '/' expr
//        | "id"
//        | "num"
//        | '(' expr ')'
//        ;
%%

int main() {
       int result = yyparse();
       if (result == 0)
              printf("Success\n");
       else
              printf("Failure\n");
}