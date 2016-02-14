Popa Maria-Catalina 331CC

	Tema A

	Pentru citirea din fisier am folosit indicatiile prezentate la curs.
	Regula valoareLinie identifica liniile separate de \n. In starea INITIAL
se preia o linie, se initializeaza toate variabilele folosite si se salveaza
lungimea acesteia. Se repozitioneaza capul de citire la inceputul linie 
folosind functia yyless(), pentru a numara cate campuri sunt prezente pe acea
linie. Se trece la starea NUMARELEMENTE. 
	Regula valoareCamp indentifica campurile separate prin tab pentru a putea
numara cate elemente sunt pe o linie.
	In starea NUMARELEMENTE se intra atata timp cat mai sunt elemente pe
linia citita anterior. Se numara cate nume de campuri sunt si se retin
in variabila tabel. Daca numarul de campuri este mai mic decat 2 si s-a ajuns la 
\n se trece in starea initiala pentru a se parsa urmatoarea linie. Aceasta conditie
se verifica prin retinerea lungimii linie in starea INITIAL si modificarea ei
dupa citirea fiecarui camp, numarandu-se inclusiv cate tab-uri au fost folosite. 
Daca nu mai sunt elemente pe linie dar numarul acestora este mai mare egal decat
2 se trece in starea VALOARECAMP. 
	Starea VALOARECAMP identifica valorile campurilor parsate anterior si le
afiseaza la consola. Cand numarul acestoara este egal cu numarul de campuri
se trece in starea initiala pentru a continua cu parsarea unei alte linii.

	Fisierele BoardingPass3 si BoardingPass4 sunt exemple create.
	Am modificat ultima linie din exemplul 2 dat in enunt deoarece nu corespundea 
cu cerinta. Se dau campurile dar nu se dau si valorile pentru ele.
"ETKT: 2057501127395512			Passport:			Nationality:"

Tema a fost realizata pe platforma Ubuntu 14.04.3 LTS

Copilare si rulare:
	make
	 ./temaA BoardingPass1 BoardingPass2 BoardingPass3 BoardingPass4 
	 