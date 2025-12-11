 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* th.l fichero para la practica 4 de Teoria de la Computacion */
%{
#include<string.h>
#include "y.tab.h"
%}


%%
"graph "[0-9a-zA-Z]+	{return(GRAFO);}
"{"	{return(INI);}
"}"	{return(FIN);}
[0-3][0-3][0-3]	{yylval.nombre=strdup(yytext); return(ESTADO);}
"->"	{return(FLECHA);}
"("	{return(IPAR);}
")"	{return(FPAR);}
","	{return(COMA);}
";"	{return(PCOMA);}
\n	{return(EOL);}
[ \t] 	{} // para ignorar posibles espacios
.	{return(yytext[0]); /* caracter inesperado */}
%%
					//ejemplo de uso de yylval para tokens a los que se
					//les ha cambiado su valor semantico en th.y
 //ALGUNA_EXP_REG		{yylval.nombre=strdup(yytext);return(ALGUN_TOKEN);}
