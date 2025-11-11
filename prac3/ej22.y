 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej22.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
int b = 10;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token BASE
%token PCOMA PCOMAB
%%

calclist : /* nada */
	| calclist exp PCOMA EOL { printf("=%d\n", $2); }
	| calclist BASE NUMBER EOL { 
		if($4 >= 2 && $4 <= 10) {	
			b = $4;
		} else {
			yyerror("syntax error");
        		YYERROR;
		}
				}
	| calclist exp PCOMAB EOL {
		int ini = $2;
		int fin = 0;
		int factor = 1;
		while(ini != 0) {
			fin += (ini % b) * factor;
			ini /= b;
			factor *= 10;
		}
	printf("=%d\n",fin);
	}
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

