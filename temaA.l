/* Popa Maria-Catalina 331CC */
%{
	#undef yywrap
	char **ListaFisiere;
	unsigned int FisierCurent = 0;
	unsigned int NumarFisiere;
	
	int countCampuri = 0, countValori = 0, lungimeLinie = 0;
	int pozitieActuala = 0, countSeparator = 0;
	
	char **tabel;
%}

valoareLinie [a-zA-z\t/\.0-9 -:]+ 
valoareCamp [a-zA-z/\.0-9 -:]+

%s VALOARECAMP NUMARELEMENTE

%%

<INITIAL>{valoareLinie} {
				/* se identifica cate o linie si se initializeaza valorile campurilor */
					countCampuri = 0;
					countValori = 0;
					countSeparator = 0;
					lungimeLinie = yyleng;

					tabel = malloc(yyleng + 1);
					
				/* se repozitioneaza cursorul la inceput liniei pentru
					a se numara cate campuri contine linia deja citita */
					yyless(pozitieActuala);
					
					pozitieActuala += yyleng;
				
					BEGIN(NUMARELEMENTE); 
				  }

[\t] {countSeparator ++;}

<NUMARELEMENTE>{valoareCamp} { 
				/* verifica daca s-a parcurs toata linie si se pune campul in variabila tabel */
							 lungimeLinie -= (yyleng + 1);
							 
							 tabel[countCampuri] = malloc(yyleng + 1);

				/* verifica daca cuvantul contine pe ultima posizitie ':' pentru a-l adauga */			 
							 if( yytext[yyleng - 1] == ':')
							 	strcpy(tabel[countCampuri],yytext);
							 else{	
							 		strcpy(tabel[countCampuri], yytext);
							 		strcat(tabel[countCampuri],":");
							 	}
							
							 countCampuri ++;

				/* daca linia are mai mult de 2 campuri si lungimea = 0 atunci se trece 
					la starea care identifica valorile din campuri, 
					altfel se trece la starea INITIAL */

							 if((lungimeLinie - countSeparator) <= 0 && countCampuri < 2){
							 	BEGIN(INITIAL);
							 }
							 else 
							 	if( (lungimeLinie - countSeparator) <= 0 && countCampuri >= 2){
							 		BEGIN(VALOARECAMP);
							 	}
							
							}
							
<VALOARECAMP>{valoareCamp} {	
					/* afisare campuri si valori conform datelor salvate in starea anterioara */
							printf("%-24s", tabel[countValori]);
							printf("%s\n", yytext);
							
							countValori ++;
					/* la terminarea valorilor se trece in starea initiala */
							if(countValori == countCampuri)
								BEGIN(INITIAL);
							}
.
\n
%%

main(int argc, char **argv){
	FILE *fisier; 
	ListaFisiere = argv + 1;
	NumarFisiere = argc - 1;

	FisierCurent = 0;
	
	/* deschide toate fisierele din linia de comanda */	
	while(FisierCurent < NumarFisiere){	

		fisier = fopen(ListaFisiere[FisierCurent], "r");
			
		if (!fisier){ 
			printf("!!!eroare!!!");
			exit(1);
		}
		yyin = fisier;
		
		FisierCurent ++;
		yylex();
		printf("\n");
	}
}