(*
* Lang.: Free Pascal
* Time complexity: O(sqrt(b))
*)

var
	i, a, b, ans: longint;
begin
	repeat
		write('(a, b) = ');
		read(a, b);
	until (a >= 1) and (b <= 1000000000) and ( a <= b);
	
	i := 1;
	ans := 0;
	
	while sqr(i) <= b do begin
		if sqr(i) >= a then
			ans := ans + 1;
		i := i + 1;
	end;
	
	writeln(ans);
end.
