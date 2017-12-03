var
	n, x, d: integer;
begin
	repeat
		write('n = ');
		read(n);
	until n > 2;
	
	for x := 2 to n do begin
		
		d := 1;
		repeat
			d := d + 1;
		until (d > x div 2) or (x mod d = 0);
		
		if d > x div 2 then 
			write(x,' ');
	end;
end.
