rubros_semestrales <- read.csv(file="../datasets/rubros-semestrales.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

rubros_transpuesto <- as.data.frame(t(rubros_semestrales), stringsAsFactors = FALSE)

#segun el nombre del rubro se setea el nombre de la columna
names(rubros_transpuesto) <- c('Grafica', 'Tv', 'Radio', 'ViaPublica', 'Cable', 'Web', 'Cine')

#elimino primeras 2 filas
rubros_semestrales_limpio <- rubros_transpuesto[-(1:2), ]
#agrego una columna numérica de tiempo
tiempo<- c(2014, 2014.5, 2015, 2015.5, 2016, 2016.5, 2017, 2017.5, 2018)
rubros_semestrales_tiempo<-cbind.data.frame(tiempo, rubros_semestrales_limpio)

print(rubros_semestrales_tiempo)

regresion_grafica <- lm(Grafica ~ tiempo, data = rubros_semestrales_tiempo)
regresion_tv <- lm(Tv ~ tiempo, data = rubros_semestrales_tiempo)
regresion_radio <- lm(Radio ~ tiempo, data = rubros_semestrales_tiempo)
regresion_viapublica<- lm(ViaPublica ~ tiempo, data = rubros_semestrales_tiempo)
regresion_cable <- lm(Cable ~ tiempo, data = rubros_semestrales_tiempo)
regresion_web <- lm(Web ~ tiempo, data = rubros_semestrales_tiempo)
regresion_cine <- lm(Cine ~ tiempo, data = rubros_semestrales_tiempo)

obtenerPrediccionTiempo<-function(regresion, tiempo){
  return(regresion$coefficients[2]*tiempo+regresion$coefficients[1])
}

valorGrafica <- obtenerPrediccionTiempo(regresion_grafica, 2018.5)
valorTv <- obtenerPrediccionTiempo(regresion_tv, 2018.5)
valorCable <- obtenerPrediccionTiempo(regresion_cable, 2018.5)
valorRadio <- obtenerPrediccionTiempo(regresion_radio, 2018.5)
valorViaPublica <- obtenerPrediccionTiempo(regresion_viapublica, 2018.5)
valorCine <- obtenerPrediccionTiempo(regresion_cine, 2018.5)
valorWeb <- obtenerPrediccionTiempo(regresion_web, 2018.5)

valores_predichos <- c(valorGrafica, valorTv, valorRadio, valorViaPublica, valorCable, valorWeb, valorCine)

print(valores_predichos)
rubros_semestrales_predichos <- cbind.data.frame(valores_predichos, rubros_semestrales_tiempo)

print(rubros_semestrales_predichos)
# plot(functionGrafica,1,2018.5)
# points(rubros_semestrales_tiempo$tiempo,rubros_semestrales_tiempo$Grafica)
# # summary(regresion_grafica)
