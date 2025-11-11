 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej23.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
[0-9A-F]+"H" {
		yylval = atoi(yytext);
    		int result = 0;
    		char c;
    		int valor = 0;
    		for (int i = 0; (c = yytext[i]) != 'H'; i++) {
        		if(c >= '0' && c <= '9') {
        			valor = c - '0';
        		} else {
        			valor = c - 'A' + 10;
        		}
        		result = result * 16 + valor;
    		}
		yylval = result;
		return(NUMBER);
	}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
