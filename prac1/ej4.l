%%
[0-9]   {int n = atoi(yytext)+1;printf("%d", n);}
\n      {printf("\n\n");}
%%
int main(void) {
	yylex();
    	return 0;
}

