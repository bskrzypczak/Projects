#Bartosz Skrzypczak 155832

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def main():

    df_1c = pd.read_csv('1c.csv')
    df_1crs = pd.read_csv('1crs.csv')
    df_1ers = pd.read_csv('1ers.csv')
    df_2c = pd.read_csv('2c.csv')
    df_2crs = pd.read_csv('2crs.csv')

    data_frames = [df_1ers, df_1crs, df_2crs, df_1c, df_2c]
    to_plot = []
    colors = ["blue", "green", "red", "black", "magenta"]
    labels = ["1-Evol-RS",  "1-Coev-RS", "2-Coev-RS", "1-Coev", "2-Coev",]
    markers = ["o", "v", "D", "s", "d"]
    box_data = []

    for df in data_frames:
        box_set = df.iloc[199, 2:]*100
        data_set = []
        df['mean'] = (df.iloc[:, 2:].sum(axis = 1)) / 32
        data_set.append(df['effort'])
        data_set.append(df['mean'])
        to_plot.append(data_set)
        box_data.append(box_set)

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 8))

    for index, set in enumerate(to_plot):
        ax1.plot(set[0]/1000, set[1]*100, label = labels[index], color = colors[index], marker = markers[index], markersize = 6, markeredgecolor = "black", markevery = 25)


    ax1.set_xlabel("Rozegranych gier (× 1000)")
    ax1.set_ylabel('Odsetek wygranych gier[%]')
    ax_top = ax1.twiny()  # Tworzenie drugiej osi x
    ax_top.set_xlim(0, 200)  # Ustawienie limitów osi
    ax_top.set_xlabel('Pokolenie')  # Opis na górze
    ax_top.set_xticks(np.arange(0, 201, 40))
    ax1.set_xlim(0, 500)
    ax1.set_ylim(60, 100)
    ax1.legend()
    ax1.grid(linestyle = "--")

    #print(box_data)

    ax2.boxplot(box_data, notch = True, sym = "g+", vert=True, patch_artist=False, showmeans = True, labels=['1-Evol-RS', '1-Coev-RS', '2-Coev-RS', '1-Coev', '2-Coev'])
    ax_right = ax2.twinx()  # Nowa oś y
    ax_right.set_ylim(60, 100)
    ax_right.yaxis.grid(True, linestyle='--')
    ax2.yaxis.set_visible(False)
    ax2.grid(True, which = "both", linestyle = "--")
    ax2.set_ylim(60, 100)
    fig.savefig('lab1-wykresy.pdf')

if __name__ == '__main__':
    main()
