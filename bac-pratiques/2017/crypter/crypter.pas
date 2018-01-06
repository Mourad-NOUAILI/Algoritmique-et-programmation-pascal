(*
* Task: Bac pratique 2017/11h-12h (deviner) 
* Lang.: Free Pascal
*)


function verif(msg : string) : boolean;
var
  len, i: byte;
begin
	len := length(msg);
	if len > 0 then begin
		if len mod 2 <> 0 then verif := false
		else begin
			i := 1;
			while (i <= len) and (msg[i] in ['A'..'Z', ' ']) do
				i := i + 1;
			verif := i > len;
		end;
	end
	else verif := false;
end;
procedure saisir(var msg: string);
begin
	repeat
		writeln('Donner une chaine: ');
		readln(msg);
	until verif(msg);
end;

//Time complexity: O(length(msg) / 2)
function crypter(msg: string): string;
var
	msgCryp: string;
	len, x1, x2, y1, y2, i: byte;
	lc1, lc2: char;
begin
	len := length(msg);
	msgCryp := '';
	i := 1;
	while i < len do begin
		x1 := ord(msg[i])-ord('A');
		x2 := ord(msg[i+1])-ord('A');
		
		if msg[i] = ' ' then x1 := 26;
		if msg[i+1] = ' ' then x2 := 26;

		y1 := (11 * x1 + 3 * x2) mod 27;
		y2 := (7 * x1 + 4 * x2) mod 27;

		lc1 := chr(ord('A')+y1);
		lc2 := chr(ord('A')+y2);
		
		if y1 = 26 then lc1 := ' ';
		if y2 = 26 then lc2 := ' ';
		
		msgCryp := concat(msgCryp, lc1, lc2); 
		
		i := i + 2;
	end;
	crypter := msgCryp;
end;

var
	msg: string;
begin
	saisir(msg);
	writeln(crypter(msg));
end.
