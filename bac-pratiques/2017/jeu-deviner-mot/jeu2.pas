uses crt; //clrscr



function verif(m: string): boolean;
var
	i, l: integer;
begin
	l := length(m);
	if (l < 5) or (l > 20) then
		verif := false
	else begin
		i := 1;
		while (i <= l) and (upcase(m[i]) in ['A'..'Z']) do
			i := i + 1;
		verif := (i > l);
	end;
end;

function masquer(m: string): string;
var
	masque: string;
	l, i: integer;
begin
	l := length(m);
	masque := '';
	masque := masque + m[1];	
	for i := 2 to l - 1 do
		masque := masque + '-';
	
	masque:= masque + m[l];
	
	masquer := masque;
end;



procedure deviner(mot, masque: string);
var
	tent, i: integer;
	c: char;
begin
	
	tent := length(mot);
	repeat
		writeln('le mot à deviner est: ', masque);
		writeln('Il vous reste ', tent, ' essai(s)');
		tent := tent - 1;
		
		repeat
			write('proposer un caractère: ');
			readln(c);
		until upcase(c) in ['A'..'Z'];
		
		for i := 2 to length(mot) - 1 do
			if c = mot[i] then masque[i] := c;
	writeln;	
	until (tent = 0) or (mot = masque);
	
	writeln('Le mot à deviner était: ', mot);
	if (tent = 0) and (mot <> masque) then
		writeln('Désolé vous avez perdu :/')
	else
		writeln('Bravo vous avez gagné :)');
end;


//P.P.
var
	mot, masque: string;
begin
	repeat
		write('Saisir le mot à deviner: ');
		readln(mot);
	until verif(mot);
	
	clrscr;
	
	masque := masquer(mot);
	
	deviner(mot, masque);
end.
