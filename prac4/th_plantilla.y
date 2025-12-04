%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern int yylex();
extern int yyerror();

#define PALOS 3
#define DIM 27 //DIMENSION DE LA MATRIZ DE ADYACENCIA
#define BUFF 4000

//declarar la variable listaTr de tipo ListaTransiciones
//Almacena las transiciones de un solo nodo (nodoOrig) 
//a varios nodos (nodosFin y sus correspondientes etiquetas)
struct ListaTransiciones {
	char* nodoOrig;
	char* nodosFin[DIM];
	char* etiquetas[DIM]; 
	int total;
} listaTr;

//tabla de adyacencia
char* tablaTr[DIM][DIM];

//inicializa una tabla cuadrada DIM x DIM con la cadena vacia
void iniTabla(char* tabla[DIM][DIM]) {
	for (int i = 0; i < DIM; i++) {
		for (int j = 0; j < DIM; j++) {
			tabla[i][j] = "";
		}
	}
}

/*
 * Calcula la multiplicacion simbolica de matrices 
 * cuadradas DIM x DIM: res = t1*t2
 *
 * CUIDADO: res DEBE SER UNA TABLA DISTINTA A t1 y t2
 * Por ejemplo, NO SE DEBE USAR en la forma:
 *           multiplicar(pot, t, pot); //mal
 */
void multiplicar(char* t1[DIM][DIM], char* t2[DIM][DIM], char* res[DIM][DIM]) {
	for (int i = 0; i < DIM; i++) {
		for (int j = 0; j < DIM; j++) {
			res[i][j] = (char*) calloc(BUFF, sizeof(char));
			for (int k = 0; k < DIM; k++) {
				if (strcmp(t1[i][k],"")!=0 && strcmp(t2[k][j],"") != 0) {
					strcat(strcat(res[i][j],t1[i][k]),"-");
					strcat(res[i][j],t2[k][j]);
				}
			}
		}
	}
}


/* 
 *Copia la tabla orig en la tabla copia
*/
void copiar(char* orig[DIM][DIM], char* copia[DIM][DIM]) {
	for (int i = 0; i < DIM; i++) {
		for (int j = 0; j < DIM; j++) {
			copia[i][j] = strdup(orig[i][j]);
		}
	}
}


// Función que convierte un nodo tipo "210" en un índice numérico en base 3 (PALOS)
int convertirNodo(const char* nodo) {
    int valor = 0;
    for (int i = 0; nodo[i] != '\0'; i++) {
        valor = valor * PALOS + (nodo[i] - '0'); // suma en base PALOS
    }
    return valor;
}


int fila;
int col;

%}

  //nuevo tipo de dato para yylval, convierte yylval (antes un int, a un char) (polimorfismo)
%union{
	char* nombre;
}


%token INI FIN COMA PCOMA IPAR FPAR FLECHA GRAFO EOL
%start grafo

%token<nombre> ESTADO //lista de tokens y variables que su valor semantico,
                     //recogido mediante yylval, es 'nombre' (ver union anterior).
					 //Para estos tokens, yylval será de tipo char* en lugar de int.

%%

grafo : GRAFO EOL INI EOL origen FIN EOL
	;
	
origen : ESTADO FLECHA transiciones PCOMA EOL {
		listaTr.nodoOrig = $1; // ESTADO origen ($1)
	
		fila = convertirNodo(listaTr.nodoOrig);
		for(int i=0; i<listaTr.total;i++) {
			col = convertirNodo(listaTr.nodosFin[i]); // ESTADO destino/fin
			tablaTr[fila][col] = listaTr.etiquetas[i]; // transición de fila -> col
		}
		// reiniciamos la lista temporal para el siguiente nodo
		listaTr.total = 0;
	}
	| origen ESTADO FLECHA transiciones PCOMA EOL {
		listaTr.nodoOrig = $2; // ESTADO origen ($2)
	
		fila = convertirNodo(listaTr.nodoOrig);
		for(int i=0; i<listaTr.total;i++) {
			col = convertirNodo(listaTr.nodosFin[i]); // ESTADO destino/fin
			tablaTr[fila][col] = listaTr.etiquetas[i]; // transición de fila -> col
		}
		// reiniciamos la lista temporal para el siguiente nodo
		listaTr.total = 0;
	}
	;
		
transiciones : ESTADO IPAR ESTADO FPAR {
		listaTr.nodosFin[listaTr.total] = $1; // ESTADO destino/fin
		listaTr.etiquetas[listaTr.total] = $3; // etiqueta del arco	
		listaTr.total++;	
	}
	| ESTADO IPAR ESTADO FPAR COMA transiciones {
		listaTr.nodosFin[listaTr.total] = $1; // ESTADO destino/fin
		listaTr.etiquetas[listaTr.total] = $3; // etiqueta del arco	
		listaTr.total++;
	}
	;
%%

int yyerror(char* s) {
	printf("%s\n",s);
	return -1;
}

int main() {
	//inicializar lista transiciones
	listaTr.total = 0;

	//inicializar tabla de adyacencia
	iniTabla(tablaTr);

	//nodo inicial
	char* estadoIni = "000";

	//nodo final
	char* estadoFin = "212";
	
	int error = yyparse();

	
	if (error == 0) {
		//matriz para guardar la potencia
		char* pot[DIM][DIM];
		copiar(tablaTr,pot);
		//calcular movimientos de estadoIni a estadoFin
		//calculando las potencias sucesivas de tablaTr
		//...
		//...


		printf("Nodo inicial  : %s\n", estadoIni);
		//rellenar los ... con los indices adecuados a vuestro codigo
		//printf("Movimientos   : %s\n", pot[...][...]);
		printf("Nodo final    : %s\n", estadoFin);
	}

	return error;
}
