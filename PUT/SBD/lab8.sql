-- zadanie 1 --


select nazwisko, placa_pod from pracownicy
order by placa_pod desc
fetch first 3 rows with ties;

-- zadanie 2 --

select nazwisko, placa_pod from pracownicy
order by placa_pod desc
offset 5 rows
fetch next 5 rows with ties;

-- zadanie 3 --

with srednie(id_zesp, srednia) as
(select id_zesp, avg(placa_pod) as srednia
from pracownicy
group by id_zesp),
pracownicy2 as
(select p.nazwisko, p.placa_pod, p.placa_pod - s.srednia as roznica
from pracownicy p join srednie s on p.id_zesp = s.id_zesp)
select * from pracownicy2
where roznica > 0
order by nazwisko;


-- zadanie 4 --


with daty(id_prac, rok) as
(select id_prac, extract(year from zatrudniony) as rok
from pracownicy),
lata(rok, liczba) as
(select rok, count(id_prac)
from daty
group by rok)
select * from lata
order by liczba desc;


-- zadanie 5 --


with daty(id_prac, rok) as
(select id_prac, extract(year from zatrudniony) as rok
from pracownicy),
lata(rok, liczba) as
(select rok, count(id_prac)
from daty
group by rok)
select * from lata
order by liczba desc
fetch first 1 row with ties;


-- zadanie 6 --


with asystenci(nazwisko, etat, id_zesp) as
(select nazwisko, etat, id_zesp from pracownicy
where etat = 'ASYSTENT'),
piotrowo(nazwa, adres, id_zesp) as
(select nazwa, adres, id_zesp from zespoly
where adres LIKE 'PIOTROWO%')
select a.nazwisko, a.etat, p.nazwa, p.adres
from asystenci a join piotrowo p on a.id_zesp = p.id_zesp;


-- zadanie 7 --


with suma_plac(id_zesp, maks_suma_plac) as
(select id_zesp, sum(placa_pod) from pracownicy
group by id_zesp)
select z.nazwa, s.maks_suma_plac
from zespoly z join suma_plac s on z.id_zesp = s.id_zesp
order by s.maks_suma_plac desc
fetch first 1 rows with ties;

-- zadanie 8 --

with recursive
podwladni(id_prac, id_szefa, nazwisko, pozycja_w_hierarchi) as
(select id_prac, id_szefa, nazwisko, 1
from pracownicy
where nazwisko = 'BRZEZINSKI'
union all
select p.id_prac, p.id_szefa, p.nazwisko, pozycja_w_hierarchi+1
from podwladni s join pracownicy p on s.id_prac = p.id_szefa)
search depth first by nazwisko set porzadek
select nazwisko, pozycja_w_hierarchi
from podwladni
order by porzadek;


-- zadanie 9 --


with recursive

podwladni(id_prac, id_szefa, nazwisko, pozycja_w_hierarchii) as
(select id_prac, id_szefa, nazwisko, 1
from pracownicy
where nazwisko = 'BRZEZINSKI'
union all
select p.id_prac, p.id_szefa, p.nazwisko, pozycja_w_hierarchii+1
from podwladni s join pracownicy p on s.id_prac = p.id_szefa)
search depth first by nazwisko set porzadek
select lpad(nazwisko, length(nazwisko) + pozycja_w_hierarchii - 1, ' ') as nazwisko, pozycja_w_hierarchii
from podwladni
order by porzadek;

-- zadanie 10 --

WITH
cyfry(cyfra, slowo) as
    (values
        (0, 'zero'), (1, 'jeden'), (2, 'dwa'), (3, 'trzy'),
        (4, 'cztery'), (5, 'piec'), (6, 'szesc'), (7, 'siedem'),
        (8, 'osiem'), (9, 'dziewiec')),
stawki(nazwisko, kwota) as
    (select nazwisko, floor((placa_pod + coalesce(placa_dod, 0))/1000) as kwota
     from pracownicy)
select s.nazwisko || ', zarobki w tysiacach: ' || c.slowo as zarobki
from stawki s join cyfry c on s.kwota = c.cyfra
order by s.nazwisko;