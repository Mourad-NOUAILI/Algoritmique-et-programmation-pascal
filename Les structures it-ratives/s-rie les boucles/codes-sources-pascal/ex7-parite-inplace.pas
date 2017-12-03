(*
* Lang: Free Pascal
* Time complexity: O(N²)
* space compexity: O(N)
*)
type
	tab = array[1..20] of integer;
var
	n: integer;
	t: tab;
	i, j, insertPos, v: integer;
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
	
	insertPos := 1;	
	for i := 1 to n do
		if t[i] mod 2 = 0 then begin
			v := t[i];
			for j := i-1 downto insertPos do
				t[j+1] := t[j];
			t[insertPos] := v;
			insertPos := insertPos + 1;
		end;
		
		for i := 1 to n do
			write(t[i], ' ');
	writeln;

end.

