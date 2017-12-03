(*
* Lang: Free Pascal
* Time complexity: O(N)
* space compexity: O(2N)
*)

type
	tab = array[1..20] of integer;
var
	n, i, ip, ii: integer;
	t1, t2: tab;
begin
	repeat
		write('n = ');
		read(n);
	until (n >= 2) and (n <= 20);
	
	randomize;
	for i := 1 to n do
		t1[i] := random(550-55+1)+55;
	
	for i := 1 to n do
		write(t1[i], ' ');
	writeln;
	
	ip := 1;
	ii := n;

	for i := 1 to n do
		if t1[i] mod 2 = 0 then begin
			t2[ip] := t1[i];			
			ip := ip + 1;
		end
		else begin
			t2[ii] := t1[i];		
			ii := ii - 1;
		end;
		
		t1 := t2; //Free Pascal
		for i := 1 to n do
			write(t1[i], ' ');
	writeln;

end.
