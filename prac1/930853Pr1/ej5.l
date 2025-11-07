 // Autores : Javier Martínez Virto  NIP : 930853 ; Víctor Marteles Martínez NIP : 928927
NIP : 432156 ; Menganito NIP ; 767543
%{
	int 	C = 0, 	//total de caracteres excepto saltos de líneas
	    	L = 0,	//total de líneas
	    	LV = 0, //total de líneas vacías
		V = 0, 	//total de valores
		M = 0, 	//total de caracteres del valor más largo
		D = 0, 	//total de duplas numéricas
		N = 0;	//total de valores sin ningún dígito
%}
%%
[0-9]+:[0-9]+						{D++; V++; C += strlen(yytext);}
[A-Za-z:]|[A-Za-z:][A-Za-z: ]*[A-Za-z:]			{V++; N++; C += strlen(yytext); if(M < strlen(yytext)) {M = strlen(yytext);}}
[A-Za-z0-9:]|[A-Za-z0-9:][A-Za-z0-9: ]*[A-Za-z0-9:]	{V++; C += strlen(yytext); if(M < strlen(yytext)) {M = strlen(yytext);}}
^[ ]+$							{LV++;C += strlen(yytext);}
^\n							{LV++;L++;}
\n							{L++;}
.							{C++;}
%%
int main () {
	int error = yylex();
	if (error == 0) { // si escaner finaliza correctamente
		printf("C: %d\n",C);
		printf("L: %d\n",L);
		printf("LV: %d\n",LV);
		printf("V: %d\n",V);
		printf("M: %d\n",M);
		printf("D: %d\n",D);
		printf("N: %d\n",N);
	}
	return error;
}
