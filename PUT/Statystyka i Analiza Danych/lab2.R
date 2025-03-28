loty = read.csv("loty.csv", sep = ";")
class(loty)
mean(loty$X1955)
mean(loty[,1])
etykiety = names(loty)
for(i in 1:6){
  print(paste("w roku", etykiety[i],"z linii korzystalo", round(mean(loty[,i]),3), "osob"))
  
  print(paste("przez co najmniej 3 msc liczba nie przekraczala tej wartosci, a przez co najmniej 9 msc była nie mniejsza
  niż ta wartość", round(quantile(loty[,i], probs = 0.25), 3)))
  
  print(paste("w roku", etykiety[i], "przez co najmniej 6 msc liczba pasazerow nie
  przekraczala tej wartosci i nie spadała poniżej tej wartości", round(quantile(loty[,i], probs = 0.5), 3)))
  
  print(paste("w roku", etykiety[i], "przez co najmniej 9 msc liczba pasazerow nie
  przekraczala tej wartosci i przez 3 nie spadała poniżej tej wartości", round(quantile(loty[,i], probs = 0.75), 3)))
  
  print(paste("w roku", etykiety[i], "odchylenie wynosilo", round(sd(loty[,i]), 3)))
  print(paste("Wspolczynnik zmiennosci w roku", etykiety[i], "odchylenie wynosilo", round(sd(loty[,i])/mean(loty[,i]), 3)))
  
}
colors = c("orchid", "green2", "deepskyblue3", "peachpuff1", "aquamarine", "chocolate")
br = seq(220, 670, 50)
par(mfrow = c(2, 3))
for(i in 1:6){
  hist(loty[,i], main = etykiety[i], breaks = br, col = colors[i], xlab = "liczba pasazerow")
}
min(loty)
max(loty)
par(mfrow = c(1, 1))
boxplot(loty, col = "steelblue1")

na.omit(oceny)

par(mfrow = c(2, 3))
for(i in 1:4){
  print(paste("Srednia ocen w grupie", i, "wynosi", round(mean(na.omit(oceny[, i])), 2)))
  discrete.hist(na.omit(oceny[,i]), xlab = i, freq = T)
  
}
par(mfrow = c(1, 2))
x = table(na.omit(oceny[, 1]))
pie(x)
boxplot(oceny, col = "gold3")

#przedzialy czy cos