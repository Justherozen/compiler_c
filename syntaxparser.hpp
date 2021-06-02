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
    STRING = 260,
    MY_ID = 261,
    SEMI = 262,
    COMMA = 263,
    ASSIGNOP = 264,
    RELOP = 265,
    PLUS = 266,
    MINUS = 267,
    STAR = 268,
    DIV = 269,
    AND = 270,
    OR = 271,
    DOT = 272,
    NOT = 273,
    TYPE = 274,
    MY_LP = 275,
    RP = 276,
    LB = 277,
    RB = 278,
    MY_LC = 279,
    MY_RC = 280,
    STRUCT = 281,
    RETURN = 282,
    IF = 283,
    ELSE = 284,
    WHILE = 285,
    UMINUS = 286,
    LOWER_THAN_ELSE = 287
  };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define STRING 260
#define MY_ID 261
#define SEMI 262
#define COMMA 263
#define ASSIGNOP 264
#define RELOP 265
#define PLUS 266
#define MINUS 267
#define STAR 268
#define DIV 269
#define AND 270
#define OR 271
#define DOT 272
#define NOT 273
#define TYPE 274
#define MY_LP 275
#define RP 276
#define LB 277
#define RB 278
#define MY_LC 279
#define MY_RC 280
#define STRUCT 281
#define RETURN 282
#define IF 283
#define ELSE 284
#define WHILE 285
#define UMINUS 286
#define LOWER_THAN_ELSE 287

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 26 "syntax.y"

  struct Node* node;

#line 132 "syntaxparser.hpp"

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
