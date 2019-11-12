%{ 
  #include "y.tab.h"
%}
%%
"#include" {return INC;}
"#define" {return DEF;}
"main()" {return MN;}
"printf" {return PF;}
"scanf" {return SF;}
"int"|"long"|"float"|"double"|"char" {return DT;}
"%d"|"%f"|"%s"|"%l"|"%c" {return FS;}
"for" {return FOR;}
"while" {return WHILE;}
"do" {return DO;}
"if" {return IF;}
"else" {return ELSE;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[0-9]+|[0-9]*\.[0-9]+ {return NUM;}
[\n] {return NL;}
" " {return SP;}
"=="|">="|"<="|">"|"<" {return OP;}
[\t] {;}
"return" {return RET;}
. {return yytext[0];}
%%

