type
	tab = array[1..20] of word;
	tabs = array[1..20] of string;

procedure saisir(var n: byte);
begin
	repeat
		write('Donner la taille du tableau: ');
		read(n);
	until (n >= 3) and (n <= 20);
end;

procedure remplir(var t: tab ; n: byte);
var
	i: byte;
begin
	for i := 1 to n do
		repeat
			write('entier #', i, ': ');
			read(t[i]);
		until t[i] > 0;
end;

procedure afficher(t: tab; n: byte);
var
	ts: tabs;
	i, j, ns, ncp: byte;
	s, tmps: string;
begin
	i := 1;
	j := 1;
	ncp := 0;
	ns := 0;
	s := '';
	while i <= n do begin
		j := i;
		while (j <= n) and (t[j] mod 2 = 0) do begin
			ncp := ncp + 1;
			str(t[j], tmps);
			s := s + tmps + ', ';
			j := j + 1;
		end;
		
		if ncp > 1 then begin
			i := j;
			ns := ns + 1;
			delete(s, length(s)-1, 2);
			ts[ns] := s;
		end
		else
			i := i + 1;

		s := '';
		ncp := 0;
	end;

	if ns > 0 then begin
		writeln('Le nombre des séquences pairs est: ', ns);
		writeln('Les séquences d''entiers pairs sont: ');
		for i := 1 to ns do 
			writeln(ts[i]);
		writeln;
	end;

end;

/////Porgramme principale/////////
var
	t: tab;
	n: byte;
begin
	saisir(n);
	remplir(t, n);
	afficher(t, n);
end.