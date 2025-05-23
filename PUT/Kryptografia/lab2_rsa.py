import random
from sympy import isprime, mod_inverse

def generate_prime(min_val=1000, max_val=9999):
    while True:
        num = random.randint(min_val, max_val)
        if isprime(num):
            return num

#Generowanie dwóch czterocyfrowych liczb pierwszych
p = generate_prime()
q = generate_prime()
while p == q:
    q = generate_prime()

#Generowanie kluczy
n = p * q
phi = (p - 1) * (q - 1)

def generate_e(phi):
    for e in range(3, phi, 2):
        if isprime(e) and phi % e != 0:
            return e

e = generate_e(phi)
d = mod_inverse(e, phi)

public_key = (e, n)
private_key = (d, n)

message = "Bardzo powazna i tajna wiadomosc do zaszyfrowania!"
message_bytes = [ord(char) for char in message]

#Szyfrowanie
encrypted_message = [pow(m, e, n) for m in message_bytes]

#Deszyfrowanie
decrypted_message_bytes = [pow(c, d, n) for c in encrypted_message]
decrypted_message = ''.join(chr(m) for m in decrypted_message_bytes)

assert message == decrypted_message, "Wiadomość nie zgadza się po odszyfrowaniu!"

print(f"Liczby pierwsze: p={p}, q={q}")
print(f"Klucz publiczny: {public_key}")
print(f"Klucz prywatny: {private_key}")
print("Zaszyfrowana wiadomość:", encrypted_message)
print("Odszyfrowana wiadomość:", decrypted_message)