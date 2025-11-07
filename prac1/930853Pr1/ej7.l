 // Autores : Javier Martínez Virto  NIP : 930853 ; Víctor Marteles Martínez NIP : 928927
 
%%
B(R*UR*UR*UR*)*E	{printf("++%s++",yytext);}
B(R*UR*UR*)*E		{printf(":%s:",yytext);}
B(R*UR*UR*)*(R*UR*)E	{printf("-%s-",yytext);}
%%

