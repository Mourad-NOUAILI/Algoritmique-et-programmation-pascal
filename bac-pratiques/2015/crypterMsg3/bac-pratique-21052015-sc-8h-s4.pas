(*
ÉPREUVE : Bac pratique session 2015
SECTIONS : Sciences expérimentales, Mathématiques et Sciences techniques.
DATE : 21/05/2015
SUJET : #4
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

function queDesLettresEtEspaces(msg : texte) : boolean;
var
  indiceCar , tailleMsg : longint;
begin
  tailleMsg := longueur(msg);
  indiceCar := 1;
  while (indiceCar <= tailleMsg) and (upcase(msg[indiceCar]) in ['A'..'Z',' ']) do
    inc(indiceCar);
  queDesLettresEtEspaces := indiceCar > tailleMsg;
end;

procedure lireMessage(var msg : texte);
begin
  repeat
    writeln('Donnez le message à crypter : ');
    readln(msg);
  until (longueur(msg) > 0) and (queDesLettresEtEspaces(msg));
end;

procedure crypter(msg : texte);

  function sommeAscii(x : longint) : longint;
  var
    r  : longint;
  begin
    repeat
    
      r := 0;
      while x <> 0 do
      begin
	r := r + x mod 10;
	x := x div 10;
      end;
      x := r;
    until r in [1..9];
    sommeAscii := r;
  end;
  
var
  index , tailleMsg , somAscii , ordreLettre : longint;
  msgCrypte : texte;
  estMinus : boolean;
  caractere : char;

begin
  tailleMsg := longueur(msg);
  msgCrypte := '';
  randomize;
  for index := 1 to tailleMsg do
  begin
    caractere := msg[index];
   if caractere <> ' ' then
   begin
     estMinus := caractere in ['a'..'z'];
     if estMinus then caractere := upcase(caractere);
     ordreLettre := ord(sommeAscii(ord(caractere)) + random(18)) - 1 + ord('A');
     if estMinus then ordreLettre := ordreLettre - ord('A') + ord('a');
     write(chr(ordreLettre));
   end
   else write(caractere);
  end;
  writeln;
end;


(*Programme principal.*)
var
  messageClaire  : texte;
begin
  lireMessage(messageClaire);
  crypter(messageClaire);
end.
