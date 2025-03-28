dane = read.csv("dane_est.csv", sep = ";", dec = ",")
diam = na.omit(dane$diamenty)

# ZADANIE 1
#wszystkie diamenty produkowane tą metodą - populacja
#diamenty wybrane do badania - próba
#waga (w karatach) - zmienna
xbar = mean(diam)
ssq = var(diam) #wariancja s^2
s = sd(diam)  #lub sqrt(ssq)
n = length(diam)
alfa = 0.05
kwantyl = qt(1 - alfa/2, n - 1)
L = xbar - kwantyl*s/sqrt(n)
U = xbar + kwantyl*s/sqrt(n)
# z ufniością 95% przedział od 0.49 do 0.57 karata pokrywa nieznaną średnią wagę
# WSZYSTKICH diamentów produkowanych badaną metodą      EGZAMIN (pokrywa populacje a nie probke)

ttt = t.test(diam, conf.level = 1 - alfa)
ttt$conf.int

ttt2 = t.test(diam, conf.level = 0.98)  #98 to wartosc domyslna
ttt2$conf.int

L = (n-1)*ssq/qchisq(1-alfa/2, n-1)
P = (n-1)*ssq/qchisq(alfa/2, n-1)

sigma.test(diam)

#zadanie 2
dane2 = c(16, 0, 0, 2, 3, 6, 8, 2, 5, 0, 12, 10, 5, 7, 2 , 3, 8, 17, 9, 1)
print(paste("Srednia zawartość PCB w próbkach badanych kobiet wynosi ", mean(dane2)))
print(paste("Wariancja poziomu PCB w próbkach badanych kobiet wynosi", var(dane2)))
print(paste("Odchylenie standardowe poziomu PCB w próbkach wynosi", sd(dane2)))
d = t.test(dane2, conf.level = 0.95)
d$conf.int
#Z ufnośćią 95% przedział [3.42, 8.18] pokrywa prawdziwy nieznany średni poziom PCB w mleku wszystkich
sigma.test(dane2)
var_int = sigma.test(dane2, conf.level = 0.95)
var_int$conf.int
sqrt(var_int$conf.int)

#zadanie 3
fajki = c(1.87, 2.28, 1.77, 2.13, 1.43, 1.64, 2.38, 1.39, 1.94, 2.68, 1.95, 0.86, 1.98, 1.69, 1.15)
mean(fajki)
tomek = 0.7
zzz=z.test(fajki, sigma.x = tomek)
zzz$conf.int
#Z ufnoscia 95% przedzial pokrywa nieznana srednia zawartosc nikotyny w papierosach danej marki

#zadanie 4

wodorosty = na.omit(dane$wodorosty)
mean(wodorosty)
var(wodorosty)
xbar = t.test(wodorosty, conf.level = 0.9)
xbar$conf.int
wodorosty_var = sigma.test(wodorosty, conf.level = 0.9)
wodorosty_var$conf.int
#zadanie ktores

alpha = 0.05
n = 1200
xbar = 4.7
s = 2.2
zsum.test(xbar, s, n, conf.level = 0.95)

est_var = s^2
q1 = qchisq(1-alpha/2, n-1)
q2 = qchisq(alpha/2, n-1)
L = (n-1)*est_var/q1
U = (n-1)*est_var/q2
sqrt(L)
sqrt(U)


n = 365
xbar = 102
ssq = 81
s = sqrt(ssq)
zsum.test(xbar, s, n, conf.level = 0.98)


