
procedure unitParf(var a, b: byte);
begin
	repeat
		write('a = ');
		read(a);
		write('b = ');
		read(b);
	until (a >= 2) and (b <= 100) and (b >= a);
end;


function test_primalite(p, k: byte): boolean;
begin
	while p <> k do
		if p > k then 
			p := p - k
		else
			k := k - p;
			
	test_primalite := p = 1;
end;

procedure afficher(a, b: byte);
var 
	n, d, s: byte;
begin
	for n := a to b do begin
		s := 0;
		for d := 1 to n div 2 do
			if n mod d = 0 then
				if test_primalite(d, n div d) then s := s + d;
		
		if s = n then write(n, ' ');
	end;
end;

//P.P.
var
	a, b: byte;
BEGIN
	unitParf(a,b);
	afficher(a, b);
END.
