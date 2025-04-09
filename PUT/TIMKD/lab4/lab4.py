from collections import Counter
import math
import json
from bitarray import bitarray


def coding(dlugosc_kodu, indeks):
    kod = bin(indeks)[2:]
    if len(kod) > dlugosc_kodu:
        print("Kod jest zbyt krotki!")
        return
    while len(kod) < dlugosc_kodu:
        kod = "0" + kod
    return bitarray(kod)


def calculate_freq(nazwa_pliku):
    with open(nazwa_pliku, 'r', encoding='utf-8') as plik:
        dane = plik.read()
    licznik = Counter(dane)
    return licznik, dane


def create(licznik):
    kody = []
    dlugosc_kodu = math.ceil(math.log2(len(licznik)))
    posortowane = sorted(licznik.items(), key=lambda x: x[1], reverse=True)

    for i in range(len(posortowane)):
        kod = [posortowane[i][0], coding(dlugosc_kodu, i)]
        kody.append(kod)

    return {litera: kod for litera, kod in kody}, dlugosc_kodu


def encode(tekst, slownik):
    wynik = bitarray()
    for litera in tekst:
        wynik.extend(slownik[litera])
    return wynik


def reverse_dict(slownik):
    return {kod.to01(): litera for litera, kod in slownik.items()}


def decode(tekst, slownik, dlugosc_kodu):
    odw_slownik = reverse_dict(slownik)
    return ''.join(
        odw_slownik[tekst[i:i+dlugosc_kodu].to01()] for i in range(0, len(tekst), dlugosc_kodu)
    )




def save(zakodowany_tekst, slownik):
    szyfr_plik_nazwa = "szyfr.json"
    zakodowany_plik = "zakodowany.bin"

    dane_do_zapisu = {litera: kod.to01() for litera, kod in slownik.items()}
    with open(szyfr_plik_nazwa, "w", encoding="utf-8") as plik:
        json.dump({
            "slownik": dane_do_zapisu,
            "dlugosc": len(zakodowany_tekst)
        }, plik, ensure_ascii=False, indent=4)

    with open(zakodowany_plik, 'wb') as plik2:
        zakodowany_tekst.tofile(plik2)

    print("Plik szyfr.json został utworzony")
    print("Plik zakodowany.bin został utworzony")



def load():
    szyfr_plik_nazwa = "szyfr.json"
    zakodowany_plik = "zakodowany.bin"

    with open(szyfr_plik_nazwa, "r", encoding="utf-8") as plik:
        dane = json.load(plik)
        slownik = {litera: bitarray(kod) for litera, kod in dane["slownik"].items()}
        dlugosc = dane["dlugosc"]

    zakodowany_tekst = bitarray()
    with open(zakodowany_plik, 'rb') as plik2:
        zakodowany_tekst.fromfile(plik2)

    zakodowany_tekst = zakodowany_tekst[:dlugosc]

    return zakodowany_tekst, slownik



licznik, tekst_zrodlowy = calculate_freq("norm_wiki_en.txt")
slownik_kody, dlugosc_kodu = create(licznik)
zakodowany_tekst = encode(tekst_zrodlowy, slownik_kody)
save(zakodowany_tekst, slownik_kody)

zakodowany_tekst, slownik_kody = load()
odkodowany_tekst = decode(zakodowany_tekst, slownik_kody, dlugosc_kodu)
print("Odkodowany tekst:")
print(odkodowany_tekst)