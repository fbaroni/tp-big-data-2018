#Leer CSV 
pauta2014 <- read.csv(file="../datasets/pauta-oficial-2014.csv", header=TRUE, sep=",")
pauta2017_2 <- read.csv(file="../datasets/pauta-oficial-segundo-semestre-2017.csv", header=TRUE, sep=",")
s <- summary(pauta2014)
capture.output(s, file = "../output/summary_pauta2014.txt")

s <- summary(pauta2017_2)
capture.output(s, file = "../output/summary_pauta2017_2.txt")
#summary(pauta2017_2)


