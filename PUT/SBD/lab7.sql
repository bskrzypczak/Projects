-- zadanie 1--



select z.id_zesp, z.nazwa, z.adres

from zespoly z

where not exists(

select p.id_zesp

from pracownicy p

where p.id_zesp = z.id_zesp);

-- zadanie 2 --



select p.nazwisko, p.placa_pod, p.etat

from pracownicy p

where p.placa_pod > (

select avg(p2.placa_pod)

from pracownicy p2

group by p2.etat

having p.etat = p2.etat)

order by placa_pod desc;



-- zadanie 3 --



select p.nazwisko, p.placa_pod

from pracownicy p

where p.placa_pod > (

select 0.75 * s.placa_pod

from pracownicy s

where s.id_prac = p.id_szefa)

order by nazwisko;



-- zadanie 4 --



select p.nazwisko

from pracownicy p

where p.etat = 'PROFESOR' and not exists (

select s.nazwisko

from pracownicy s

where s.etat = 'STAZYSTA' and p.id_prac = s.id_szefa);

-- zadanie 5 --



select z.nazwa, suma2 as maks_suma_plac

from ((select id_zesp ,sum(placa_pod) as suma2 from pracownicy p group by id_zesp )

join (select max(suma)as suma3 from (select sum(placa_pod) as suma from pracownicy p2 group by id_zesp))

on suma2=suma3) as j join zespoly z on j.id_zesp=z.id_zesp;



-- zadanie 6 --



select nazwisko, placa_pod from pracownicy p

where 3 > (select count(*) from pracownicy p2 where p2.placa_pod>p.placa_pod)

order by placa_pod desc;



-- zadanie 7 --



select p.nazwisko, p.placa_pod, (select p.placa_pod - avg(s.placa_pod)

from pracownicy s

group by s.id_zesp

having p.id_zesp = s.id_zesp) as roznica

from pracownicy p

order by nazwisko;



select p.nazwisko, p.placa_pod, p.placa_pod - srednia as roznica

from (select id_zesp, avg(placa_pod) as srednia

from pracownicy

group by id_zesp)p1

join pracownicy p on p1.id_zesp = p.id_zesp

order by nazwisko;



-- zadanie 8 --



select p.nazwisko, p.placa_pod, (select p.placa_pod - avg(s.placa_pod)

from pracownicy s

group by s.id_zesp

having p.id_zesp = s.id_zesp) as roznica

from pracownicy p

where p.placa_pod > (

select avg(z.placa_pod)

from pracownicy z

where z.id_zesp = p.id_zesp)

order by nazwisko;



select p.nazwisko, p.placa_pod, p.placa_pod - srednia as roznica

from (select id_zesp, avg(placa_pod) as srednia

from pracownicy

group by id_zesp)p1

join pracownicy p on p1.id_zesp = p.id_zesp

and p.placa_pod > p1.srednia

order by nazwisko;



-- zadanie 9 --



select p1.nazwisko, (select count(p.id_prac)

from pracownicy p

group by p.id_szefa

having p1.id_prac = p.id_szefa) as podwladni

from pracownicy p1 join zespoly z on p1.id_zesp = z.id_zesp

where p1.etat = 'PROFESOR' and adres like 'PIOTROWO%';



-- zadanie 10 --



select z.nazwa, p1.srednia_w_zespole, round(p2.srednia_ogolna, 2),

case

when p1.srednia_w_zespole < p2.srednia_ogolna then ':('

when p1.srednia_w_zespole >= p2.srednia_ogolna then ':)'

else '???'

end as nastroj

from zespoly z

left join (

select id_zesp, AVG(placa_pod) AS srednia_w_zespole

from pracownicy

group by id_zesp) p1 on z.id_zesp = p1.id_zesp

cross join (

select AVG(placa_pod) as srednia_ogolna

from pracownicy) p2

order by z.nazwa;



-- zadanie 11 --



select *

from etaty e

order by(select count(id_prac)

from pracownicy p

group by etat

having e.nazwa = p.etat) desc, nazwa;