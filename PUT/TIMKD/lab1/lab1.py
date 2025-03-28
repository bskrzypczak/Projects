import random
import sys
from collections import Counter, defaultdict


def srednia_dlugosc_slowa(tekst):
    liczba_slow = 1

    for i in range(1, len(tekst)):
        if tekst[i] == ' ' and tekst[i - 1] != ' ':
            liczba_slow += 1

    return len(tekst)/liczba_slow


def analiza_tekstu(tekst, rzad = 1):
    licznik = defaultdict(Counter)
    
    for i in range(len(tekst) - rzad):
        prefix = tekst[i:i+rzad]
        next_char = tekst[i+rzad]
        licznik[prefix][next_char] += 1
    
    for prefix, przejscia in licznik.items():
        lacznie = sum(przejscia.values())
        licznik[prefix] = {char: count / lacznie for char, count in przejscia.items()}
    
    return licznik


def generowanie_tekstu(licznik, dlugosc, rzad = 1, poczatek=None):
    if not poczatek:
        poczatek = random.choice(list(licznik.keys()))  # Losowa sekwencja startowa
    text = poczatek
    
    for _ in range(dlugosc - rzad):
        next_char = random.choices(list(licznik[text[-rzad:]].keys()), weights=licznik[text[-rzad:]].values())[0]
        text += next_char
    
    return text


if len(sys.argv) != 4:
    print("python program.py <plik_wejsciowy> <rozmiar_wyjściowy> <plik_wyjściowy>")
    sys.exit(1)

nazwa_pliku = sys.argv[1]
rozmiar_wyjscia = int(sys.argv[2])
plik_wynikowy = sys.argv[3]

with open(nazwa_pliku, 'r') as plik:
    tekst_zrodlowy = plik.read()
    

# zadanie 1
jeden_znak = analiza_tekstu(tekst_zrodlowy, 1)
przyblizenie_1 = generowanie_tekstu(jeden_znak, rozmiar_wyjscia, 1)

# zadanie 2
trzy_znaki = analiza_tekstu(tekst_zrodlowy, 3)
przyblizenie_3 = generowanie_tekstu(trzy_znaki, rozmiar_wyjscia, 3)

# zadanie 3
piec_znakow = analiza_tekstu(tekst_zrodlowy, 5)
przyblizenie_5 = generowanie_tekstu(piec_znakow, rozmiar_wyjscia, 5, "probability")


if plik_wynikowy[-4:] != ".txt":
    plik_wynikowy += ".txt"

with open(plik_wynikowy, 'w') as wyniki:
    wyniki.write("Przyblizenie I rzedu:\n")
    wyniki.write(przyblizenie_1)
    wyniki.write("\n\n\nPrzyblizenie III rzedu: \n")
    wyniki.write(przyblizenie_3)
    wyniki.write("\n\n\nPrzyblizenie V rzedu: \n")
    wyniki.write(przyblizenie_5)
    wyniki.write("\n\n\nSrednia dlugosc slowa w przyblizeniu:")
    wyniki.write("\n- I rzedu -> ")
    wyniki.write(str(srednia_dlugosc_slowa(przyblizenie_1)))
    wyniki.write("\n- III rzedu -> ")
    wyniki.write(str(srednia_dlugosc_slowa(przyblizenie_3)))
    wyniki.write("\n- V rzedu -> ")
    wyniki.write(str(srednia_dlugosc_slowa(przyblizenie_5)))