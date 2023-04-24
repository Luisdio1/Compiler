/* A Bison parser, made by GNU Bison 3.8.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_GRACE_PARSER_TAB_H_INCLUDED
# define YY_YY_GRACE_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    T_and = 258,                   /* T_and  */
    T_char = 259,                  /* T_char  */
    T_div = 260,                   /* T_div  */
    T_do = 261,                    /* T_do  */
    T_else = 262,                  /* T_else  */
    T_fun = 263,                   /* T_fun  */
    T_if = 264,                    /* T_if  */
    T_int = 265,                   /* T_int  */
    T_mod = 266,                   /* T_mod  */
    T_not = 267,                   /* T_not  */
    T_nothing = 268,               /* T_nothing  */
    T_or = 269,                    /* T_or  */
    T_ref = 270,                   /* T_ref  */
    T_return = 271,                /* T_return  */
    T_then = 272,                  /* T_then  */
    T_var = 273,                   /* T_var  */
    T_while = 274,                 /* T_while  */
    T_id = 275,                    /* T_id  */
    T_num = 276,                   /* T_num  */
    T_spacers = 277,               /* T_spacers  */
    T_string = 278,                /* T_string  */
    T_character = 279,             /* T_character  */
    T_symb_oper = 280              /* T_symb_oper  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_GRACE_PARSER_TAB_H_INCLUDED  */
