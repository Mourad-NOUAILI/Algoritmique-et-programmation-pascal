const
	eps = 1e-6;
var
	i, sommePred, sommeCourant: real;
begin
	i := 1;
	sommeCourant := 0;
	sommePred:= 0;
	repeat
		sommePred := sommeCourant;
		sommeCourant := sommeCourant + 1 / sqr(i);
		writeln(sqrt(6 * sommeCourant):0:10);
		i := i + 1;
	until abs(sqrt(6 * sommeCourant) - sqrt(6 * sommePred)) <= eps;
end.
