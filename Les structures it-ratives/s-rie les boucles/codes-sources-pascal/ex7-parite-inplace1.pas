(*
* Lang: Free Pascal
* Time complexity: O(N)
* space compexity: O(N)
*)
type
	tab = array[1..20] of integer;
var
	n: integer;
	t: tab;
	i, j, tmp: integer;
begin
	repeat
		write('n = ');
		read(n);
	until (n >= 2) and (n <= 20);
	
	randomize;
	for i := 1 to n do
		t[i] := random(550-55+1)+55;
	
	for i := 1 to n do
		write(t[i], ' ');
	writeln;
	
	j := 0;	
	for i := 1 to n do
		if t[i] mod 2 = 0 then begin
			j := j + 1;
			tmp := t[i];
			t[i] := t[j];
			t[j] := tmp;
		end;
		
		for i := 1 to n do
			write(t[i], ' ');
	writeln;

end.


