(*
* task: bac-pratique-19052016-sc-s10
* lang: Free Pascal
*)

type
	tab = array[1..9] of string;

procedure saisir(var n: integer);
begin
	repeat
		write('donner le nombre d''utilisateurs: ');
		readln(n);
	until (n>= 1) and (n <= 9);
end;

procedure remplir(var t: tab ; n: integer);
var i, j: integer;
begin
	for i := 1 to n do begin
		repeat
			write('Donner l''utilisateur n°',i,': ');
			readln(t[i]);
			j := 0;
			repeat
				j := j + 1;
			until not (t[i][j] in ['A'..'Z']) or (j = length(t[i]));
		until  (t[i][j] in ['A'..'Z']) and (length(t[i]) <= 20);
	end;
end;

procedure afficher(var t: tab ; n: integer);
var i: integer;
begin
	for i := 1 to n do
		write(t[i],' ');
	writeln;
end;

procedure generer(var tm: tab ; t: tab ; n:integer);
var i, j, v: integer;
vc: string;
begin
	for i := 1 to n do begin
		v := 0;
		for j := 1 to length(t[i]) do begin
			if t[i][j] = 'A' then insert('@', tm[i], j)
			else if t[i][j] = 'O' then insert('0', tm[i], j)
			else insert(t[i][j], tm[i], j);
			
			if t[i][j] in ['A','U','I','Y','O','E'] then v := v + 1;
		end;
		str(v, vc);
		tm[i] := tm[i] + vc;
	end;
end;

//MAIN
var
	t, tm: tab;
	n: integer;
begin
	saisir(n);
	remplir(t, n);
	afficher(t, n);
	generer(tm, t, n);
	afficher(tm, n);
end.























