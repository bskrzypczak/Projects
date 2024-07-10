-- zadanie 1 --



create table projekty(

id_projektu integer generated always as identity,

opis_projektu varchar(20),

data_rozpoczecia date default current_date(),

data_zakonczenia date,

fundusz numeric(7,2));

-- zadanie 2 --



insert into projekty (opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz) values

('Indeksy bitmapowe', date '1999-04-02', date '2001-08-31', 25000),

('Sieci kręgosłupowe', default, null, 19000);



-- zadanie 3 --



select id_projektu, opis_projektu from projekty;



-- zadanie 4 --



insert into projekty values

(10, 'Indeksy drzewiaste', date '2013-12-24', date '2014-01-01', 1200);

-- Nie udało się dodać BŁĄD: cannot insert a non-DEFAULT value into column "id_projektu"



insert into projekty (opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz) values

('Indeksy drzewiaste', date '2013-12-24', date '2014-01-01', 1200);

-- zadanie 5 --



update projekty

set fundusz = 10

where opis_projektu = 'Indeksy drzewiaste';



--Nie udało się zmienić BŁĄD: kolumna "id_projektu" nie może być zmodyfikowana do DEFAULT



-- zadanie 6 --



create table projekty_kopia

as select * from projekty;



select * from projekty_kopia;



-- zadanie 7 --



insert into projekty_kopia values

(10, 'Sieci lokalne', current_date, current_date + interval '1' year, 24500);



select * from projekty_kopia;

--Zadziałało ponieważ ograniczenia integralnościowe nie są kopiowane



-- zadanie 8 --



delete from projekty

where opis_projektu = 'Indeksy drzewiaste';



select * from projekty_kopia;



--Nie został automatycznie usunięty



-- zadanie 9 --



select table_name from information_schema.tables

where table_schema = 'sbd155832'

order by table_name;

