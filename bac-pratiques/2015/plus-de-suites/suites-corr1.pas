type
	tab = array[1..5] of byte;

procedure saisir (var a: byte ; msg: string);
begin
	repeat
		write(msg);
		readln(a);
	until (a > 9) and (a < 100); 
end;

procedure generSuites(a: byte ; var d,f: tab ; var nbs: byte);
var
	i, s, j: byte;
begin
	nbs := 0;
	for i := 1 to a div 2 do begin
		s := 0;
		j := i;
		while (s < a) do begin
			s := s + j;
			j := j + 1;
		end;
		if s = a then begin
			nbs := nbs + 1;
			d[nbs] := i;
			f[nbs] := j-1;
		end;
	end;
end;

procedure afficher(a: byte ; d,f: tab ; nbs: byte);
var
	i, j: byte;
begin
	
	for i:= 1 to nbs do begin
		write(a, ' = ');
		for j := d[i] to f[i] do
			write(j,'+');
		writeln;
	end;
end;


//MAIN
var
	n, m, nbsN, nbsM: byte;
	dN, fN, dM, fM: tab;
begin
	saisir(n, 'n= ');
	saisir(m, 'm= ');
	generSuites(n, dN, fN, nbsN);
	generSuites(m, dM, fM, nbsM);
	if  nbsN <> 0 then 
		if nbsN > nbsM then afficher(n, dN, FN, nbsN)
		else if  nbsN < nbsM then afficher(M, dM, fM, nbsM)
		else begin
			afficher(n, dN, fN, nbsN);
			afficher(M, dM, fM, nbsM)
		end;
end.

