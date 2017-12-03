(*
* Lang.: Free Pascal
* Time complexity: O(n)
*)

var
	n, u0, un, i: longint;
begin
	repeat
		write('N = ');
		read(n);
	until n >= 0;
	
	u0 := 1;
	for i := 1 to n do begin
		un := 2 * u0 + 1;
		u0 := un;
	end;
	
	writeln('U(', n, ') = ', u0);
end.
