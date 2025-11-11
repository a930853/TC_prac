 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej21.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
extern int b;
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
"b="	{return(BASE);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
[0-9]+"b" {
		yylval = atoi(yytext);
    		int result = 0;
    		int factor = 1;
    		while (yylval != 0) {
        		result += (yylval % 10) * factor;
        		yylval /= 10;
        		factor *= b;
    		}
		yylval = result;
		return(NUMBER);
	}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
