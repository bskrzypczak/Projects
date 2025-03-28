import random
import math


def czy_pierwsza(n):
    for i in range(2, math.ceil(math.sqrt(n))):
        if n%i == 0:
            return False
    return True


def wyznaczenie_Bluma():
    p = random.randint(1000, 9999)
    while czy_pierwsza(p) == False or p%4 != 3:
        p = random.randint(1000, 9999)

    q = random.randint(1000, 9999)
    while czy_pierwsza(q) == False or q%4 != 3:
        q = random.randint(1000, 9999)
    return p*q


def wzglednie_pierwsze(a, b):
    return math.gcd(a, b)==1


def generator(N, dlugosc):
    x = random.randint(N, 100000*N)
    while not wzglednie_pierwsze(x, N):
        x = random.randint(1, N)
    ciag = []
    x_i = pow(x, 2, N)
    ciag.append(x_i%2)
    for i in range(1, dlugosc):
        x_i = pow(x_i, 2, N)
        ciag.append(x_i%2)
    return ciag


def test_dl_serii(ciag):
    seria = 1
    max_seria = 0
    for i in range(1, len(ciag)):
        if ciag[i] == ciag[i - 1]:
            seria += 1
            if seria > max_seria:
                max_seria = seria
        else:
            seria = 1

    if seria > max_seria:
        max_seria = seria

    if max_seria < 26:
        print("Test dlugiej serii: SUKCES - ", max_seria)
    else:
        print("Test dlugiej serii: PORAZKA - ", max_seria)


def test_pojedynczych_bitow(ciag):
    liczba_jedynek = 0
    for bit in ciag:
        if bit == 1:
            liczba_jedynek += 1
    
    if liczba_jedynek > 9725 and liczba_jedynek < 10275:
        print("Test pojedynczych bitow: SUKCES -", liczba_jedynek)
    else:
        print("Test pojedynczych bitow: PORAZKA - ", liczba_jedynek)


def test_serii(ciag):
    serie_0 = [0, 0, 0, 0, 0, 0]
    serie_1 = [0, 0, 0, 0, 0, 0]
    progi = [[2315, 2685], [1114, 1386], [527, 723], [240, 384], [103, 209], [103, 209]]
    dlugosc = 1
    for i in range(1, len(ciag)):
        if ciag[i] == ciag[i - 1]:
            dlugosc += 1
        else:
            if dlugosc <= 6:
                if ciag[i - 1] == 1:
                    serie_1[dlugosc - 1] += 1
                else:
                    serie_0[dlugosc - 1] += 1
            elif ciag[i - 1] == 1:
                serie_1[5] += 1
            else:
                serie_0[5] += 1
            dlugosc = 1

    if dlugosc <= 6:
        if ciag[19999] == 1:
            serie_1[dlugosc - 1] += 1
        else:
            serie_0[dlugosc - 1] += 1
    elif ciag[19999] == 1:
        serie_1[5] += 1
    else:
        serie_0[5] += 1

    for index, prog in enumerate(progi):
        if serie_0[index] < prog[0] or serie_0[index] > prog[1] or serie_1[index] < prog[0] or serie_1[index] > prog[1]:
            print("Test serii: PORAZKA - ", serie_0, serie_1)
            return
    print("Test serii: SUKCES - ", serie_0, serie_1)


def test_pokerowy(ciag):
    szesnastki = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for i in range(0, len(ciag), 4):
        liczba = 8 * ciag[i] + 4 * ciag[i+1] + 2 * ciag[i + 2] + ciag[i + 3]
        szesnastki[liczba] += 1
    for i in range(16):
        szesnastki[i] *= szesnastki[i]
    wynik = 16 / 5000 * sum(szesnastki) - 5000

    if wynik > 2.16 and wynik < 46.17:
            print("Test pokerowy: SUKCES - ", wynik)
    else:
        print("Test pokerowy: PORAZKA - ", wynik)


blum = wyznaczenie_Bluma()
ciag_wynikowy = generator(blum, 20000)
test_dl_serii(ciag_wynikowy)
test_pojedynczych_bitow(ciag_wynikowy)
test_serii(ciag_wynikowy)
test_pokerowy(ciag_wynikowy)