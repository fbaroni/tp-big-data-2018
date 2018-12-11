rubros_semestrales <- read.csv(file="../datasets/rubros-semestrales.csv", header=TRUE, sep=",")

rubros_transpuesto <- as.data.frame(t(rubros_semestrales))

#segun el nombre del rubro se setea el nombre de la columna

names(rubros_transpuesto) <- c('Grafica', 'Tv', 'Radio', 'Via Publica', 'Cable', 'Web', 'Cine')
#elimino primeras 2 columnas
print(rubros_transpuesto[-(1:2), ])

