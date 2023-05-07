%{
#include <stdio.h>
#include "grace_parser.tab.h"

int lineno = 1;
%}
%option noyywrap

delim       [ \t\n\r]
ws          {delim}+
l           [a-zA-Z]
d           [0-9]

%x COMMENT
%x SINGLE_COMMENT
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

[():{};\[\],]               { return yytext[0]; }
"<-"                        { return T_spacers; }

\"(\\.|[^\n"\\])*\"         { return T_string; }
\'(\\.|[^\n'\\])\'?         { return T_character; }

"<>"                        { return T_NE; }
"<="                        { return T_LE; }
">="                        { return T_GE; }
[=+\-*/><#]                 { return yytext[0]; }

{l}[a-zA-Z0-9_]*            { return T_id; }
{d}+                        { return T_num; }

\n                          { lineno++; }
{ws}                        { }

\\\$\\\$                    { BEGIN(COMMENT); printf("Started COMMENT\n"); }
<COMMENT>\\\$\\\$           { BEGIN(INITIAL); }
<COMMENT>.                  { }
<COMMENT>\n                 { lineno++; }

\\\$                        { BEGIN(SINGLE_COMMENT); printf("Started SINGLE_COMMENT\n"); }
<SINGLE_COMMENT>\n          { BEGIN(INITIAL); }
<SINGLE_COMMENT>.           { }

.                           { printf("Error illegal character: %s (line %d)\n", yytext, lineno); exit(1); }

%%

// int main() {
//     int tok = yylex();

//     while (tok != T_eof) {
//         printf("token = %d, lexeme = %s \n", tok, yytext);
//         tok = yylex();
//     }
//     return 0;
// }