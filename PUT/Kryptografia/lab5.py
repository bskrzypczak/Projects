import random
import random
import matplotlib.pyplot as plt

# Metoda trywialna
def metoda_trywialna():     # t = n
    n = 100     #liczba udziałów
    k = 1000    #rozmiar przestrzeni liczbowej
    czesci = podzial_sekretu(n, k)
    odtwarzanie_sekretu(czesci, k)


def podzial_sekretu(n, k):
    sekret = 587
    czesci = []

    for _ in range(n - 1):
        czesci.append(random.randint(0, k))

    czesci.append((sekret - sum(czesci)) % k) 

    print(czesci)
    return czesci

def odtwarzanie_sekretu(czesci, k):
    sekret = (sum(czesci)) % k
    print(f"sekret: {sekret}")




# Metoda Shamir'a
def odwrotnosc_modulo(a, p):
    return pow(a, -1, p)

def shamir_podzial(sekret, n, t, p):
    # Tworzymy losowy wielomian f(x) = a_0 + a_1 x + ... + a_{t-1} x^{t-1}, gdzie a_0 = sekret
    wspolczynniki = [sekret] + [random.randint(0, p - 1) for _ in range(t - 1)]
    print("Współczynniki wielomianu:", wspolczynniki)

    udzialy = []
    for x in range(1, n + 1):
        y = sum([wspolczynniki[i] * (x ** i) for i in range(t)]) % p
        udzialy.append((x, y))

    print("Udziały:", udzialy)
    return udzialy, wspolczynniki

# Rekonstrukcja sekretu za pomocą interpolacji Lagrange'a
def shamir_odtworzenie(udzialy, t, p):
    sekret = 0
    for j in range(t):
        xj, yj = udzialy[j]
        numer = 1
        denom = 1
        for m in range(t):
            xm, _ = udzialy[m]
            if m != j:
                numer = (numer * (-xm)) % p
                denom = (denom * (xj - xm)) % p
        lagrange_coef = numer * odwrotnosc_modulo(denom, p)
        sekret = (p + sekret + yj * lagrange_coef) % p
    print(f"Odtworzony sekret: {sekret}")
    return sekret

# Wizualizacja wielomianu
def rysuj_wielomian(wspolczynniki, p, n):
    x_wartosci = list(range(1, n + 1))
    y_wartosci = [
        sum([wspolczynniki[i] * (x ** i) for i in range(len(wspolczynniki))]) % p
        for x in x_wartosci
    ]

    plt.plot(x_wartosci, y_wartosci, 'bo-', label='Wielomian')
    plt.xlabel("x")
    plt.ylabel("f(x) mod p")
    plt.title("Wizualizacja wielomianu (Shamir)")
    plt.grid(True)
    plt.legend()
    plt.show()


def shamir_demo():
    sekret = 573
    n = 10          # liczba udziałów
    t = 8           # wymagane do odtworzenia
    p = 7919        # liczba pierwsza > max(sekret, n)

    udzialy, wspolczynniki = shamir_podzial(sekret, n, t, p)
    rysuj_wielomian(wspolczynniki, p, n)

    wybrane_udzialy = random.sample(udzialy, t)
    print("Wybrane udziały do odtworzenia:", wybrane_udzialy)
    shamir_odtworzenie(wybrane_udzialy, t, p)

shamir_demo()
