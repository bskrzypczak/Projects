import sys
import librosa
import numpy as np
import joblib  # Do wczytywania modelu

# Wczytaj model klasyfikatora (opcjonalny - może być użyty jeśli F0 nie wystarcza)
MODEL_PATH = "model.pkl"

try:
    model = joblib.load(MODEL_PATH)
except FileNotFoundError:
    print("Ostrzeżenie: Plik modelu 'model.pkl' nie został znaleziony. Używana będzie tylko analiza F0.")
    model = None

def extract_features(file_path):
    """Ekstrakcja cech z pliku .wav."""
    try:
        y, sr = librosa.load(file_path, sr=None)
        # Estymacja podstawowej częstotliwości głosu (F0) za pomocą pyin
        f0, voiced_flag, _ = librosa.pyin(y, fmin=50, fmax=300, sr=sr)
        # Średnia F0 z uwzględnieniem tylko tych fragmentów, gdzie głos jest obecny
        mean_f0 = np.nanmean(f0) if np.any(~np.isnan(f0)) else 0
        # Ekstrakcja cech MFCC (Mel-Frequency Cepstral Coefficients) jako uzupełnienie
        mfcc = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)
        mfcc_mean = np.mean(mfcc, axis=1)
        mfcc_var = np.var(mfcc, axis=1)
        return mean_f0, np.hstack([mfcc_mean, mfcc_var])
    except Exception as e:
        print(f"Błąd podczas przetwarzania pliku {file_path}: {e}")
        sys.exit(1)

def classify_gender(file_path):
    """Klasyfikacja płci na podstawie F0 i opcjonalnych cech MFCC."""
    mean_f0, features = extract_features(file_path)

    # Decyzja na podstawie zakresów częstotliwości
    if 85 <= mean_f0 <= 180:
        return 'M'
    elif 165 <= mean_f0 <= 255:
        return 'K'
    elif 250 <= mean_f0 <= 300:
        return 'D'  # Opcjonalnie dla dzieci, jeśli to potrzebne

    # Jeśli F0 nie wystarcza, użyj klasyfikatora (jeśli dostępny)
    if model is not None:
        features = features.reshape(1, -1)
        prediction = model.predict(features)
        return 'K' if prediction[0] == 'female' else 'M'

    # Jeśli brak modelu, zwróć brak decyzji
    return 'N'  # Niezidentyfikowany

def main():
    if len(sys.argv) != 2:
        print("Użycie: python inf12345.py plik.wav")
        sys.exit(1)

    file_path = sys.argv[1]
    result = classify_gender(file_path)
    print(result)

if __name__ == "__main__":
    main()
