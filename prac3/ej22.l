 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej22.l fichero para la practica 3 de Teoria de la Computacion */
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
"b="	{return(BASE);}
";"	{return(PCOMA);}
";b"	{return(PCOMAB);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
