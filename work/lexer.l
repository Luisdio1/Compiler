%{
#include <stdio.h>

#define T_eof       0
#define T_and       1001
#define T_char      1002
#define T_div       1003
#define T_do        1004
#define T_else      1005
#define T_fun       1006
#define T_if        1007
#define T_int       1008
#define T_mod       1009
#define T_not       1010
#define T_nothing   1011
#define T_or        1012
#define T_ref       1013
#define T_return    1014
#define T_then      1015
#define T_var       1016
#define T_while     1017
#define T_id        1018
#define T_num       1019

int lineno = 1;
%}
%option noyywrap

delim       [ \t\n]
ws          {delim}+
l           [a-zA-Z]
d           [0-9]
%%

"and"                       { return T_and; }
"char"                      { return T_char; }
"div"                       { return T_div; }
"do"                        { return T_do; }
"else"                      { return T_else;  }
"fun"                       { return T_fun; }
"if"                        { return T_if; }
"int"                       { return T_int; }
"mod"                       { return T_mod; }
"not"                       { return T_not; }
"nothing"                   { return T_nothing; }
"or"                        { return T_or; }
"ref"                       { return T_ref; }
"return"                    { return T_return; }
"then"                      { return T_then; }
"var"                       { return T_var; }
"while"                     { return T_while; }

[=+\-*/()]                  { return yytext[0]; }

^[a-zA-Z][a-zA-Z0-9_]*$     { return T_id; }
^[0-9]+$                    { return T_num; }

\n                          { lineno++; }
{ws}                        {}
\'.*\n                      {}

.                           { printf("Erroe Illegal character: %s (line %d)\n", yytext , lineno); exit(1); }

%%

int main() {
    int tok = yylex();

    while (tok != T_eof) {
        printf("token = %d, lexeme = %s \n", tok, yytext);
        tok = yylex();
    }
    return 0;
}
