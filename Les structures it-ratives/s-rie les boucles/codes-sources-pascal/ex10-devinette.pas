(*
* Programme interactif.
* Lang: Free Pascal.
*)
var
	n, x, nbTent: byte;
begin
	randomize;
	n := random(11)+50;
	
	writeln('---------------------------');
	writeln('--------Devinette----------');
	writeln('---------------------------');
	writeln('J''ai choisi un nombre entre 50 et 60.');
	writeln('Essayez de le deviner');
	writeln('Vous avez trois tentatives.');
	writeln;
	
	nbTent := 0;
	repeat
		nbTent := nbTent + 1;
		write(chr(9)+'Tentative #', nbTent,': Taper un nombre: ');
		read(x);
	until (n = x) or (nbTent >= 3);
	
	writeln;
	
	if n = x then
		writeln('Bravo :)');
	if (n <> x) then 
		writeln('Désolé :/, le numéro à deviner était: ', n,'.');
end.
