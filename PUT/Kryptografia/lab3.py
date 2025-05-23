import hashlib
import time
import random
import requests

def hash_message(message):
    hashes = {
        "MD5": hashlib.md5(message.encode()).hexdigest(),
        "SHA-1": hashlib.sha1(message.encode()).hexdigest(),
        "SHA-256": hashlib.sha256(message.encode()).hexdigest(),
        "SHA-512": hashlib.sha512(message.encode()).hexdigest(),
        "SHA3-256": hashlib.sha3_256(message.encode()).hexdigest(),
        "SHA3-512": hashlib.sha3_512(message.encode()).hexdigest()
    }
    return hashes

def benchmark_hashing(message):
    results = {}
    for algo in ["md5", "sha1", "sha256", "sha512", "sha3_256", "sha3_512"]:
        start_time = time.time()
        for _ in range(10000):
            getattr(hashlib, algo)(message.encode()).hexdigest()
        elapsed_time = time.time() - start_time
        results[algo] = elapsed_time
    return results

def check_common_md5(md5_hash):
    response = requests.get(f"https://md5.gromweb.com/?md5={md5_hash}")
    return "string corresponding" in response.text

def find_collisions_sha256():
    hash_dict = {}
    for _ in range(100000):
        random_string = ''.join(random.choices("abcdefghijklmnopqrstuvwxyz", k=8))
        hash_prefix = hashlib.sha256(random_string.encode()).hexdigest()[:3]
        if hash_prefix in hash_dict:
            return hash_dict[hash_prefix], random_string
        hash_dict[hash_prefix] = random_string
    return None, None

def test_sac(message):
    original_hash = hashlib.sha256(message.encode()).hexdigest()
    message_bytes = bytearray(message.encode())
    bit_to_flip = random.randint(0, len(message_bytes) * 8 - 1)
    byte_index = bit_to_flip // 8
    bit_index = bit_to_flip % 8
    message_bytes[byte_index] ^= (1 << bit_index)
    modified_hash = hashlib.sha256(message_bytes).hexdigest()
    
    original_bits = bin(int(original_hash, 16))[2:].zfill(256)
    modified_bits = bin(int(modified_hash, 16))[2:].zfill(256)
    changed_bits = sum(1 for o, m in zip(original_bits, modified_bits) if o != m)
    return changed_bits / 256

# Testowanie aplikacji
message = input("Podaj tekst do zahaszowania: ")
hashes = hash_message(message)
print("\nWygenerowane wartości skrótu:")
for algo, h in hashes.items():
    print(f"{algo}: {h}")

benchmark_results = benchmark_hashing(message)
print("\nCzas generowania 10000 skrótów dla różnych funkcji:")
for algo, time_taken in benchmark_results.items():
    print(f"{algo}: {time_taken:.5f} sek")

if len(message) <= 4:
    md5_common = check_common_md5(hashes["MD5"])
    print(f"\nCzy hash MD5 jest powszechnie znany? {'Tak' if md5_common else 'Nie'}")

collision1, collision2 = find_collisions_sha256()
if collision1 and collision2:
    print(f"\nZnaleziono kolizję na pierwszych 12 bitach SHA-256:")
    print(f"{collision1} -> {hashlib.sha256(collision1.encode()).hexdigest()}")
    print(f"{collision2} -> {hashlib.sha256(collision2.encode()).hexdigest()}")
else:
    print("\nNie znaleziono kolizji na pierwszych 12 bitach SHA-256 po 100000 testach.")

sac_score = test_sac(message)
print(f"\nWskaźnik SAC dla SHA-256: {sac_score:.3f}")
