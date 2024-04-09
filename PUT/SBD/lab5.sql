-- ZADANIE 1 --

INSERT INTO pracownicy(id_prac, nazwisko)
VALUES ((SELECT max(id_prac) + 1 FROM pracownicy), 'WOLNY');

select nazwisko, p.id_zesp, nazwa
from PRACOWNICY p LEFT OUTER JOIN zespoly z
on z.id_zesp = p.id_zesp
order by nazwisko;

-- ZADANIE 2 --

select nazwa, z.id_zesp, coalesce(nazwisko, 'brak pracownikow') as pracownik
from pracownicy p right outer join zespoly z
on z.id_zesp = p.id_zesp
order by nazwa, pracownik;

-- ZADANIE 3 --

select coalesce(nazwa, 'brak zespolu') as zespol, coalesce(nazwisko, 'brak pracownikow') as pracownik
from pracownicy p full outer join zespoly z
on z.id_zesp = p.id_zesp
order by nazwa, nazwisko;

DELETE FROM pracownicy
WHERE nazwisko = 'WOLNY';

-- ZADANIE 4 --

select nazwa, count(id_prac) as liczba, sum(placa_pod) as suma_plac
from pracownicy p right outer join zespoly z
on z.id_zesp = p.id_zesp
group by nazwa
order by nazwa;


-- ZADANIE 5 --

select nazwa
from pracownicy p right outer join zespoly z
on z.id_zesp = p.id_zesp
group by nazwa
having count(p.id_prac) = 0;

-- ZADANIE 6 --

select p.nazwisko as pracownik, p.id_prac, s.nazwisko as szef, s.id_prac as id_szefa
from pracownicy p left outer join pracownicy s
on p.id_szefa = s.id_prac
order by pracownik;

-- ZADANIE 7 --

select p.nazwisko as pracownik, count(s.id_prac) as liczba_podwladnych
from pracownicy p left outer join pracownicy s
on p.id_prac = s.id_szefa
group by p.nazwisko
order by pracownik;

-- ZADANIE 8 --

select p.nazwisko, p.etat, p.placa_pod, z.nazwa, s.nazwisko as szef
from pracownicy p
left outer join zespoly z on p.id_zesp = z.id_zesp
left outer join pracownicy s on p.id_szefa = s.id_prac
order by p.nazwisko;

-- ZADANIE 9 --

select nazwisko, nazwa
from pracownicy cross join zespoly
order by nazwisko, nazwa;

-- ZADANIE 10 --

select count(*)
from pracownicy p, zespoly z, etaty e;

-- ZADANIE 11 --

select etat from pracownicy
where extract(year from zatrudniony) = 1992
intersect
select etat from pracownicy
where extract(year from zatrudniony) = 1993
order by etat;

-- ZADANIE 12 --

select id_zesp
from zespoly
except
select z.id_zesp
from pracownicy p join zespoly z 
on p.id_zesp = z.id_zesp 
group by z.id_zesp
having count(p.id_prac) > 0;

-- ZADANIE 13 --

select id_zesp, nazwa
from zespoly
except
select z.id_zesp, z.nazwa 
from pracownicy p join zespoly z 
on p.id_zesp = z.id_zesp 
group by z.id_zesp, z.nazwa
having count(p.id_prac) > 0;

-- ZADANIE 14 --

select nazwisko, placa_pod, 'Ponizej 480' as prog from pracownicy where placa_pod < 480
UNION
select nazwisko, placa_pod, 'Dokladnie 480' as prog from pracownicy where placa_pod = 480
UNION
select nazwisko, placa_pod, 'Powyzej 480' as prog from pracownicy where placa_pod > 480