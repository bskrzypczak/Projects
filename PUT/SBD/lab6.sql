-- zadanie 1 --

select nazwisko, etat, id_zesp
from pracownicy
where id_zesp in
(select id_zesp
from pracownicy
where nazwisko = 'BRZEZINSKI')
order by nazwisko;

-- zadanie 2 --

select p.nazwisko, p.etat, z.nazwa
from pracownicy p, zespoly z
where p.id_zesp = z.id_zesp and p.id_zesp in
(select id_zesp
from pracownicy
where nazwisko = 'BRZEZINSKI')
order by nazwisko;

-- zadanie 3 --

INSERT INTO pracownicy(id_prac, nazwisko, etat, zatrudniony)
VALUES ((SELECT max(id_prac) + 1 FROM pracownicy),
'WOLNY', 'ASYSTENT', DATE '1968-07-01');

select nazwisko, etat, zatrudniony
from pracownicy
where etat = 'PROFESOR'
and zatrudniony =
(select min(zatrudniony)
from pracownicy
where etat = 'PROFESOR');

-- zadanie 4 --

select nazwisko, zatrudniony, id_zesp
from pracownicy
where(zatrudniony, id_zesp) in
(select max(zatrudniony), id_zesp
from pracownicy
group by id_zesp)
order by zatrudniony;

-- zadanie 5 --

select id_zesp, nazwa, adres
from zespoly
where id_zesp in
(select z.id_zesp
from zespoly z left outer join pracownicy p
on z.id_zesp = p.id_zesp
group by z.id_zesp
having count(p.id_prac) = 0);

DELETE FROM pracownicy
WHERE nazwisko = 'WOLNY';

-- zadanie 6 --

select nazwisko
from pracownicy
where etat = 'PROFESOR'
and id_prac not in
(select id_szefa
from pracownicy
where etat = 'STAZYSTA');

-- zadanie 7 --

select id_zesp, sum(placa_pod) as suma_plac
from pracownicy
group by id_zesp
having sum(placa_pod) =
(select max(suma_plac)
from(select sum(placa_pod) as suma_plac
from pracownicy
group by id_zesp));

-- zadanie 8 --

select z.nazwa, sum(p.placa_pod) as suma_plac
from pracownicy p inner join zespoly z
on p.id_zesp = z.id_zesp
group by z.nazwa
having sum(placa_pod) =
(select max(suma_plac)
from(select sum(placa_pod) as suma_plac
from pracownicy
group by id_zesp));

-- zadanie 9 --

select z.nazwa, count(p.id_prac) as ilu_pracownikow
from zespoly z left outer join pracownicy p
on z.id_zesp = p.id_zesp
group by z.nazwa
having count(p.id_prac) > 
(select count(p.id_prac) as ilu_pracownikow
from zespoly z left outer join pracownicy p
on z.id_zesp = p.id_zesp
group by z.nazwa
having z.nazwa = 'ADMINISTRACJA');

-- zadanie 10 --

select etat from pracownicy
group by etat
having count(id_prac) >= all
(select count(id_prac)
from pracownicy
group by etat)
order by etat;

-- zadanie 11 --

select etat, listagg(nazwisko, ',') within group (order by nazwisko) as pracownicy 
from pracownicy
group by etat
having count(id_prac) >= all
(select count(id_prac)
from pracownicy
group by etat)
order by etat;

-- zadanie 12 --

select p.nazwisko as pracownik, s.nazwisko as szef
from pracownicy p join pracownicy s
on p.id_szefa = s.id_prac
where s.placa_pod - p.placa_pod <= all
(select (s.placa_pod - p.placa_pod) as roznica
from pracownicy p join pracownicy s
on p.id_szefa = s.id_prac);