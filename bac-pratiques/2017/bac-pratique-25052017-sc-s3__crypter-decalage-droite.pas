(*
* Task: Examen pratique en informatique. bac-pratique-25052017-sc-s3
* 		Crypter un message par décalge vers la droite de 
* 		p position. (cryptage de césar)
* Lang: Free Pascal.
* 
* Exemple:
* message clair:  Examen Pratique En Informatique
* message crypté: Ibeqir Tvexmuyi Ir Mrjsvqexmuyi
*)


function verif (m: string): boolean;
var
	i, len: integer;
begin
	len := length(m);
	if len = 0 then verif := false
	else begin
		i := 1;
		while (i <= len) and (upcase(m[i]) in ['A'..'Z', ' ']) do
			i := i + 1;
		verif := i > len;
	end;
end;

procedure saisir(var m: string);
begin
	repeat
		writeln('donner le message à crypter: ');
		readln(m);
	until verif (m);
end;

function nbMots (m: string): integer;
var
	d, f, len, n: integer;
begin
	d := 1;
	f := 1;
	len := length(m);
	n := 0;
	while  f <= len do begin
		while upcase(m[f]) in ['A'..'Z'] do
			f := f + 1;
		
		if  length(copy(m, d, f - d)) <> 0 then n := n + 1;

		
		while not (upcase(m[f]) in ['A'..'Z']) do
			f := f + 1;
		
		d := f;
	end;
	
	nbMots := n;
end;

function crypter(m: string ; p: integer): string;
var
	i, len, rang: integer;
	mc: string;
	c, cc: char;
	estMaj: boolean;
begin
	len := length(m);
	mc := '';
	for i := 1 to len do begin
		c := m[i];
		if c <> ' ' then begin
			//Savoir si la lettre est majuscule on non.
			estMaj := c in ['A'..'Z'];
			
			//Si la letter est majuscule, la convertir en minuscule.
			if estMaj then c := chr(ord(c) - ord('A') + ord('a'));
			
			//Il s'agit d'un cryptage par décalage vers la droite,
			// si p = 4, 'x' devient 'b', ...
			
			//Donc, une méthode est de trouver le rang de
			//la lettre dans l'alphabet. 
			rang := ord(c) - ord('a');
			
			//cc est la variable pour stocker la lettre c 
			//cryptée.
			//Ajouter p au rang, prendre le reste de la
			//division eulidienne par 26, pour obtenir le 
			//rang de la lettre cryptée. Ajouter le code ASCII de 'a'
			//pour avoir le code ASCII de la lettre cryptée.
			cc := chr( (rang + p) mod 26 + ord('a') );
			
			//si la lettre dans c est majuscule, convertir la
			//lettre cryptée dans cc en majuscule aussi.
			if estMaj then cc := upcase(cc);
			
			//ajouter la lettre cryptée à la fin de la chaîne cryptée.
			mc := mc +  cc
		end
		else mc := mc + c;
	end;
	
	crypter := mc;
end;

var
	m: string;
	p: integer;

begin
	saisir(m);
	p := nbMots(m);
	writeln(crypter(m, p));
end.







