(*
* Task: Bac pratique 2017/9h:30-10h:30 (deviner) 
* Lang.: Free Pascal
*)

uses crt;
type
	str8 = string[8];
	
function verif(msg : string): boolean;
var
  i: byte;
begin
	i := 1;
	while (i <= 8) and (msg[i] in ['0'..'9']) do
		i := i + 1;
	verif := i > 8;

end;

procedure lireNumero(var num: str8);
begin
	repeat
		write('Saisir le numéro à deviner: ');
		readln(num);
	until verif(num);
end;


//Time complexity: O(64)
procedure deviner(num: str8);
var
	essais, i: byte;
	numProp, numCourant: str8;
begin
	essais := 8;
	numCourant := '--------';
	repeat
		if essais = 8 then writeln('Vous avez ', essais,' essais.')
		else  writeln('Il vous reste ', essais,' essais.');
		
		write('Proposer un numéro de téléphone: ');
		readln(numProp);
		for i := 1 to 8 do
			if numProp[i] = num[i] then numCourant[i] := num[i]
			else if pos(numProp[i], num) > 0 then
				writeln(numProp[i], ' qui est à la position ', i, ' dans la propostion n''est pas à sa bonne position.');
		essais := essais - 1;
		writeln(numCourant);
		writeln;
	until (essais = 0) or (numProp = num);
	if numProp = num then writeln('Bravo vous avez gagné :)')
	else writeln('Désolé, vous avez perdu :(');
end;

var
	num: str8;
begin
	lireNumero(num);
	clrscr;
	deviner(num);
end.
