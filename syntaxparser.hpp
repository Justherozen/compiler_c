/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_SYNTAXPARSER_HPP_INCLUDED
# define YY_YY_SYNTAXPARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 1 "syntax.y"

#include "codegen.hpp"
#include <iostream>

#line 53 "syntaxparser.hpp"

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    FLOAT = 259,
    CHAR = 260,
    STRING = 261,
    MY_ID = 262,
    SEMI = 263,
    COMMA = 264,
    ASSIGNOP = 265,
    RELOP = 266,
    PLUS = 267,
    MINUS = 268,
    STAR = 269,
    DIV = 270,
    AND = 271,
    OR = 272,
    DOT = 273,
    NOT = 274,
    TYPE = 275,
    MY_LP = 276,
    RP = 277,
    LB = 278,
    RB = 279,
    MY_LC = 280,
    MY_RC = 281,
    STRUCT = 282,
    RETURN = 283,
    IF = 284,
    ELSE = 285,
    WHILE = 286,
    UMINUS = 287,
    LOWER_THAN_ELSE = 288
  };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define CHAR 260
#define STRING 261
#define MY_ID 262
#define SEMI 263
#define COMMA 264
#define ASSIGNOP 265
#define RELOP 266
#define PLUS 267
#define MINUS 268
#define STAR 269
#define DIV 270
#define AND 271
#define OR 272
#define DOT 273
#define NOT 274
#define TYPE 275
#define MY_LP 276
#define RP 277
#define LB 278
#define RB 279
#define MY_LC 280
#define MY_RC 281
#define STRUCT 282
#define RETURN 283
#define IF 284
#define ELSE 285
#define WHILE 286
#define UMINUS 287
#define LOWER_THAN_ELSE 288

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 26 "syntax.y"

  struct Node* node;

#line 134 "syntaxparser.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_SYNTAXPARSER_HPP_INCLUDED  */
