/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 5 "syntax.y"

#include <stdio.h>
#include <stdarg.h>
#include <iostream>
#include"treenode.h"
extern int yylineno;
typedef struct Node* node;
//#define YYSTYPE struct Node*
int emptyflag=0;
int emptystart=0;
int syntaxError=0;
struct Node *add_parsing_node(char* Name,int column);
void  fill_child_node(struct Node *parent,int num_args,...);
void tree_search(struct Node* cur,int depth);
extern int yylex(void);
void yyerror(const char *s) { 
    std::printf("Error: %s\n", s);
    std::exit(1); 
}
struct Node* root;

#line 92 "syntaxparser.cpp"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 140 "syntaxparser.cpp"

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

#line 221 "syntaxparser.cpp"

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



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
             && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE) \
             + YYSIZEOF (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   416

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  34
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  19
/* YYNRULES -- Number of rules.  */
#define YYNRULES  82
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  149

#define YYUNDEFTOK  2
#define YYMAXUTOK   288


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   102,   102,   110,   114,   120,   124,   128,   132,   135,
     143,   146,   150,   155,   159,   164,   168,   172,   176,   179,
     183,   187,   190,   193,   197,   201,   206,   211,   215,   218,
     222,   226,   230,   234,   238,   242,   245,   248,   251,   256,
     260,   263,   268,   272,   275,   280,   284,   289,   294,   299,
     304,   309,   314,   319,   324,   329,   334,   339,   344,   349,
     353,   358,   363,   368,   373,   378,   383,   388,   393,   396,
     399,   402,   405,   408,   411,   414,   417,   420,   423,   426,
     429,   433,   438
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INT", "FLOAT", "CHAR", "STRING",
  "MY_ID", "SEMI", "COMMA", "ASSIGNOP", "RELOP", "PLUS", "MINUS", "STAR",
  "DIV", "AND", "OR", "DOT", "NOT", "TYPE", "MY_LP", "RP", "LB", "RB",
  "MY_LC", "MY_RC", "STRUCT", "RETURN", "IF", "ELSE", "WHILE", "UMINUS",
  "LOWER_THAN_ELSE", "$accept", "Program", "ExtDefList", "ExtDef",
  "ExtDecList", "Specifier", "VarDec", "FunDec", "VarList", "ParamDec",
  "CompSt", "StmtList", "Stmt", "DefList", "Def", "DecList", "Dec", "Exp",
  "Args", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288
};
# endif

