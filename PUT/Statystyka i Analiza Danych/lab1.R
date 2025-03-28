# ZADANIE 1

sinpi(2)
cos(3/4)
tanpi(1)
log10(100)
log(15)
log(2,4)
exp(3)
64^(1/3)

# ZADANIE 2

a = seq(1, 10)
sum(a)

# ZADANIE 3

x = seq(2, 20, by = 2)
length(x)
y = rev(x)
x*x
x^2
sqrt(sum(x*x))
t(x)%*%y
t(y)%*%x

# ZADANIE 4

seq(5, 10, length = 13)

# ZADANIE 5

b = c(1, 2)
z1 = rep(b, times = 5)
z2 = rep(b, each = 5)
z1 + 4
z3 = z2[-c(length(z2))]
c = z1 + z3
z4 = z1[z1>1]

# ZADANIE 6

A = matrix(c(2, 3, 0, 1, -1, 2, 1, 1, -1), nrow = 3, ncol = 3, byrow = TRUE)
A^2
A%*%A
t(A)
det(A)
solve(A)
e = A[3,]
slad = sum(diag(A))
B = diag(1:4)

# ZADANIE 7

x1 = c(1:10)
y1 = c(1, 5, 6, 2, 3, 5, 0, 8, 4, 1)
plot(x1, y1, main = "wykres")
dane = data.frame(x1, y1)
names(dane)
plot(dane, main = "wykres2")

# ZADANIE 8

rm(X)
curve(x^2 + 3*x - 5, -3, 4, col = "springgreen")
curve(3*sin(x), add = TRUE, col = "pink")

# ZADANIE DODATKOWE

revdiag <- function(c){
  wynik <- diag(c)
  for(i in 1:length(c)){wynik[i, ] <- rev(wynik[i, ])}
  return(wynik)
}

test = c(2, 5, 3, 3, 2, -4)
revdiag(test)