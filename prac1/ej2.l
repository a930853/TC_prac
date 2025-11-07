%{
	int contador = 0;
%}
%%
@hotmail.com	{contador++;printf(yytext);}
%%
int main () {
	int error = yylex ();
	if (error == 0) { // si escaner finaliza correctamente
		printf("Total de usuarios: %d\n",contador);
	}
	return error;
}