#define YYPACT_NINF (-71)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-29)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      24,    90,   -71,    68,   -71,     7,    13,   -71,     3,   -71,
     -71,    48,    76,    66,    42,     1,   -71,   -71,    61,    11,
      18,   -71,    46,    93,   124,   -71,    61,   -71,    93,   104,
     118,   107,   -71,   108,   119,   -71,   -71,   109,   -71,   120,
      63,    54,    61,   129,   -71,    61,   -71,   -71,   -71,   -71,
     134,    53,     9,   145,   147,   -71,   -71,   -71,   -71,    82,
     155,   166,   177,   188,   132,   143,   -71,   149,    54,   105,
     -71,   -71,   -71,    88,   -71,   -71,    93,   -71,   144,    88,
     -71,    30,   -71,    30,   164,   318,   169,   123,    88,    88,
     -71,   -71,   180,   -71,   199,   210,   221,   232,   243,   254,
     265,   276,   190,   198,   360,   -71,   186,   -71,   289,   197,
     303,   -71,   -71,   -71,   -71,   -71,   332,   346,   -71,   -71,
     360,   -71,   393,   -71,   273,   -71,   273,   -71,    30,   -71,
      30,   -71,   386,   -71,   373,   -71,   206,   -71,    88,   -71,
     -71,    83,    83,   -71,   -71,   191,   -71,    83,   -71
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,    14,     0,     2,     0,     0,     8,     0,     1,
       3,     0,    15,     0,     0,     0,    10,     9,     0,     0,
       0,     5,     0,     0,     0,     7,    40,     6,     0,     0,
      24,     0,    20,     0,     0,    17,    13,    15,    12,     0,
       0,     0,    40,    25,    22,     0,    21,    19,    16,    18,
       0,    46,     0,    44,     0,    64,    65,    66,    67,    63,
       0,     0,     0,     0,     0,     0,    30,     0,     0,     0,
      39,    23,    42,     0,    43,    41,     0,    35,     0,     0,
      77,    57,    78,    58,     0,     0,     0,     0,     0,     0,
      26,    27,     0,    29,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    47,    45,     0,    60,    82,     0,
       0,    76,    56,    38,    37,    31,     0,     0,    36,    68,
      48,    71,    51,    72,    52,    73,    53,    74,    54,    75,
      55,    69,    49,    70,    50,    62,     0,    79,     0,    59,
      61,     0,     0,    80,    81,    32,    34,     0,    33
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -71,   -71,    40,   -71,   187,     4,   -24,   -71,   -13,   -71,
     217,   173,   -70,   201,   -71,   176,   -71,   -60,   116
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     3,     4,     5,    13,     6,    14,    15,    29,    30,
      66,    67,    68,    41,    42,    52,    53,    69,   109
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      81,    83,    85,    87,    43,     8,    33,    -4,     1,    25,
      74,    16,    31,   104,    11,    -4,    51,    75,   108,   110,
      12,    34,    28,    28,    -4,     1,    26,     2,   116,   117,
      40,     2,    71,    32,   120,   122,   124,   126,   128,   130,
     132,   134,    35,    22,     2,    10,    40,     1,   102,    28,
     -11,    23,    51,   103,    -4,    54,    17,    55,    56,    57,
      58,    59,    36,    73,    50,    24,     2,    60,     9,    18,
      37,   145,   146,    61,    21,    62,    24,   148,   108,    26,
     -28,     2,    63,    64,    54,    65,    55,    56,    57,    58,
      59,    55,    56,    57,    58,    59,    60,    19,     7,    20,
      37,    60,    61,    78,    62,    79,    92,    61,    26,    62,
       2,    63,    64,    93,    65,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   114,    39,    44,    45,   103,    46,
      47,   115,    20,    94,    95,    96,    97,    98,    99,   100,
     101,   102,    72,    48,    49,   106,   103,    55,    56,    57,
      58,    59,    24,    88,    76,    77,    80,    60,    55,    56,
      57,    58,    59,    61,    89,    62,   107,    82,    60,    55,
      56,    57,    58,    59,    61,    90,    62,   113,    84,    60,
      55,    56,    57,    58,    59,    61,   111,    62,   118,    86,
      60,    55,    56,    57,    58,    59,    61,   135,    62,   136,
     119,    60,    55,    56,    57,    58,    59,    61,   137,    62,
      38,   121,    60,    55,    56,    57,    58,    59,    61,   139,
      62,   147,   123,    60,    55,    56,    57,    58,    59,    61,
     143,    62,    27,   125,    60,    55,    56,    57,    58,    59,
      61,    91,    62,    70,   127,    60,    55,    56,    57,    58,
      59,    61,   105,    62,   144,   129,    60,    55,    56,    57,
      58,    59,    61,     0,    62,     0,   131,    60,    55,    56,
      57,    58,    59,    61,     0,    62,     0,   133,    60,    55,
      56,    57,    58,    59,    61,     0,    62,    98,    99,    60,
       0,   102,     0,     0,     0,    61,   103,    62,   138,    94,
      95,    96,    97,    98,    99,   100,   101,   102,     0,     0,
       0,     0,   103,    94,    95,    96,    97,    98,    99,   100,
     101,   102,     0,     0,     0,     0,   103,   140,    94,    95,
      96,    97,    98,    99,   100,   101,   102,     0,     0,     0,
     112,   103,    94,    95,    96,    97,    98,    99,   100,   101,
     102,     0,     0,     0,   141,   103,    94,    95,    96,    97,
      98,    99,   100,   101,   102,     0,     0,     0,   142,   103,
      94,    95,    96,    97,    98,    99,   100,   101,   102,     0,
       0,     0,     0,   103,    95,    96,    97,    98,    99,   100,
       0,   102,     0,     0,     0,     0,   103,    95,    96,    97,
      98,    99,     0,     0,   102,    96,    97,    98,    99,   103,
       0,   102,     0,     0,     0,     0,   103
};

