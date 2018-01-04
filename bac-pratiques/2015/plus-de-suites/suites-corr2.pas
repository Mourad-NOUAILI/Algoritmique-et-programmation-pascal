type
	tab = array[1..5] of byte;

procedure saisir (var a: byte ; msg: string);
begin
	repeat
		write(msg);
		readln(a);
	until (a > 9) and (a < 100); 
end;

procedure generSuites(n: byte ; var d,f: tab ; var nbs: byte);
var
	x: byte;
    y, delta: real;
	
begin
	nbs := 0;
	for x := 0 to n div 2 + 1  do begin
		delta := 1 + 4 * (sqr(x)+x+2*n);
		y := (-1+  sqrt(delta)) / 2;
		 if frac(y) = 0.0 then begin
			nbs := nbs + 1;
			d[nbs] := x + 1;
			f[nbs] := trunc(y);
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

