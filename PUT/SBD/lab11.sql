-- zadanie 1 --



alter table projekty

add constraint pk_projekty primary key(id_projektu);



alter table projekty

add constraint uk_projekty unique(opis_projektu);



alter table projekty

alter column opis_projektu set not null;





alter table projekty

add constraint check_data

check(data_rozpoczecia < data_zakonczenia);



alter table projekty

add constraint check_fundusz

check (fundusz > 0 or fundusz is null);



SELECT t1.constraint_name, t1.constraint_type, t2.check_clause

FROM information_schema.table_constraints t1 LEFT JOIN

information_schema.check_constraints t2

ON t1.constraint_name = t2.constraint_name

AND t1.constraint_schema = t2.constraint_schema

WHERE table_schema = 'sbd155832' AND table_name = 'projekty'

ORDER BY constraint_name;



-- zadanie 2 --



insert into projekty(opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz) values

('Indeksy bitmapowe', date '2015-04-12', date '2016-09-30', 40000);

--Nie udało się ponieważ dodaliśmy ograniczenie, że pole opis_projekty ma być unikalne



-- zadanie 3 --



create table przydzialy (

id_projektu integer not null,

constraint fk_przydzialy_01 foreign key(id_projektu) references projekty(id_projektu),

nr_pracownika numeric(6) not null,

constraint fk_przydzialy_02 foreign key(nr_pracownika) references pracownicy(id_prac),

przydzial_od date default current_date,

przydzial_do date constraint chk_przydzialy_daty check(przydzial_od < przydzial_do),

stawka numeric(7,2) constraint chk_przydzialy_stawka check(stawka > 0),

rola varchar(20) constraint chk_przydzialy_rola check (rola in ('KIERUJĄCY', 'ANALITYK', 'PROGRAMISTA')),

constraint pk_przydzialy primary key(id_projektu, nr_pracownika));

-- zadanie 4 --



insert into przydzialy

values

(

(select id_projektu from projekty where opis_projektu = 'Indeksy bitmapowe'), 170, date '1999-04-10', date '1999-05-10', 1000, 'KIERUJĄCY'

),

(

(select id_projektu from projekty where opis_projektu = 'Indeksy bitmapowe'), 140, date '2000-12-01', NULL, 1500, 'ANALITYK'

),

(

(select id_projektu from projekty where opis_projektu = 'Sieci kręgosłupowe'), 140, date '2015-09-14', NULL, 2500, 'KIERUJĄCY'

);



select * from przydzialy;



-- zadanie 5 --



alter table przydzialy

add godziny numeric(4) not null;



--BŁĄD: column "godziny" of relation "przydzialy" contains null values



-- zadanie 6 --



alter table przydzialy

add godziny numeric(4);



update przydzialy

set godziny = 1000;



alter table przydzialy

alter column godziny set not null;



-- zadanie 11 --



alter table projekty

alter column opis_projektu type varchar(10);

-- BŁĄD: wartość zbyt długa dla typu znakowego zmiennego (10)

--Istniejace opisy w tabeli sa za dlugie



-- zadanie 12 --



delete from projekty

where opis_projektu = 'Sieci kręgosłupowe';

--BŁĄD: modyfikacja lub usunięcie na tabeli "projekty" narusza klucz obcy "fk_przydzialy_01" tabeli "przydzialy"

--Tabela przydzialy ma klucz obcy zwiazany z opis_projektu z tabeli projekty wiec nie mozna usunac



-- zadanie 13 --



alter table przydzialy

drop constraint fk_przydzialy_01;



alter table przydzialy

add constraint fk_przydzialy_01 foreign key(id_projektu) references projekty(id_projektu)

on delete cascade;



delete from projekty

where opis_projektu = 'Sieci kręgosłupowe';



select * from projekty;

select * from przydzialy;



-- zadanie 14 --



SELECT t1.constraint_name, t1.constraint_type, t2.check_clause

FROM information_schema.table_constraints t1 LEFT JOIN

information_schema.check_constraints t2

ON t1.constraint_name = t2.constraint_name

AND t1.constraint_schema = t2.constraint_schema

WHERE table_schema = 'sbd155832' AND table_name = 'przydzialy'

ORDER BY constraint_name;



-- zadanie 15 --



drop table projekty cascade;



SELECT t1.constraint_name, t1.constraint_type, t2.check_clause

FROM information_schema.table_constraints t1 LEFT JOIN

information_schema.check_constraints t2

ON t1.constraint_name = t2.constraint_name

AND t1.constraint_schema = t2.constraint_schema

WHERE table_schema = 'sbd155832' AND table_name = 'przydzialy'

ORDER BY constraint_name;



--Zniknely klucze obce zwiazane z tabelą projekty



-- zadanie 16 --



drop table przydzialy;

drop table projekty_kopia;



SELECT table_name

FROM information_schema.tables

WHERE table_schema = 'sbd155832'

ORDER BY table_name;