static const yytype_int16 yycheck[] =
{
      60,    61,    62,    63,    28,     1,    19,     0,     1,     8,
       1,     8,     1,    73,     1,     8,    40,     8,    78,    79,
       7,     3,    18,    19,     0,     1,    25,    20,    88,    89,
      26,    20,    45,    22,    94,    95,    96,    97,    98,    99,
     100,   101,    24,     1,    20,     5,    42,     1,    18,    45,
       8,     9,    76,    23,     8,     1,     8,     3,     4,     5,
       6,     7,    22,    10,     1,    23,    20,    13,     0,    21,
       7,   141,   142,    19,     8,    21,    23,   147,   138,    25,
      26,    20,    28,    29,     1,    31,     3,     4,     5,     6,
       7,     3,     4,     5,     6,     7,    13,    21,     8,    23,
       7,    13,    19,    21,    21,    23,     1,    19,    25,    21,
      20,    28,    29,     8,    31,    10,    11,    12,    13,    14,
      15,    16,    17,    18,     1,     1,    22,     9,    23,    22,
      22,     8,    23,    10,    11,    12,    13,    14,    15,    16,
      17,    18,     8,    24,    24,     1,    23,     3,     4,     5,
       6,     7,    23,    21,     9,     8,     1,    13,     3,     4,
       5,     6,     7,    19,    21,    21,    22,     1,    13,     3,
       4,     5,     6,     7,    19,    26,    21,     8,     1,    13,
       3,     4,     5,     6,     7,    19,    22,    21,     8,     1,
      13,     3,     4,     5,     6,     7,    19,     7,    21,     1,
       1,    13,     3,     4,     5,     6,     7,    19,    22,    21,
      23,     1,    13,     3,     4,     5,     6,     7,    19,    22,
      21,    30,     1,    13,     3,     4,     5,     6,     7,    19,
      24,    21,    15,     1,    13,     3,     4,     5,     6,     7,
      19,    68,    21,    42,     1,    13,     3,     4,     5,     6,
       7,    19,    76,    21,   138,     1,    13,     3,     4,     5,
       6,     7,    19,    -1,    21,    -1,     1,    13,     3,     4,
       5,     6,     7,    19,    -1,    21,    -1,     1,    13,     3,
       4,     5,     6,     7,    19,    -1,    21,    14,    15,    13,
      -1,    18,    -1,    -1,    -1,    19,    23,    21,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    -1,    -1,
      -1,    -1,    23,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    -1,    -1,    -1,    -1,    23,    24,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    -1,    -1,    -1,
      22,    23,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    -1,    -1,    -1,    22,    23,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    -1,    -1,    -1,    22,    23,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    -1,
      -1,    -1,    -1,    23,    11,    12,    13,    14,    15,    16,
      -1,    18,    -1,    -1,    -1,    -1,    23,    11,    12,    13,
      14,    15,    -1,    -1,    18,    12,    13,    14,    15,    23,
      -1,    18,    -1,    -1,    -1,    -1,    23
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     1,    20,    35,    36,    37,    39,     8,    39,     0,
      36,     1,     7,    38,    40,    41,     8,     8,    21,    21,
      23,     8,     1,     9,    23,     8,    25,    44,    39,    42,
      43,     1,    22,    42,     3,    24,    36,     7,    38,     1,
      39,    47,    48,    40,    22,     9,    22,    22,    24,    24,
       1,    40,    49,    50,     1,     3,     4,     5,     6,     7,
      13,    19,    21,    28,    29,    31,    44,    45,    46,    51,
      47,    42,     8,    10,     1,     8,     9,     8,    21,    23,
       1,    51,     1,    51,     1,    51,     1,    51,    21,    21,
      26,    45,     1,     8,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    23,    51,    49,     1,    22,    51,    52,
      51,    22,    22,     8,     1,     8,    51,    51,     8,     1,
      51,     1,    51,     1,    51,     1,    51,     1,    51,     1,
      51,     1,    51,     1,    51,     7,     1,    22,     9,    22,
      24,    22,    22,    24,    52,    46,    46,    30,    46
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    34,    35,    36,    36,    37,    37,    37,    37,    37,
      37,    38,    38,    38,    39,    40,    40,    40,    40,    41,
      41,    41,    41,    42,    42,    43,    44,    45,    45,    46,
      46,    46,    46,    46,    46,    46,    46,    46,    46,    47,
      47,    48,    48,    48,    49,    49,    50,    50,    51,    51,
      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,
      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,
      51,    51,    51,    51,    51,    51,    51,    51,    51,    51,
      51,    52,    52
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     3,     3,     3,     2,     3,
       3,     1,     3,     3,     1,     1,     4,     3,     4,     4,
       3,     4,     4,     3,     1,     2,     4,     2,     0,     2,
       1,     3,     5,     7,     5,     2,     3,     3,     3,     2,
       0,     3,     3,     3,     1,     3,     1,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     2,     2,     4,
       3,     4,     3,     1,     1,     1,     1,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     2,     2,     4,
       4,     3,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static int
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  int res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
 }

