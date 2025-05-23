import numpy as np
import matplotlib.pyplot as plt
import random

# 1. Losowy obraz 100x100 pikseli, wartości 0 (czarny) i 1 (biały)
def generate_simple_shape(size=100):
    img = np.ones((size, size), dtype=np.uint8)  # tło białe (1)
    # Czarny kwadrat na środku
    start, end = size // 4, 3 * size // 4
    img[start:end, start:end] = 0  # czarny
    return img

#Podział na udziały
def split_image_to_shares(image):
    h, w = image.shape
    share1 = np.zeros((h * 2, w * 2), dtype=np.uint8)
    share2 = np.zeros((h * 2, w * 2), dtype=np.uint8)

    for y in range(h):
        for x in range(w):
            pixel = image[y, x]
            pattern = random.choice([0, 1])

            if pattern == 0:
                a = np.array([[1, 0], [1, 0]])
            else:
                a = np.array([[0, 1], [0, 1]])

            b = a.copy()  # domyślnie identyczny wzorzec (dla białych)

            if pixel == 0:
                b = 1 - a

            share1[y*2:y*2+2, x*2:x*2+2] = a * 255
            share2[y*2:y*2+2, x*2:x*2+2] = b * 255

    return share1, share2


#Złożenie udziałów
def overlay_shares(share1, share2):
    return np.minimum(share1, share2)


def visualize_all(original, share1, share2, combined):
    fig, axs = plt.subplots(1, 4, figsize=(20, 5))
    axs[0].imshow(original, cmap='gray')
    axs[0].set_title("Oryginał (100x100)")
    axs[1].imshow(share1, cmap='gray')
    axs[1].set_title("Udział 1")
    axs[2].imshow(share2, cmap='gray')
    axs[2].set_title("Udział 2")
    axs[3].imshow(combined, cmap='gray')
    axs[3].set_title("Złożenie")
    for ax in axs:
        ax.axis('off')
    plt.tight_layout()
    plt.show()

# --- Uruchomienie ---
original = generate_simple_shape()
share1, share2 = split_image_to_shares(original)
combined = overlay_shares(share1, share2)
visualize_all(original, share1, share2, combined)
