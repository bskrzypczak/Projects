-- ZADANIE 1 --

select nazwisko, etat, z.id_zesp, nazwa
from pracownicy p, zespoly z
where p.id_zesp = z.id_zesp
order by nazwisko;

-- ZADANIE 2 --

select nazwisko, etat, p.id_zesp, nazwa
from pracownicy p, zespoly z
where p.id_zesp = z.id_zesp and adres = 'PIOTROWO 3A'
order by nazwisko;

-- ZADANIE 3 --

select nazwisko, p.etat, placa_pod, placa_min, placa_max
from pracownicy p, etaty e
where p.etat = e.nazwa
order by etat, nazwisko;

-- ZADANIE 4 --

select nazwisko, p.etat, placa_pod, placa_min, placa_max,
case
when placa_pod between placa_min and placa_max then 'OK'
else 'NIE'
end as czy_ok
from pracownicy p, etaty e
where p.etat = e.nazwa
order by etat, nazwisko;

-- ZADANIE 5 --

select nazwisko, p.etat, placa_pod, placa_min, placa_max,
case
when placa_pod between placa_min and placa_max then 'OK'
else 'NIE'
end as czy_ok
from pracownicy p, etaty e
where p.etat = e.nazwa and not (placa_pod between placa_min and placa_max)
order by etat, nazwisko;

-- ZADANIE 6 --

select nazwisko, placa_pod, p.etat, e.nazwa as kat_plac, placa_min, placa_max
from pracownicy p, etaty e
where placa_pod between placa_min and placa_max
order by nazwisko, kat_plac;

-- ZADANIE 7 --

select nazwisko, placa_pod, p.etat, e.nazwa as kat_plac, placa_min
from pracownicy p, etaty e
where placa_pod between placa_min and placa_max and e.nazwa = 'SEKRETARKA'
order by nazwisko, kat_plac;

-- ZADANIE 8 --

select p.nazwisko as pracownik, p.id_prac as id_prac, s.nazwisko as szef, s.id_prac as id_szefa
from pracownicy p, pracownicy s
where p.id_szefa = s.id_prac
order by p.nazwisko;

-- ZADANIE 9 --

select p.nazwisko as pracownik, p.zatrudniony as prac_zatrudniony, p2.nazwisko as szef, p2.zatrudniony as szef_zatrudniony,
extract(year from p.zatrudniony) - extract(year from p2.zatrudniony) as lata
from pracownicy p, pracownicy p2
where p.id_szefa = p2.id_prac and extract(year from p.zatrudniony) - extract(year from p2.zatrudniony) <= 10
order by p.zatrudniony, p.nazwisko;

-- ZADANIE 10 --

select z.nazwa, count(*) as liczba, round(avg(placa_pod), 1) as srednia_placa
from zespoly z, pracownicy p
where p.id_zesp = z.id_zesp
group by z.nazwa
order by z.nazwa;

-- ZADANIE 11 --

select z.nazwa,
case
when count(*) between 1 and 2 then 'maly'
when count(*) between 3 and 6 then 'sredni'
when count(*) >= 7 then 'duzy'
end as etykieta
from zespoly z, pracownicy p
where p.id_zesp = z.id_zesp
group by z.nazwa
order by z.nazwa; 