#  define YY_LOCATION_PRINT(File, Loc)          \
  yy_location_print_ (File, &(Loc))

# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  YYUSE (yylocationp);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  YY_LOCATION_PRINT (yyo, *yylocationp);
  YYFPRINTF (yyo, ": ");
  yy_symbol_value_print (yyo, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                       , &(yylsp[(yyi + 1) - (yynrhs)])                       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.
       'yyls': related to locations.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[3];

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yylsp = yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  yylsp[0] = yylloc;
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yyls1, yysize * YYSIZEOF (*yylsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
        yyls = yyls1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location. */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  yyerror_range[1] = yyloc;
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 102 "syntax.y"
                    {
    (yyval.node)=add_parsing_node("Program",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));
    root=(yyval.node);
    if(emptyflag==0){
    root->column=emptystart;}
    }
#line 1663 "syntaxparser.cpp"
    break;

  case 3:
#line 110 "syntax.y"
                              {
    (yyval.node)=add_parsing_node("ExtDefList",(yyloc).first_line);  
    fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));
    }
#line 1672 "syntaxparser.cpp"
    break;

  case 4:
#line 114 "syntax.y"
      {
    (yyval.node)=NULL;
    emptystart=yylineno;
    }
#line 1681 "syntaxparser.cpp"
    break;

  case 5:
#line 120 "syntax.y"
                                {
    (yyval.node)=add_parsing_node("ExtDef",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node)); 
    }
#line 1690 "syntaxparser.cpp"
    break;

  case 6:
#line 124 "syntax.y"
                             {//函数体的定义,其中Specifier是返回类型，FunDec是函数头，CompSt表示函数体
    (yyval.node)=add_parsing_node("ExtDef",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node)); 
    }
#line 1699 "syntaxparser.cpp"
    break;

  case 7:
#line 128 "syntax.y"
                          {//函数体声明
    (yyval.node)=add_parsing_node("ExtDef",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node)); 
    }
#line 1708 "syntaxparser.cpp"
    break;

  case 8:
#line 132 "syntax.y"
               {//错误的所有类型
    syntaxError+=1;
    }
#line 1716 "syntaxparser.cpp"
    break;

  case 9:
#line 135 "syntax.y"
                         {
    syntaxError+=1;
    }
#line 1724 "syntaxparser.cpp"
    break;

  case 10:
#line 143 "syntax.y"
                        {
    syntaxError+=1;
    }
#line 1732 "syntaxparser.cpp"
    break;

  case 11:
#line 146 "syntax.y"
                  {//单个变量
    (yyval.node)=add_parsing_node("ExtDecList",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));
}
#line 1741 "syntaxparser.cpp"
    break;

  case 12:
#line 150 "syntax.y"
                             {//右递归的过程
    (yyval.node)=add_parsing_node("ExtDecList",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node)); 
    }
#line 1750 "syntaxparser.cpp"
    break;

  case 13:
#line 155 "syntax.y"
                           {//终结符位置需要考虑错误
    syntaxError+=1;
    }
#line 1758 "syntaxparser.cpp"
    break;

  case 14:
#line 159 "syntax.y"
               {//类型或者是结构体
    (yyval.node)=add_parsing_node("Specifier",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));
    }
#line 1767 "syntaxparser.cpp"
    break;

  case 15:
