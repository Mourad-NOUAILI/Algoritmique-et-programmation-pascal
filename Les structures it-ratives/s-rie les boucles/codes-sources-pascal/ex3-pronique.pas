(*
* Task: Exercice #3
* Lang: Free Pascal
* *)

var
	n, x, cnt: longint;
	rep: char;
begin
	cnt := 0;
	for n := 1 to 1000000000 do begin
		x := trunc((-1 + sqrt(1+4*n)) / 2);
		if n = x * (x+1) then begin
			cnt := cnt + 1;
			writeln(n);
			if cnt mod 10 = 0 then begin
				repeat
					write('Continuer (O/N): ');
					readln(rep);
				until (upcase(rep) = 'O') or (upcase(rep) = 'N');
				if upcase(rep) = 'N' then break;
			end;
		end;
	end;
end.
