import random
import sys
from collections import Counter, defaultdict

def analiza_tekstu(tekst, rzad=1):
    slowa = tekst.split()
    licznik = defaultdict(Counter)
    
    for i in range(len(slowa) - rzad):
        prefix = tuple(slowa[i:i+rzad])
        next_word = slowa[i+rzad]
        licznik[prefix][next_word] += 1
    

    for prefix, przejscia in licznik.items():
        lacznie = sum(przejscia.values())
        licznik[prefix] = {word: count / lacznie for word, count in przejscia.items()}
    
    return licznik


def generowanie_tekstu(licznik, dlugosc, rzad=1, poczatek=None):
    if not poczatek:
        poczatek = random.choice(list(licznik.keys())) 
    else:
        poczatek = tuple(poczatek.split())
    
    text = list(poczatek)
    

    for _ in range(dlugosc - rzad):
        ostatnie_slowa = tuple(text[-rzad:])
        if ostatnie_slowa not in licznik:
            break
        next_word = random.choices(list(licznik[ostatnie_slowa].keys()), weights=licznik[ostatnie_slowa].values())[0]
        text.append(next_word)
    
    return ' '.join(text)

if len(sys.argv) != 4:
    print("python program.py <plik_wejsciowy> <rozmiar_wyjściowy> <plik_wyjściowy>")
    sys.exit(1)

nazwa_pliku = sys.argv[1]
rozmiar_wyjscia = int(sys.argv[2])
plik_wynikowy = sys.argv[3]

with open(nazwa_pliku, 'r') as plik:
    tekst_zrodlowy = plik.read()

jedno_slowo = analiza_tekstu(tekst_zrodlowy, 1)
pierwszy_rzad = generowanie_tekstu(jedno_slowo, rozmiar_wyjscia, 1)

dwa_slowa = analiza_tekstu(tekst_zrodlowy, 2)
drugi_rzad = generowanie_tekstu(dwa_slowa, rozmiar_wyjscia, 2)

probability = generowanie_tekstu(dwa_slowa, rozmiar_wyjscia, 2, "probability of")

if plik_wynikowy[-4:] != ".txt":
    plik_wynikowy += ".txt"

with open(plik_wynikowy, 'w', encoding='utf-8') as plik:
    plik.write("--- Przyblizenie I rzedu ---\n" + pierwszy_rzad + "\n\n\n")
    plik.write("--- Przyblizenie II rzedu ---\n" + drugi_rzad + "\n\n\n")
    plik.write("--- Przyblizenie II rzedu (probability) ---\n" + probability + "\n\n\n")
