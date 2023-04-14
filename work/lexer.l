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
l           [A-Za-z]
d           [0-9]
%%

"if"            { return T_if; }
"then"          { return T_then; }
"else"          { return T_else; }
"begin"         { return T_begin; }
"end"           { return T_end;  }
"for"           { return T_for; }
"do"            { return T_do; }
"print"         { return T_print; }
"let"           { return T_let; }

[=+\-*/()]      { return yytext[0]; }

{l}+            { return T_id; }
{d}+            { return T_num; }

\n              { lineno++; }
{ws}            {}
\'.*\n          {}

.               { printf("Erroe Illegal character: %s (line %d)\n", yytext , lineno); exit(1); }

%%

int main() {
    int tok = yylex();

    while (tok != T_eof) {
        printf("token = %d, lexeme = %s \n", tok, yytext);
        tok = yylex();
    }
    return 0;
}
