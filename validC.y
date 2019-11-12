%{
#include<stdio.h>
#include<stdlib.h>
%}
%token INC DEF MN PF SF DT FS FOR WHILE DO IF ELSE ID NUM RET NL SP OP
%%
prog:stmt{printf("It is a valid c program\n");
		exit(0);
	}
	;

stmt:inc def main
	;
inc:INC OP ID'.'ID OP NL inc
	|	
	;
def:DEF SP ID SP NUM
	|
	;
main:MN NL '{'NL inmain ret'}'
	;


inmain:dec pf sf if_else for while do_while;
dec:DT SP var ';' NL dec
	|
	;
var:ID var
	|','ID var
	|ID'['NUM']' var
	|
	;
pf:PF'(''"'stmt'"'')'';'NL pf
	|
	;
sf:SF'(''"'fs'"'','stmt')'';'NL sf
	|
	;
fs:FS fs
	|','FS fs
	|
	;
stmt:ID stmt
	|FS stmt
	|','stmt
	|'&'stmt
	|SP stmt
	|'{'NL stmt'}'NL stmt
	|sf pf
	|';'NL stmt
	;
if_else:IF'('cond')' NL if_else
	|'{'NL stmt '}'NL if_else
	|ELSE NL '{'NL stmt'}'NL if_else
	|
	;
cond:opd OP opd
	;
opd:NUM
	|ID
	;
for:FOR'('ID'='NUM';'cond';'equ')'NL stmt for
	|
	;
equ:ID'+''+'
	|ID'-''-'
	|'+''+'ID
	|'-''-'ID
	;
while:WHILE'('cond')'NL stmt while
	|
	;
do_while:DO'{'NL stmt'}'WHILE'('cond')'';'NL
	|
	;
ret:RET SP NUM';'NL
	|	
	;
%%
int yyerror(char *msg)
{
printf("Invalid \n");
exit(0);
}
int main()
{
printf("Enter the C program\n");
yyparse();
}
