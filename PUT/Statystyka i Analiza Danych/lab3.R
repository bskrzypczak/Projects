#studnie

n = 5
p = 0.3
s = 0:n
x = bin(n, p)
prob = dbinom(s, n, p)
plot(s, prob, type ="h", col = "blue")
sum(prob[s>=3])
sum(prob[s<3])
prob[s==3]

#zarowki

n2 = 8
p2 = 0.9
s2 = 0:n2
prob2 = dbinom(s2, n2, p2)
plot(s2, prob2, type = "h", col = "lightgreen")
prob2[s2==8]
prob2[s2==7]
sum(prob2[s2>5])
round(sum(prob2 * s2))  #wartosc oczekiwana E() 
sqrt(n2 * 0.9 * 0.1)    #odchylenie n * p * (1-p)

lam = 0.01
t = exp(lam)
curve(dexp(x, lam), 0, 4/lam)
dys = 1 -pexp(200, lam)
pexp(500, lam)


# trzesienia

lam2 = 1/2.4
curve(dexp(x, lam2), 0 , 4/lam2, col = "steelblue2")
1 - pexp(3, lam2)   #przekroczy 3 stopnie
pexp(3, lam2) - pexp(2, lam2)   #miedzy 2 a 3 stopnie

f = function(x) {
  x*dexp(x, lam2)
}

integrate(f, 0 , Inf)

# prad
#N(u, sigma) u - srednia, sigma - wartosc oczek

mi = 0.13
sigma = 0.005
curve(dnorm(x, mi, sigma), mi - 3*sigma, mi+3*sigma)
#F(0,14) - F(0,12)
pnorm(0.14, mi, sigma) - pnorm(0.12, mi, sigma)

#farba

mi = 2
sigma = 0.25
curve(dnorm(x, mi, sigma), mi - 3*sigma, mi+3*sigma)
pnorm(2.25, mi, sigma) - pnorm(11/6, mi, sigma)

#
n = 100
p = 0.25
s = 0:n
prob = dbinom(s, n, p)
sum(prob[s<=15])


# zadanie 9
#R_i ~ N(200, 10) i = 1...25
# Rbar ~ (200, 10/5)
#P(199 < Rbar < 202) = F (202) - F(199)
n = 25
mu = 200
sig = 10
mubar = mu
sigbar = sig/sqrt(n)
pnorm(202, mubar, sigbar) - pnorm(199, mubar, sigbar)

#T ~ N(n * mi, sqrt(n) * 0)
muT = mu * n
sigT = sig * sqrt(n)
pnorm(5100, muT, sigT)

#zadanie 10 przed kolokwium

#zadanie 11
#W_I : mu = 0.5kg, sigma = 0.2kg
#P(Total) >= 47
#T ~app N(0.5 * 100, 0.2 * 10)

z11 = 1 - pnorm(0.5 * 100, 0.2 * 10)
