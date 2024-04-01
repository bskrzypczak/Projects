-- ZADANIE 1 --

SELECT nazwisko, SUBSTR(etat, 1, 2)||id_prac AS kod
FROM PRACOWNICY;

-- ZADANIE 2 --

SELECT nazwisko, TRANSLATE(nazwisko, 'KLM', 'XXX') AS wojna_literom
FROM PRACOWNICY;

-- ZADANIE 3 --

SELECT nazwisko FROM pracownicy
WHERE (INSTR(nazwisko, 'L', 1, 1) < LENGTH(nazwisko) / 2) AND INSTR(nazwisko, 'L', 1, 1) > 0;

-- ZADANIE 4 --

SELECT nazwisko, ROUND(placa_pod * 1.15, 0) AS podwyzka
FROM PRACOWNICY;

-- ZADANIE 5 --

SELECT nazwisko, placa_pod, placa_pod * 0.2 AS inwestycja,
ROUND(POWER(1.1, 10) * placa_pod * 0.2, 6) AS kapital,
ROUND(POWER(1.1, 10) * placa_pod * 0.2, 6) - placa_pod * 0.2 AS zysk
FROM PRACOWNICY;

-- ZADANIE 6 --

SELECT nazwisko, zatrudniony, EXTRACT(YEAR FROM (DATE '2000-01-01' - zatrudniony) YEAR TO MONTH) AS staz_w_2000
FROM pracownicy;

-- ZADANIE 7 --

SELECT nazwisko, TO_CHAR(zatrudniony, 'MONTH, dd yyyy') AS data_zatrudnienia
FROM PRACOWNICY WHERE id_zesp = 20;

-- ZADANIE 8 --

SELECT UNIQUE TO_CHAR(current_date, 'DAY')
FROM PRACOWNICY;

-- ZADANIE 9 --

SELECT nazwa, adres,
CASE
WHEN adres LIKE 'PIOTROWO%' THEN 'NOWE MIASTO'
WHEN adres LIKE 'WLODKOWICA%' THEN 'GRUNWALD'
ELSE 'STARE MIASTO'
END AS dzielnica
FROM ZESPOLY;


-- ZADANIE 10 --

SELECT nazwisko, placa_pod,
CASE
WHEN placa_pod > 480 THEN 'Powyżej 480'
WHEN placa_pod < 480 THEN 'Poniżej 480'
ELSE 'Dokładnie 480'
END AS prog
FROM PRACOWNICY ORDER BY placa_pod DESC;

-- ZADANIE 11 --

SELECT nazwisko, placa_pod,
DECODE(SIGN(placa_pod - 480),
1, 'Powyżej 480',
-1, 'Poniżej 480',
'Dokładnie 480') AS prog
FROM pracownicy ORDER BY placa_pod DESC;