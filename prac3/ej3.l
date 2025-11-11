 //Autores : Víctor Marteles Martínez NIP : 928927 ; Javier Martínez Virto NIP : 930853
/* ej3.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
%}
%%
"x" {return(X);}
"y" {return(Y);}
"z" {return(Z);}

\n {return(EOL);}
[ \t] {/* ignorar espacios */}
. {return(yytext[0]); /* caracter inesperado */}
%%
