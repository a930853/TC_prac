%{
#include<string.h>
#include "y.tab.h"
%}



%%
"graph ".*$	{return(GRAFO);}
"{"	{return(INI);}
"}"	{return(FIN);}
[0-3][0-3][0-3]	{return(ESTADO);}
" ->"	{return(FLECHA);}
"("	{return(IPAR);}
")"	{return(FPAR);}
","	{return(COMA);}
";"	{return(PCOMA);}
\n	{return(EOL);}
.	{return(yytext[0]); /* caracter inesperado */}

%%
					//ejemplo de uso de yylval para tokens a los que se
					//les ha cambiado su valor semantico en th.y
 //ALGUNA_EXP_REG		{yylval.nombre=strdup(yytext);return(ALGUN_TOKEN);}
