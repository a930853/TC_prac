 //Autores : Javier Martínez Virto  NIP : 930853 ; Víctor Marteles Martínez NIP : 928927
 
%x COMENTBARRAS
%x COMENTASTERISK
%x UPS
%x PARAM_1
%x PARAM_2
%{
#include <string.h>
#include <stdlib.h>

//variables

int ApareceUps = 0;
char* p1,*p2;
%}
%%

 /*reglas comentarios*/
 
"//"	{
	printf(yytext);
	ApareceUps = 0;
	BEGIN COMENTBARRAS;}

"/*" {
	printf(yytext);
	ApareceUps = 0;
	BEGIN COMENTASTERISK;}
	
<COMENTBARRAS,COMENTASTERISK>[a-zA-Z0-9]+ {
	if(strcmp("ups",yytext) == 0){ 
		ApareceUps = 1;  
	} 
	printf(yytext);}
										
<COMENTBARRAS>\n {
	if(ApareceUps){
		printf("NO ACTUALIZADO");
	}
	printf(yytext);
	BEGIN INITIAL;}

<COMENTASTERISK>"*/" {
	if(ApareceUps){
		printf("NO ACTUALIZADO");
	}
	printf(yytext);
	BEGIN INITIAL;}

<COMENTBARRAS,COMENTASTERISK>.|\n	{
	printf(yytext);}
	
 /*reglas ups*/
 
[a-zA-Z0-9]+ {
	printf(yytext);
	if(strcmp("ups",yytext) == 0){ 
		//printf(" [aqui entro en ups] ");
		BEGIN UPS; 
	}}

<UPS>\(,* {
	printf("(");
	//printf(" [aqui salgo de ups hacia param1] ");
	BEGIN PARAM_1;}
<UPS>[ ]*	{
	printf(yytext);}
	
<UPS>[^ (]* {
	printf(yytext);
	//printf(" [aqui salgo de ups hacia initial] ");
	BEGIN INITIAL;}
	
<PARAM_1>[^),]*\n*[^),]* {
	p1 = strdup(yytext);}

<PARAM_1>\) { /* Caso ups(a1*) */
	if (p1 == NULL) {printf(")", p1);}
    	else {printf("%s)", p1);}
    	free(p1); p1 = NULL; /* Liberar y reiniciar */
    	//printf(" [aqui salgo a initial] ");
    	BEGIN INITIAL;}
	
<PARAM_1>,+ {
	//printf(" [aqui entro en PARAM2] ");
	BEGIN PARAM_2;}

<PARAM_2>[^,)]*\n*[^),]* {
	p2 = strdup(yytext);}

<PARAM_2>,*\) {
	if(p1 == NULL){
		printf("%s)",p2);
	} else if(p2 == NULL){
		printf("%s)",p1);
	} else { printf("%s,%s)",p2,p1);}
	free(p1); p1 = NULL;
    	free(p2); p2 = NULL;
    	//printf(" [aqui salgo a initial] ");
	BEGIN INITIAL;
	}
	
<PARAM_2>,+ {
	printf("%s,%s,",p1,p2);
	free(p1); p1 = NULL;
    	free(p2); p2 = NULL;
    	//printf(" [aqui salgo a initial] ");
	BEGIN INITIAL;}
	
 /*Reglas INITIAL*/
 
. 	{
	printf(yytext);}
	
%%

