 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej24.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token PCOMA PCOMAH
%%

calclist : /* nada */
	| calclist exp PCOMA EOL { printf("=%d\n", $2); }
	| calclist exp PCOMAH EOL { printf("=%X\n", $2); }
	;
exp : 	factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER 
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

