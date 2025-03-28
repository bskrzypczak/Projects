import sys
import librosa
import numpy as np

def extract_features(file_path):
    try:
        y, sr = librosa.load(file_path, sr=None)
        f0, voiced_flag, _ = librosa.pyin(y, fmin=50, fmax=300, sr=sr)
        # Średnia F0 z uwzględnieniem tylko tych fragmentów, gdzie głos jest obecny
        mean_f0 = np.nanmean(f0) if np.any(~np.isnan(f0)) else 0
        return mean_f0
    except Exception as e:
        print(f"Błąd podczas przetwarzania pliku {file_path}: {e}")
        sys.exit(1)

def classify_gender(file_path):
    mean_f0 = extract_features(file_path)

    # Decyzja na podstawie zakresów częstotliwości
    if mean_f0 <= 172:
        return 'M'
    else:
        return 'K'

def main():
    if len(sys.argv) != 2:
        print("Poprawna forma: python inf155832.py plik.wav")
        sys.exit(1)

    file_path = sys.argv[1]
    result = classify_gender(file_path)
    print(result)

if __name__ == "__main__":
    main()
