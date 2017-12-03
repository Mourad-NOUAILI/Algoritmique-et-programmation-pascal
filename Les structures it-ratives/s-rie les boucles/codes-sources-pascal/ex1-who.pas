var
	n, u, d, c, m: integer;
begin
	for n := 1000 to 9999 do begin
		u := n mod 10;
		d := n div 10 mod 10;
		c := n mod 1000 div 100;
		m := n div 1000;
		
		if (u <> m) and (d <> c) then
			if (u * 1000 + d * 100 + c * 10 + m) mod n = 0 then
				writeln(n);
	end;
end.
