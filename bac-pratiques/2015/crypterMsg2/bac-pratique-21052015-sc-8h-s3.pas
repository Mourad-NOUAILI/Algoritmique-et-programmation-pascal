(*
ÉPREUVE : Bac pratique session 2015
SECTIONS : Sciences expérimentales, Mathématiques et Sciences techniques.
DATE : 21/05/2015
SUJET : #3
LANG.: Free Pascal
*)

const
  MAX_TAILLE = 10000;
type
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

function queDesLettresMiniEtEspaces(msg : texte) : boolean;
var
  indiceCar , tailleMsg : longint;
begin
  tailleMsg := longueur(msg);
  indiceCar := 1;
  while (indiceCar <= tailleMsg) and (msg[indiceCar] in ['a'..'z',' ']) do
    inc(indiceCar);
  queDesLettresMiniEtEspaces := indiceCar > tailleMsg;
end;

function queDesLettresMini(clef : texte) : boolean;
var
  indiceCar , tailleClef : longint;
begin
  tailleClef := longueur(clef);
  indiceCar := 1;
  while (indiceCar <= tailleClef) and (clef[indiceCar] in ['a'..'z']) do
    inc(indiceCar);
  queDesLettresMini := indiceCar > tailleClef;
end;


procedure lireMessageEtClef(var msg,clef : texte);
var
  tailleMsg : longint;
begin
  repeat
    writeln('Donnez le message à crypter : ');
    readln(msg);
    tailleMsg := longueur(msg);
  until (tailleMsg > 0) and (queDesLettresMiniEtEspaces(msg));
    
  repeat
    writeln('Donnez la clef du cryptage : (',tailleMsg,')');
    readln(clef);
  until (longueur(clef) = tailleMsg) and (queDesLettresMini(clef));
end;

function crypter(msg,clef : texte) : texte;
var
  index , tailleMsg : longint;
  msgCrypte : texte;
begin
  tailleMsg := longueur(msg);
  msgCrypte := '';
  for index := 1 to tailleMsg do
    if msg[index] <> ' ' then
      msgCrypte[index] :=  chr(ord( abs(ord(msg[index]) - ord(clef[index])) ) + ord('a'))
    else msgCrypte[index] := ' ';
  crypter := msgCrypte;
end;


(*Programme principal.*)
var
  messageClaire , clef : texte;
begin
  lireMessageEtClef(messageClaire,clef);
  writeln(crypter(messageClaire,clef));
end.
