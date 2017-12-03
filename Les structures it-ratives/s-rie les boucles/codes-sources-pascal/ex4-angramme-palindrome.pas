type
	tab = array['a'..'z'] of integer;
var
	m: string;
	i, somme: integer;
	c: char;
	occ: tab; // Il n'est pas obligatoire d'initaliser le tableau occ à 0
			  // Parce qye Free Pascal le fait par défaut.
	
begin
	//Le mot m doit contenir que des lettres minuscules.
	repeat
		write('donner un mot: ');
		readln(m);
		
		i := 1;
		while (i <= length(m)) and (m[i] in ['a'..'z']) do
			i := i + 1;
	until i > length(m);
	
	//Calcul du nombre d'occurence de chaque lettre de m.
	for i := 1 to length(m) do
		occ[m[i]] := occ[m[i]] + 1;
	
	//Calcul de la somme.
	somme := 0;
	for c := 'a' to 'z' do
		somme += occ[c] mod 2;
	
	//Vérifier s'il existe une anagramme palindrome.
	if somme < 2 then writeln('OUI')
	else writeln('NO');
end.
