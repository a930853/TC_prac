 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej3.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
extern int yylex();
extern int yyerror();
%}
%token X Y Z EOL
%start inicio
%%

inicio : /* nada */
	| inicio s EOL
	;
s :	/* nada */
	| c X s
	;
b :	X c Y Z Y 
	| X c
	;
c :	X b X
	| Z
	;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}
