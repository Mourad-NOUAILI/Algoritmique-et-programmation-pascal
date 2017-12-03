var
	i, n: longint;
begin
	n := 1;
	for i := 1 to 9 do begin
		writeln(n,' * 8 + ', i, ' = ', n * 8 + i);
		n := n * 10 + (i+1);
	end;
end.
