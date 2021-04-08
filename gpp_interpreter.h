/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    OP_OP = 258,
    OP_CP = 259,
    OP_PLUS = 260,
    OP_MINUS = 261,
    OP_MULT = 262,
    OP_DIV = 263,
    OP_DBLMULT = 264,
    KW_AND = 265,
    KW_OR = 266,
    KW_NOT = 267,
    KW_EQUAL = 268,
    KW_LESS = 269,
    KW_NIL = 270,
    KW_TRUE = 271,
    KW_FALSE = 272,
    KW_SET = 273,
    KW_FOR = 274,
    KW_IF = 275,
    KW_EXIT = 276,
    KW_LIST = 277,
    KW_APPEND = 278,
    KW_CONCAT = 279,
    IDENTIFIER = 280,
    NUMBER = 281
  };
#endif
/* Tokens.  */
#define OP_OP 258
#define OP_CP 259
#define OP_PLUS 260
#define OP_MINUS 261
#define OP_MULT 262
#define OP_DIV 263
#define OP_DBLMULT 264
#define KW_AND 265
#define KW_OR 266
#define KW_NOT 267
#define KW_EQUAL 268
#define KW_LESS 269
#define KW_NIL 270
#define KW_TRUE 271
#define KW_FALSE 272
#define KW_SET 273
#define KW_FOR 274
#define KW_IF 275
#define KW_EXIT 276
#define KW_LIST 277
#define KW_APPEND 278
#define KW_CONCAT 279
#define IDENTIFIER 280
#define NUMBER 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 49 "gpp_interpreter.y" /* yacc.c:1909  */

    int num;
    char id[32];
    int* list_t;

#line 112 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
