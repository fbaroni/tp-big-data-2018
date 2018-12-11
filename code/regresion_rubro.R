rubros_semestrales <- read.csv(file="../datasets/rubros-semestrales.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

rubros_transpuesto <- as.data.frame(t(rubros_semestrales), stringsAsFactors = FALSE)

#segun el nombre del rubro se setea el nombre de la columna
names(rubros_transpuesto) <- c('Grafica', 'Tv', 'Radio', 'ViaPublica', 'Cable', 'Web', 'Cine')

#elimino primeras 2 filas
rubros_semestrales_limpio <- rubros_transpuesto[-(1:2), ]
#agrego una columna numérica de tiempo
tiempo<- c(2014, 2014.5, 2015, 2015.5, 2016, 2016.5, 2017, 2017.5, 2018)
rubros_semestrales_tiempo<-cbind.data.frame(tiempo, rubros_semestrales_limpio)

regresion_grafica <- lm(Grafica ~ tiempo, data = rubros_semestrales_tiempo)
regresion_tv <- lm(Tv ~ tiempo, data = rubros_semestrales_tiempo)
regresion_radio <- lm(Radio ~ tiempo, data = rubros_semestrales_tiempo)
regresion_viapublica<- lm(ViaPublica ~ tiempo, data = rubros_semestrales_tiempo)
regresion_cable <- lm(Cable ~ tiempo, data = rubros_semestrales_tiempo)
regresion_web <- lm(Web ~ tiempo, data = rubros_semestrales_tiempo)
regresion_cine <- lm(Cine ~ tiempo, data = rubros_semestrales_tiempo)


summary(regresion_grafica)
