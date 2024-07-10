-- zadanie 1 --



create or replace view asystenci (nazwisko, placa, staz)

as select nazwisko, coalesce(placa_dod, 0) + placa_pod,

case

when extract(day from zatrudniony) = '1' and extract(month from zatrudniony) = '1' then concat('lat: ',extract(year from current_date) - extract(year from zatrudniony), ' miesięcy: 0')

else concat('lat: ',extract(year from current_date) - extract(year from zatrudniony) - 1, ' miesięcy: ', 12 - (extract(month from zatrudniony) - 1))

end

from pracownicy where etat = 'ASYSTENT';



select * from asystenci order by nazwisko;



-- zadanie 2 --



create view place (id_zesp, srednia, minimum, maksimum, fundusz, l_pensji, l_dodatkow)

as

with liczba_dod as

(select id_zesp, count(id_prac) as l_dodatkow

from pracownicy

where placa_dod > 0

group by id_zesp),

liczba_pensji as

(select id_zesp, count(id_prac) as l_pensji

from pracownicy

where placa_pod > 0

group by id_zesp),

reszta as

(select id_zesp, avg(coalesce(placa_dod, 0) + placa_pod) as srednia, min(coalesce(placa_dod, 0) + placa_pod) as minimum, max(coalesce(placa_dod, 0) + placa_pod) as maksimum,

sum(coalesce(placa_dod, 0) + placa_pod) as fundusz

from pracownicy

group by id_zesp)

select d.id_zesp, r.srednia, r.minimum, r.maksimum, r.fundusz, p.l_pensji, d.l_dodatkow

from liczba_dod d join liczba_pensji p on d.id_zesp = p.id_zesp

join reszta r on p.id_zesp = r.id_zesp

order by id_zesp;



-- zadanie 3 --



select p.nazwisko, coalesce(p.placa_dod, 0) + p.placa_pod as placa_razem

from pracownicy p join place p2 on p.id_zesp = p2.id_zesp

where coalesce(p.placa_dod, 0) + p.placa_pod < p2.srednia

order by nazwisko;



-- zadanie 4 --



create view place_minimalne (id_prac, nazwisko, etat, placa_pod)

as select id_prac, nazwisko, etat, placa_pod

from pracownicy

where placa_pod < 700

with check option;



select * from place_minimalne;



-- zadanie 5 --



update place_minimalne

set placa_pod = 800

where nazwisko = 'HAPKE';



-- zadanie 6 --



create or replace view prac_szef (id_prac, id_szefa, pracownik, etat, szef)

as select p.id_prac, p.id_szefa, p.nazwisko, p.etat, (select nazwisko from pracownicy where p.id_prac = id_szefa)

from pracownicy p;



INSERT INTO PRAC_SZEF (ID_PRAC, ID_SZEFA, PRACOWNIK, ETAT)

VALUES (280,150, 'MORZY','ASYSTENT');



UPDATE PRAC_SZEF SET ID_SZEFA = 130 WHERE ID_PRAC = 280;

DELETE FROM PRAC_SZEF WHERE ID_PRAC = 280;





-- zadanie 7 --



create or replace view zarobki (id_prac, id_szefa, nazwisko, etat, placa_pod)

as select id_prac, id_szefa, nazwisko, etat, placa_pod

from pracownicy p

where placa_pod <= (select placa_pod from pracownicy where id_prac = p.id_szefa)

with check option;



UPDATE ZAROBKI SET PLACA_POD = 2000

WHERE NAZWISKO = 'BIALY';



-- zadanie 8 --



SELECT table_name, view_definition

FROM information_schema.views

WHERE table_schema = 'sbd155832';



--zadanie 9 --



SELECT view_definition, check_option,

is_updatable, is_insertable_into

FROM information_schema.views

WHERE table_schema = 'sbd155832' AND table_name = 'prac_szef';