-- ZADANIE 1 --

SELECT MIN(placa_pod) AS MINIMUM, MAX(placa_pod) AS MAKSIMUM,
MAX(placa_pod) - MIN(placa_pod) AS RÓŻNICA
FROM PRACOWNICY;

-- ZADANIE 2 --

SELECT etat, AVG(placa_pod) AS SREDNIA
FROM PRACOWNICY
GROUP BY etat ORDER by SREDNIA DESC;

-- ZADANIE 3 --

SELECT COUNT(id_prac) AS PROFESOROWIE
FROM PRACOWNICY
WHERE etat = 'PROFESOR';

-- ZADANIE 4 --

SELECT id_zesp, SUM(placa_pod + COALESCE(placa_dod, 0)) AS SUMARYCZNE_PLACE
FROM PRACOWNICY
GROUP BY id_zesp ORDER BY id_zesp;

-- ZADANIE 5 --

SELECT MAX(MAKS_SUM_PLACA)
from(select SUM(placa_pod + COALESCE(placa_dod, 0)) AS MAKS_SUM_PLACA
from PRACOWNICY
GROUP BY id_zesp);

-- ZADANIE 6 --

select id_szefa, min(placa_pod) as minimalna
from pracownicy
where id_szefa notnull
group by id_szefa
order by minimalna desc;

-- ZADANIE 7 --

select id_zesp, COUNT(*) as ile_pracuje
from pracownicy
group by id_zesp
order by ile_pracuje desc;

-- ZADANIE 8 --

select id_zesp, COUNT(*) as ile_pracuje
from pracownicy
group by id_zesp having COUNT(*) >= 3
order by ile_pracuje desc;

-- ZADANIE 9 --

select id_prac
from pracownicy
group by id_prac having COUNT(*) > 1;

-- ZADANIE 10 --

select etat, AVG(placa_pod) as srednia, COUNT(*) as liczba
from pracownicy
where EXTRACT(YEAR FROM zatrudniony) <= 1990
group by etat
order by etat;

-- ZADANIE 11 --

select id_zesp, etat, round(AVG(coalesce(placa_dod, 0) + placa_pod), 0) as srednia, round(max(coalesce(placa_dod, 0) + placa_pod)) as maksymalna
from pracownicy
where etat in('ASYSTENT', 'PROFESOR')
group by id_zesp, etat;

-- ZADANIE 12 --

select EXTRACT(YEAR FROM zatrudniony) as ROK, count(*) as ilu_pracownikow
from pracownicy
group by rok
order by rok;

-- ZADANIE 13 --

select length(nazwisko) as "Ile liter", count(*) as "W ilu nazwiskach"
from pracownicy
group by "Ile liter"
order by "Ile liter";

-- ZADANIE 14 --

select count(*) as "Ile nazwisk z A"
from pracownicy
where POSITION('A' in upper(nazwisko)) > 0
group by ();

-- ZADANIE 15 --

select count(case
when POSITION('A' in upper(nazwisko)) > 0 then 'z a'
end) as "Ile nazwisk z A", count(case
when POSITION('E' in upper(nazwisko)) > 0 then 'z e'
end) as "Ile nazwisk z E"
from pracownicy;

-- ZADANIE 16 --

select id_zesp, SUM(placa_pod) as suma_plac,
string_agg(nazwisko || ':' || placa_pod, ';' order by nazwisko) as pracownicy
from pracownicy
group by id_zesp order by id_zesp;

