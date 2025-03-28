from collections import Counter, defaultdict
import math

def analiza_tekstu_litery(tekst, rzad=1):
    licznik = defaultdict(Counter)
    prefix_licznik = Counter()
    
    for i in range(len(tekst) - rzad):
        prefix = tekst[i:i+rzad]
        next_char = tekst[i+rzad]
        licznik[prefix][next_char] += 1
        prefix_licznik[prefix] += 1
    
    for prefix, przejscia in licznik.items():
        lacznie = prefix_licznik[prefix]
        licznik[prefix] = {char: count / lacznie for char, count in przejscia.items()}
    
    return licznik, prefix_licznik

def analiza_tekstu_slowa(tekst, rzad=1):
    slowa = tekst.split()
    licznik = defaultdict(Counter)
    prefix_licznik = Counter()
    
    for i in range(len(slowa) - rzad):
        prefix = tuple(slowa[i:i+rzad])
        next_word = slowa[i+rzad]
        licznik[prefix][next_word] += 1
        prefix_licznik[prefix] += 1
    
    for prefix, przejscia in licznik.items():
        lacznie = prefix_licznik[prefix]
        licznik[prefix] = {word: count / lacznie for word, count in przejscia.items()}
    
    return licznik, prefix_licznik

def licz_entropie(licznik, prefix_licznik):
    entropia = 0
    total_prefixes = sum(prefix_licznik.values())
    
    for prefix, przejscia in licznik.items():
        p_prefix = prefix_licznik[prefix] / total_prefixes
        for char, p in przejscia.items():
            entropia += -p_prefix * p * math.log2(p)
    
    return entropia


jezyki = ["norm_wiki_en.txt", "norm_wiki_eo.txt", "norm_wiki_et.txt", "norm_wiki_so.txt", "norm_wiki_ht.txt", "norm_wiki_nv.txt"]
badane = ["sample0.txt", "sample1.txt", "sample2.txt", "sample3.txt", "sample4.txt", "sample5.txt",]
wyniki_slowa = [[100, 0], [100, 0], [100, 0], [100, 0], [100, 0]] #kazdy element to [min, max] wynik dla danego rzedu entropii
wyniki_litery = [[100, 0], [100, 0], [100, 0], [100, 0], [100, 0]]
for jezyk in jezyki:
    print("\n\nAnaliza jezyka: " + jezyk + "\n")
    
    with open(jezyk, 'r') as plik:
        probka_jezyka = plik.read()

    for rzad in range(5):
        print("Entropia liter rzedu " + str(rzad), end= ": ")
        licznik, prefix_licznik = analiza_tekstu_litery(probka_jezyka, rzad)
        entropia = licz_entropie(licznik, prefix_licznik)
        if entropia > wyniki_litery[rzad][1]:
            wyniki_litery[rzad][1] = entropia
        if entropia < wyniki_litery[rzad][0]:
            wyniki_litery[rzad][0] = entropia
        print(entropia)

        print("Entropia slow rzedu " + str(rzad), end= ": ")
        licznik, prefix_licznik = analiza_tekstu_slowa(probka_jezyka, rzad)
        entropia = licz_entropie(licznik, prefix_licznik)
        if entropia > wyniki_slowa[rzad][1]:
            wyniki_slowa[rzad][1] = entropia
        if entropia < wyniki_slowa[rzad][0]:
            wyniki_slowa[rzad][0] = entropia
        print(entropia)

for badany in badane:
    print("\n\nAnaliza probki: " + badany + "\n")
    
    with open(badany, 'r') as plik:
        badany_tekst = plik.read()

    for rzad in range(5):
        print("Entropia liter rzedu " + str(rzad), end= ": ")
        licznik, prefix_licznik = analiza_tekstu_litery(badany_tekst, rzad)
        print(licz_entropie(licznik, prefix_licznik))

        print("Entropia slow rzedu " + str(rzad), end= ": ")
        licznik, prefix_licznik = analiza_tekstu_slowa(badany_tekst, rzad)
        print(licz_entropie(licznik, prefix_licznik))
    
    
print("Wartosci min. i max. dla entropii liter:", wyniki_litery)
print("Wartosci min. i max. dla entropii slow:", wyniki_slowa)