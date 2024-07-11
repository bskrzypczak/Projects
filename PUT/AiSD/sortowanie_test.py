import random
import time
import sortowanie_funkcje as funkcje

rozmiary = [1000, 2000, 5000, 10000, 20000, 50000, 100000]
metody = ["insertion_sort", "selection_sort", "bubble_sort", "quick_sort", "merge_sort", "heap_sort"]

for x in rozmiary:
    liczby = [random.randint(1, x * 2) for _ in range(x)]  #generuje tablice liczb losowych o wyznaczonych rozmiarach
    liczby_r = sorted(liczby)
    liczby_m = liczby_r[::-1]
    liczby_u = liczby_m[:x//2] + liczby_r[x//2 + 1:]
    liczby_v = liczby_r[:x//2] + liczby_m[x//2 + 1:]

    for y in metody:
        sort_function = getattr(funkcje, y)


        t_start = time.time()
        sort_function(liczby)
        t_end = time.time()
        elapsed_time = t_end - t_start
        print(f"Czas sortowania {x} liczb w porządku losowym przy użyciu {y} wynosi: {elapsed_time:.6f} sekund")

        t_start = time.time()
        sort_function(liczby_r)
        t_end = time.time()
        elapsed_time = t_end - t_start
        print(f"Czas sortowania {x} liczb w porządku rosnącym przy użyciu {y} wynosi: {elapsed_time:.6f} sekund")

        t_start = time.time()
        sort_function(liczby_m)
        t_end = time.time()
        elapsed_time = t_end - t_start
        print(f"Czas sortowania {x} liczb w porządku malejącym przy użyciu {y} wynosi: {elapsed_time:.6f} sekund")

        t_start = time.time()
        sort_function(liczby_u)
        t_end = time.time()
        elapsed_time = t_end - t_start
        print(f"Czas sortowania {x} liczb w ciągu U-kształtnym przy użyciu {y} wynosi: {elapsed_time:.6f} sekund")

        t_start = time.time()
        sort_function(liczby_v)
        t_end = time.time()
        elapsed_time = t_end - t_start
        print(f"Czas sortowania {x} liczb w ciągu V-kształtnym przy użyciu {y} wynosi: {elapsed_time:.6f} sekund")
        print("")
    print("======================================================================================================")

