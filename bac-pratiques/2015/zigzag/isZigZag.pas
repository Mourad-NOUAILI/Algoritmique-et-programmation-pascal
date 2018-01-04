(*
 TASK : Bac TP 2015 (nombres ZigZag)
 LANG : Free Pascal
*)
uses crt; //readkey
type
	arrOfNumbers = array of longword;

//Lire le nombre des nombres.
procedure readLengthArray(var n : byte);
begin
	repeat
		write('N = ');
		readln(n);
	until n in [2..25];
end;

//Remplir le tableau par des nombres.
procedure fillArray(var numbers : arrOfNumbers ; n : byte);
var i : byte;
begin
	setlength(numbers , n);
	writeln('Donner les nombres (sur une seule ligne sépar',chr(130),'s par un espace) : ');
	for i := 1 to n do
		repeat
			read(numbers[i]);
		until numbers[i] > 99;
end;

//Vérifier sur un nombre est zigzag ou pas.
//Dans le pire des cas : O(nombre-de-chiffres-du-nombre)
//Dans le meilleur des cas : O(1)
function isZigzag(number : longword) : boolean;
var i , len : byte;
	sign : shortint;
	numberStr : string;
begin
	str(number,numberStr);
	sign := ord(numberStr[1]) - ord(numberStr[2]);
	
	i := 2;
	len := length(numberStr);
	while (i < len) and (sign * (ord(numberStr[i]) - ord(numberStr[i+1])) < 0) do begin
		inc(i);
		sign := -sign;
	end;
	isZigzag := i = len;
end;


//Afficher les nombres zigzag
procedure displayAllZigZagNumbers(numbers : arrOfNumbers);
var i , lenArr : byte;
begin
	writeln;
	writeln('Les nombres ZigZag sont : ');
	lenArr := length(numbers);
	for i:= 1 to lenArr do
	 if isZigzag(numbers[i]) then writeln(numbers[i]);
	writeln;
end;

//Programme principal.
var n : byte;
	numbers : arrOfNumbers;
begin
	readLengthArray(n);
	fillArray(numbers,n);
	displayAllZigZagNumbers(numbers);
	writeln('Appuyer sur une touche pour continuer...');
	readkey;
end.
