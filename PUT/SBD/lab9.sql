-- zadanie 1 --



insert into pracownicy (id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, placa_dod, id_zesp)

values (250, 'KOWALSKI', 'ASYSTENT', null, DATE '2015-01-13', 1500, null, 10),

(260, 'ADAMSKI', 'ASYSTENT', null, DATE '2014-09-10', 1500, null, 10),

(270, 'NOWAK', 'ADIUNKT', null, DATE '1990-05-01', 2050, 540, 20);



select * from pracownicy

where id_prac in(250, 260, 270);



-- zadanie 2 --



update pracownicy

set placa_pod = placa_pod*1.1,

placa_dod = coalesce(placa_dod*1.2, 100)

where id_prac in (250, 260, 270);



select * from pracownicy

where id_prac in(250, 260, 270);



-- zadanie 3 --



insert into zespoly

values(60, 'BAZY DANYCH', 'PIOTROWO 2');



select * from zespoly

where id_zesp = 60;



-- zadanie 4 --



update pracownicy

set id_zesp = (

select id_zesp

from zespoly where nazwa like 'BAZY DANYCH')

where id_prac in (250, 260, 270);



select * from pracownicy

where id_prac in (250, 260, 270);



-- zadanie 5 --



update pracownicy

set id_szefa = (

select id_prac

from pracownicy

where nazwisko = 'MORZY')

where id_zesp = 60;



select * from pracownicy

where id_szefa = (

select id_prac

from pracownicy

where nazwisko = 'MORZY');



-- zadanie 6 --



delete from zespoly

where nazwa = 'BAZY DANYCH';

-- Nie można usunąć ponieważ w tabeli pracownicy znajdują sie rekordy z kluczem obcym

-- id_zesp = 60



-- zadanie 7 --



delete from pracownicy

where id_zesp = (

select id_zesp

from zespoly

where nazwa = 'BAZY DANYCH');



delete from zespoly

where nazwa = 'BAZY DANYCH';



select * from pracownicy;

select * from zespoly;

-- Zostaly usunięte



-- zadanie 8 --



with zespoly_srednia as

(select id_zesp, round(avg(placa_pod), 2) as srednia

from pracownicy

group by id_zesp)

select nazwisko, placa_pod, 0.1 * srednia as podwyzka

from pracownicy p join zespoly_srednia z on p.id_zesp = z.id_zesp

order by nazwisko;



-- zadanie 9 --



update pracownicy p1

set placa_pod = placa_pod + 0.1 * (

select avg(placa_pod) from pracownicy p

group by id_zesp

having p.id_zesp = p1.id_zesp);





select nazwisko, placa_pod from pracownicy

order by nazwisko;



-- zadanie 10 --



select * from pracownicy

where placa_pod = (

select min(placa_pod) from pracownicy);



-- zadanie 11 --



update pracownicy

set placa_pod = (

select round(avg(placa_pod), 2)

from pracownicy)

where placa_pod = (

select min(placa_pod) from pracownicy);



select * from pracownicy;



-- zadanie 12 --



update pracownicy

set placa_dod = (

select avg(placa_pod) from pracownicy

where id_szefa = (

select id_prac from pracownicy

where nazwisko = 'MORZY'))

where id_zesp = 20;



select * from pracownicy;



-- zadanie 13 --



update pracownicy p

set placa_pod = placa_pod * 1.25

from (select id_zesp from zespoly

where nazwa = 'SYSTEMY ROZPROSZONE') z

where p.id_zesp = z.id_zesp;



select * from pracownicy;



-- zadanie 14 --



delete from pracownicy p

using (select id_prac

from pracownicy

where nazwisko = 'MORZY') sz

where p.id_szefa = sz.id_prac;



-- zadanie 15 --



select * from pracownicy;



-- zadanie 16 --



create sequence prac_seq start with 300 increment by 10;



-- zadanie 17 --



insert into pracownicy(id_prac, nazwisko, etat, placa_pod)

values(nextval('prac_seq'), 'Trąbczyński', 'STAZYSTA', 1000);



-- zadanie 18 --



update pracownicy

set placa_dod = currval('prac_seq')

where nazwisko = 'Trąbczyński';



-- zadanie 19 --



delete from pracownicy

where nazwisko = 'Trąbczyński';



-- zadanie 20 --



create sequence mala_seq maxvalue 10;

select nextval('mala_seq');



--Błąd "osiągnięto maksymalny rozmiar sekwencji"



-- zadanie 21 --



drop sequence mala_seq;

