#Bartosz Skrzypczak 155832
import matplotlib.pyplot as plt
import numpy as np
import colorsys


def hsv2rgb(h, s, v):
    return colorsys.hsv_to_rgb(h, s, v)

def gradient_hsv_unknown(v):
    return hsv2rgb(1/3 - v/3, 1, 1)

def calculate_lighting(matrix, light_vector, scale=1.5):
    h, w = matrix.shape
    lighting_matrix = np.zeros((h, w))
    

    light_vector = light_vector / np.linalg.norm(light_vector)
    
    for y in range(1, h - 1):
        for x in range(1, w - 1):

            dzdx = matrix[y, x+1] - matrix[y, x-1]
            dzdy = matrix[y+1, x] - matrix[y-1, x]

            normal_vector = np.array([-dzdx, -dzdy, 2])
            normal_vector = normal_vector / np.linalg.norm(normal_vector)
            
            cos_theta = np.dot(light_vector, normal_vector)
            intensity = scale * cos_theta
            
            lighting_matrix[y, x] = max(0, intensity)
    
    return lighting_matrix

with open('mapa-dane.txt', 'r') as plik:
    pierwsza_linia = plik.readline().strip()
    w, h, distance = map(float, pierwsza_linia.split())
    w, h = int(w), int(h)
    
    macierz_wysokosci = []
    for _ in range(h):
        linia = plik.readline().strip()
        wysokosci = list(map(float, linia.split()))
        macierz_wysokosci.append(wysokosci)

macierz_wysokosci = np.array(macierz_wysokosci)

normalizowana_mw = (macierz_wysokosci - np.min(macierz_wysokosci)) / (np.max(macierz_wysokosci) - np.min(macierz_wysokosci))

light_vector = np.array([-1, -1, 1])

lighting_matrix = calculate_lighting(macierz_wysokosci, light_vector, scale=1.5)

shaded_matrix = np.zeros((h, w, 3))
for y in range(h):
    for x in range(w):
        v = normalizowana_mw[y, x]
        base_color = gradient_hsv_unknown(v)
        
        hsv_color = colorsys.rgb_to_hsv(*base_color)
        adjusted_v = hsv_color[2] * (0.5 + 0.5 * lighting_matrix[y, x])
        
        shaded_matrix[y, x] = hsv2rgb(hsv_color[0], hsv_color[1], np.clip(adjusted_v, 0, 1))

plt.figure(figsize=(8, 8))
plt.imshow(shaded_matrix, origin='lower')
plt.gca().invert_yaxis()

plt.savefig('mapa_wysokosci.pdf')
