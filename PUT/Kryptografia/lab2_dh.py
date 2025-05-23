import random
from sympy import isprime

def generate_prime(min_val=1000, max_val=9999):
    while True:
        num = random.randint(min_val, max_val)
        if isprime(num):
            return num
        
def check_g(g, n):
    lista = []
    for i in range(n - 1):
        x = pow(g, i, n)
        if x not in lista:
            lista.append(x)
        else:
            return False
    return True

n = generate_prime()
g = random.randint(2, n-1)
while not check_g(g, n):
    g = random.randint(2, n-1)


#A wybiera klucz prywatny x i oblicza X
x = random.randint(2, n-1)
X = pow(g, x, n)

#B wybiera klucz prywatny y i oblicza Y
y = random.randint(2, n-1)
Y = pow(g, y, n)

#Obliczenie wspólnego klucza sesyjnego
k_A = pow(Y, x, n)
k_B = pow(X, y, n)

assert k_A == k_B, "Klucze sesji nie są zgodne!"

print(f"Liczba pierwsza n: {n}")
print(f"Pierwiastek pierwotny g: {g}")
print(f"Klucz prywatny A: {x}")
print(f"Klucz publiczny A (X): {X}")
print(f"Klucz prywatny B: {y}")
print(f"Klucz publiczny B (Y): {Y}")
print(f"Wspólny klucz sesyjny: {k_A}")
