(*
ÉPREUVE : Bac pratique session 2015
DATE : 21/05/2015
SUJET : #1
LANG.: Free Pascal
*)

const
  MAX_TAILLE = 10000;
  p = 17;
  q = 19;
  e = 5;
  
type
  tableauOrdres = array[1..MAX_TAILLE] of longint;
  texte = array[1..MAX_TAILLE] of char;

function longueur(msg : texte) : longint;
var
  iCar : longint;
begin
  iCar := 1;
  while msg[iCar] <> chr(0) do
    inc(iCar);
  longueur := iCar-1;
end;

function queDesLettres(msg : texte) : boolean;
var
  indiceCar , tailleMsg : longint;
begin
  tailleMsg := longueur(msg);
  indiceCar := 1;
  while (indiceCar <= tailleMsg) and (upcase(msg[indiceCar]) in ['A'..'Z']) do
    inc(indiceCar);
  queDesLettres := indiceCar > tailleMsg;
end;

procedure lireMessage(var msg : texte);
begin
  repeat
    writeln('Donnez le message à crypter : ');
    readln(msg);
  until (longueur(msg) > 0) and (queDesLettres(msg));
end;

procedure remplirTableau(msg : texte ; var t : tableauOrdres ; var tailleMsg : longint);
var
  iCar : longint;
begin
  tailleMsg := longueur(msg);
  for iCar := 1 to tailleMsg do
    t[iCar] := ord(upcase(msg[iCar])) - ord('A') + 1;
end;

procedure coder(var t : tableauOrdres ; n : longint);
var
  index : longint;
begin
  for index := 1 to n do
    t[index] := trunc(exp(e*ln(t[index]))) mod (p*q);
end;

procedure afficheTableau(t : tableauOrdres ; n : longint) ;
var
  index : longint;
begin
  for index := 1 to n do
    write(t[index],' ');
  writeln;
end;

(*Programme principal.*)
var
  messageClaire : texte;
  ordres : tableauOrdres;
  nb : longint; 
begin
  lireMessage(messageClaire);
  remplirTableau(messageClaire,ordres,nb);
  coder(ordres,nb);
  afficheTableau(ordres,nb);
end.