#line 164 "syntax.y"
            {//int a中的a
    (yyval.node)=add_parsing_node("VarDec",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));
}
#line 1776 "syntaxparser.cpp"
    break;

  case 16:
#line 168 "syntax.y"
                     {//int a[10]中的a[10]
        (yyval.node)=add_parsing_node("VarDec",(yyloc).first_line);
        fill_child_node((yyval.node),4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
    }
#line 1785 "syntaxparser.cpp"
    break;

  case 17:
#line 172 "syntax.y"
                 {//int a[10]中的a[10]
        (yyval.node)=add_parsing_node("VarDec",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
    }
#line 1794 "syntaxparser.cpp"
    break;

  case 18:
#line 176 "syntax.y"
                       {
    syntaxError+=1;
    }
#line 1802 "syntaxparser.cpp"
    break;

  case 19:
#line 179 "syntax.y"
                             {//函数头定义
    (yyval.node)=add_parsing_node("FunDec",(yyloc).first_line);
    fill_child_node((yyval.node),4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1811 "syntaxparser.cpp"
    break;

  case 20:
#line 183 "syntax.y"
                     {//参数列表没有
    (yyval.node)=add_parsing_node("FunDec",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node)); 
    }
#line 1820 "syntaxparser.cpp"
    break;

  case 21:
#line 187 "syntax.y"
                         {
    syntaxError+=1;
    }
#line 1828 "syntaxparser.cpp"
    break;

  case 22:
#line 190 "syntax.y"
                           {
        syntaxError+=1;
    }
#line 1836 "syntaxparser.cpp"
    break;

  case 23:
#line 193 "syntax.y"
                              {//参数列表，右递归
    (yyval.node)=add_parsing_node("VarList",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node)); 
}
#line 1845 "syntaxparser.cpp"
    break;

  case 24:
#line 197 "syntax.y"
              {//单独一个参数
    (yyval.node)=add_parsing_node("VarList",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));
    }
#line 1854 "syntaxparser.cpp"
    break;

  case 25:
#line 201 "syntax.y"
                           {//类型+参数名
    (yyval.node)=add_parsing_node("ParamDec",(yyloc).first_line);
    fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1863 "syntaxparser.cpp"
    break;

  case 26:
#line 206 "syntax.y"
                                   {//先是一串变量定义+一串语句
        (yyval.node)=add_parsing_node("CompSt",(yyloc).first_line);
        fill_child_node((yyval.node),4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1872 "syntaxparser.cpp"
    break;

  case 27:
#line 211 "syntax.y"
                      {//右递归或者空
        (yyval.node)=add_parsing_node("StmtList",(yyloc).first_line);
        fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1881 "syntaxparser.cpp"
    break;

  case 28:
#line 215 "syntax.y"
          {
         (yyval.node)=NULL;
                  }
#line 1889 "syntaxparser.cpp"
    break;

  case 29:
#line 218 "syntax.y"
             {//末尾是分号的表达式
        (yyval.node)=add_parsing_node("Stmt",(yyloc).first_line);
        fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1898 "syntaxparser.cpp"
    break;

  case 30:
#line 222 "syntax.y"
       {//花括号括起来的语句块
        (yyval.node)=add_parsing_node("Stmt",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));
}
#line 1907 "syntaxparser.cpp"
    break;

  case 31:
#line 226 "syntax.y"
                {//return语句
        (yyval.node)=add_parsing_node("Stmt",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1916 "syntaxparser.cpp"
    break;

  case 32:
#line 230 "syntax.y"
                                           {//IF语句，优先级没有if else语句高
        (yyval.node)=add_parsing_node("Stmt",(yyloc).first_line);
        fill_child_node((yyval.node),5,(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1925 "syntaxparser.cpp"
    break;

  case 33:
#line 234 "syntax.y"
                               {//IF语句
        (yyval.node)=add_parsing_node("Stmt",(yyloc).first_line);
        fill_child_node((yyval.node),7,(yyvsp[-6].node),(yyvsp[-5].node),(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1934 "syntaxparser.cpp"
    break;

  case 34:
#line 238 "syntax.y"
                        {//while
        (yyval.node)=add_parsing_node("Stmt",(yyloc).first_line);
        fill_child_node((yyval.node),5,(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1943 "syntaxparser.cpp"
    break;

  case 35:
#line 242 "syntax.y"
            {
    syntaxError+=1;
}
#line 1951 "syntaxparser.cpp"
    break;

  case 36:
#line 245 "syntax.y"
                {
    syntaxError+=1;
}
#line 1959 "syntaxparser.cpp"
    break;

  case 37:
#line 248 "syntax.y"
                 {
    syntaxError+=1;
}
#line 1967 "syntaxparser.cpp"
    break;

  case 38:
#line 251 "syntax.y"
                  {
    syntaxError+=1;
}
#line 1975 "syntaxparser.cpp"
    break;

  case 39:
#line 256 "syntax.y"
                   {//声明时的右递归
    (yyval.node)=add_parsing_node("DefList",(yyloc).first_line);
    fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));
}
#line 1984 "syntaxparser.cpp"
    break;

  case 40:
#line 260 "syntax.y"
      {
    (yyval.node)=NULL;               
    }
#line 1992 "syntaxparser.cpp"
    break;

  case 41:
#line 263 "syntax.y"
                          {
    (yyval.node)=add_parsing_node("Def",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

}
#line 2002 "syntaxparser.cpp"
    break;

  case 42:
#line 268 "syntax.y"
                        {
      syntaxError+=1;
    }
#line 2010 "syntaxparser.cpp"
    break;

  case 43:
#line 272 "syntax.y"
                           {
      syntaxError+=1;
    }
#line 2018 "syntaxparser.cpp"
    break;

  case 44:
#line 275 "syntax.y"
           {
    (yyval.node)=add_parsing_node("DecList",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));

}
#line 2028 "syntaxparser.cpp"
    break;

  case 45:
#line 280 "syntax.y"
                       {;//左递归
        (yyval.node)=add_parsing_node("DecList",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
    }
#line 2037 "syntaxparser.cpp"
    break;

  case 46:
#line 284 "syntax.y"
          {//int a
    (yyval.node)=add_parsing_node("Dec",(yyloc).first_line);
    fill_child_node((yyval.node),1,(yyvsp[0].node));

}
#line 2047 "syntaxparser.cpp"
    break;

  case 47:
#line 289 "syntax.y"
                        {//int a=1
    (yyval.node)=add_parsing_node("Dec",(yyloc).first_line);
    fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
        }
#line 2056 "syntaxparser.cpp"
    break;

  case 48:
#line 294 "syntax.y"
                    {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

}
#line 2066 "syntaxparser.cpp"
    break;

  case 49:
#line 299 "syntax.y"
                     {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2076 "syntaxparser.cpp"
    break;

  case 50:
#line 304 "syntax.y"
                    {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2086 "syntaxparser.cpp"
    break;

  case 51:
#line 309 "syntax.y"
                       {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2096 "syntaxparser.cpp"
    break;

  case 52:
#line 314 "syntax.y"
                      {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2106 "syntaxparser.cpp"
    break;

  case 53:
#line 319 "syntax.y"
                      {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2116 "syntaxparser.cpp"
    break;

  case 54:
#line 324 "syntax.y"
                     {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2126 "syntaxparser.cpp"
    break;

  case 55:
#line 329 "syntax.y"
                    {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2136 "syntaxparser.cpp"
    break;

  case 56:
#line 334 "syntax.y"
                     {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2146 "syntaxparser.cpp"
    break;

  case 57:
#line 339 "syntax.y"
                               {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2156 "syntaxparser.cpp"
    break;

  case 58:
#line 344 "syntax.y"
                {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),2,(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2166 "syntaxparser.cpp"
    break;

  case 59:
#line 349 "syntax.y"
                            {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));
        }
#line 2175 "syntaxparser.cpp"
    break;

  case 60:
#line 353 "syntax.y"
                       {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2185 "syntaxparser.cpp"
    break;

  case 61:
#line 358 "syntax.y"
                        {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2195 "syntaxparser.cpp"
    break;

  case 62:
#line 363 "syntax.y"
                      {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

        }
#line 2205 "syntaxparser.cpp"
    break;

  case 63:
#line 368 "syntax.y"
              {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));

        }
#line 2215 "syntaxparser.cpp"
    break;

  case 64:
#line 373 "syntax.y"
             {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));

        }
#line 2225 "syntaxparser.cpp"
    break;

  case 65:
#line 378 "syntax.y"
              {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));
        
        }
#line 2235 "syntaxparser.cpp"
    break;

  case 66:
#line 383 "syntax.y"
              {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));
        
        }
#line 2245 "syntaxparser.cpp"
    break;

  case 67:
#line 388 "syntax.y"
                {
        (yyval.node)=add_parsing_node("Exp",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));
        
        }
#line 2255 "syntaxparser.cpp"
    break;

  case 68:
#line 393 "syntax.y"
                           {
          syntaxError+=1;
        }
#line 2263 "syntaxparser.cpp"
    break;

  case 69:
#line 396 "syntax.y"
                      {
          syntaxError+=1;
        }
#line 2271 "syntaxparser.cpp"
    break;

  case 70:
#line 399 "syntax.y"
                     {
          syntaxError+=1;
        }
#line 2279 "syntaxparser.cpp"
    break;

  case 71:
#line 402 "syntax.y"
                        {
          syntaxError+=1;
        }
#line 2287 "syntaxparser.cpp"
    break;

  case 72:
#line 405 "syntax.y"
                       {
          syntaxError+=1;
        }
#line 2295 "syntaxparser.cpp"
    break;

  case 73:
#line 408 "syntax.y"
                        {
          syntaxError+=1;
        }
#line 2303 "syntaxparser.cpp"
    break;

  case 74:
#line 411 "syntax.y"
                       {
          syntaxError+=1;
        }
#line 2311 "syntaxparser.cpp"
    break;

  case 75:
#line 414 "syntax.y"
                      {
          syntaxError+=1;
        }
#line 2319 "syntaxparser.cpp"
    break;

  case 76:
#line 417 "syntax.y"
                       {
          syntaxError+=1;
        }
#line 2327 "syntaxparser.cpp"
    break;

  case 77:
#line 420 "syntax.y"
                    {
          syntaxError+=1;
        }
#line 2335 "syntaxparser.cpp"
    break;

  case 78:
#line 423 "syntax.y"
                  {
          syntaxError+=1;
        }
#line 2343 "syntaxparser.cpp"
    break;

  case 79:
#line 426 "syntax.y"
                             {
          syntaxError+=1;
        }
#line 2351 "syntaxparser.cpp"
    break;

  case 80:
#line 429 "syntax.y"
                        {
          syntaxError+=1;
        }
#line 2359 "syntaxparser.cpp"
    break;

  case 81:
#line 433 "syntax.y"
                   {//实参列表
        (yyval.node)=add_parsing_node("Args",(yyloc).first_line);
        fill_child_node((yyval.node),3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));

}
#line 2369 "syntaxparser.cpp"
    break;

  case 82:
#line 438 "syntax.y"
               {
        (yyval.node)=add_parsing_node("Args",(yyloc).first_line);
        fill_child_node((yyval.node),1,(yyvsp[0].node));

          }
#line 2379 "syntaxparser.cpp"
    break;


#line 2383 "syntaxparser.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }

  yyerror_range[1] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, &yylloc);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, yyerror_range, 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 443 "syntax.y"


int yyerror(char*msg){
  syntaxError+=1;
  printf("Error type B at Line %d: %s.\n",yylineno,msg);
}


struct Node* add_parsing_node(char* Name,int column){
 struct Node* Root=(struct Node*)malloc(sizeof(struct Node));
 Root->child=NULL;
 Root->next_sib=NULL; 
 strcpy(Root->name,Name);
 Root->from=1;
 Root->type=OTHERS;
 Root->column=column;

#ifdef DEBUGBISONNOW
printf("name: %s\tline:%d\n",Name,column);
#endif
return Root;
}

void  fill_child_node(struct Node *parent,int num_args,...){//填充生成树的儿子
va_list able;
va_start(able,num_args);
struct Node * indexnode=NULL;
parent->child=va_arg(able,struct Node*);;
indexnode=parent->child;
for(int i=1;i<num_args;i++){
   indexnode->next_sib=va_arg(able,struct Node*);
   if(indexnode->next_sib!=NULL){
     indexnode=indexnode->next_sib;
   }
}
}

