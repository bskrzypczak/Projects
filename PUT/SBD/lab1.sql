-- ZADANIE 1 --

SELECT * FROM ZESPOLY;

-- ZADANIE 2 --

SELECT * FROM PRACOWNICY
ORDER BY id_prac;

-- ZADANIE 3 --

SELECT nazwisko, placa_pod * 12 AS roczna_placa
FROM PRACOWNICY
ORDER BY nazwisko;

-- ZADANIE 4 --

SELECT nazwisko, etat, COALESCE(placa_dod, 0) + placa_pod AS miesieczne_zarobki
FROM PRACOWNICY
ORDER BY miesieczne_zarobki DESC;

-- ZADANIE 5 --

SELECT * FROM ZESPOLY
ORDER BY nazwa;

-- ZADANIE 6 --

SELECT UNIQUE etat
FROM PRACOWNICY
ORDER BY etat;

-- ZADANIE 7 --

SELECT * FROM PRACOWNICY
WHERE etat LIKE 'ASYSTENT'
ORDER BY nazwisko;

-- ZADANIE 8 --

SELECT id_prac, nazwisko, etat, placa_pod, id_zesp
FROM PRACOWNICY
WHERE id_zesp = 30 OR id_zesp = 40
ORDER BY placa_pod DESC;

-- ZADANIE 9 --

SELECT nazwisko, id_zesp, placa_pod
FROM PRACOWNICY
WHERE placa_pod BETWEEN 300 AND 800
ORDER BY nazwisko;

-- ZADANIE 10 --

SELECT nazwisko, etat, id_zesp
FROM PRACOWNICY
WHERE nazwisko LIKE '%SKI'
ORDER BY nazwisko;

-- ZADANIE 11 --

SELECT id_prac, id_szefa, nazwisko, placa_pod
FROM PRACOWNICY
WHERE id_szefa IS NOT NULL AND placa_pod > 1000;

-- ZADANIE 12 --

SELECT nazwisko, id_zesp
FROM PRACOWNICY
WHERE id_zesp = 20 AND (nazwisko LIKE '%SKI' OR nazwisko LIKE 'M%')
ORDER BY nazwisko;

-- ZADANIE 13 --

SELECT nazwisko, etat, placa_pod / 160 AS stawka
FROM PRACOWNICY
WHERE etat NOT IN('ADIUNKT', 'STAZYSTA', 'ASYSTENT')
AND placa_pod NOT BETWEEN 400 AND 800
ORDER BY stawka;

-- ZADANIE 14 --

SELECT nazwisko, etat, placa_pod, placa_dod
FROM PRACOWNICY
WHERE COALESCE(placa_dod, 0) + placa_pod > 1000
ORDER BY etat, nazwisko;

-- ZADANIE 15 --

SELECT nazwisko || ' pracuje od ' || zatrudniony || ' i zarabia ' || placa_pod AS PROFESOROWIE
FROM PRACOWNICY
WHERE etat LIKE 'PROFESOR'
ORDER BY placa_pod DESC;
