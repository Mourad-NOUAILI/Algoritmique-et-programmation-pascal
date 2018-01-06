(*
* Task: bac-pratique-25052017-sc-s7
	(deviner un mot)
* Lang.: Free Pascal
*)
uses crt;

function verif(m: string): boolean;
var
	i, len: byte;
begin
	len := length(m);
	i := 1;
	while (i <= len) and (upcase(m[i]) in ['A'..'Z']) do
		i := i + 1;
	verif := i > len;
end;

procedure saisir(var m: string);
begin
	repeat
		write('Taper le mot à deviner: ');
		readln(m);
	until (length(m) in [5..20]) and (verif(m));
end;

function masquer(m: string): string;
var
	s: string;
	i, len: byte;
begin
	len := length(m);
	s := '';
	for i := 1 to len do
		s := s + '-';
	s[1] := m[1];
	s[len] := m[len];

	masquer := s;
end;

procedure deviner(m, s: string);
var
	i, len, lettreTrouvees, tent: byte;
	l: char;
begin
	len := length(m);
	tent := 0;
	lettreTrouvees := 2;

	writeln('Essayer de deviner le mot.');
	writeln('Vous avez ', len, ' tentatives.');
	writeln;
	repeat
		tent := tent + 1;
		writeln('Tentative #', tent);
		writeln(chr(9), s);
		repeat
			write(chr(9), 'donner une lettre: ');
			readln(l);
		until upcase(l) in ['A'..'Z'];

		for i := 2 to len-1 do
			if upcase(l) = upcase(m[i]) then begin
				s[i] := l;
				lettreTrouvees += 1;
			end;
		writeln;
	until (tent = len) or (lettreTrouvees = len);

	writeln;
	if (tent = len) and (lettreTrouvees < len) then begin
		writeln('Désolé, vous avez épuisé les ', len, ' tentatives.');
		writeln('Le mot à deviner était: ', m);
	end;

	if (lettreTrouvees = len) and (lettreTrouvees <= len) then
			writeln('Bravo, vous avez trouvé le mot ''',m,''' :)')

end;

var
	mot, masque: string;
begin
	clrscr;
	saisir(mot);
	clrscr;
	masque := masquer(mot);
	deviner(mot, masque);
end.