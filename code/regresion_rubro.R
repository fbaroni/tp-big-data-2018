rubros_semestrales <- read.csv(file="../datasets/rubros-semestrales.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

rubros_transpuesto <- as.data.frame(t(rubros_semestrales), stringsAsFactors = FALSE)

#segun el nombre del rubro se setea el nombre de la columna
names(rubros_transpuesto) <- c('Grafica', 'Tv', 'Radio', 'ViaPublica', 'Cable', 'Web', 'Cine')

#elimino primeras 2 filas
rubros_semestrales_limpio <- rubros_transpuesto[-(1:2), ]
#agrego una columna numérica de tiempo
tiempo<- c(2014, 2014.5, 2015, 2015.5, 2016, 2016.5, 2017, 2017.5, 2018)
rubros_semestrales_tiempo<-cbind.data.frame(tiempo, rubros_semestrales_limpio)

#calculo la regresión lineal de cada rubro en función del tiempo
regresion_grafica <- lm(Grafica ~ tiempo, data = rubros_semestrales_tiempo)
regresion_tv <- lm(Tv ~ tiempo, data = rubros_semestrales_tiempo)
regresion_radio <- lm(Radio ~ tiempo, data = rubros_semestrales_tiempo)
regresion_viapublica<- lm(ViaPublica ~ tiempo, data = rubros_semestrales_tiempo)
regresion_cable <- lm(Cable ~ tiempo, data = rubros_semestrales_tiempo)
regresion_web <- lm(Web ~ tiempo, data = rubros_semestrales_tiempo)
regresion_cine <- lm(Cine ~ tiempo, data = rubros_semestrales_tiempo)

obtenerSalidaRegresion<-function(regresion, filename){
  salida <- summary(regresion)
  capture.output(salida, file = filename)
}

#generacion de archivos TXT con la salida de la regresión lineal
obtenerSalidaRegresion(regresion_web, '../output/regresion_web.txt')
obtenerSalidaRegresion(regresion_cable, '../output/regresion_cable.txt')
obtenerSalidaRegresion(regresion_grafica, '../output/regresion_grafica.txt')
obtenerSalidaRegresion(regresion_radio, '../output/regresion_radio.txt')
obtenerSalidaRegresion(regresion_tv, '../output/regresion_tv.txt')
obtenerSalidaRegresion(regresion_viapublica, '../output/regresion_viapublica.txt')
obtenerSalidaRegresion(regresion_cine, '../output/regresion_cine.txt')

obtenerPrediccionTiempo<-function(regresion, tiempo){
  return(regresion$coefficients[2]*tiempo+regresion$coefficients[1])
}

#calculo los valores predichos
valorGrafica <- obtenerPrediccionTiempo(regresion_grafica, 2018.5)
valorTv <- obtenerPrediccionTiempo(regresion_tv, 2018.5)
valorCable <- obtenerPrediccionTiempo(regresion_cable, 2018.5)
valorRadio <- obtenerPrediccionTiempo(regresion_radio, 2018.5)
valorViaPublica <- obtenerPrediccionTiempo(regresion_viapublica, 2018.5)
valorCine <- obtenerPrediccionTiempo(regresion_cine, 2018.5)
valorWeb <- obtenerPrediccionTiempo(regresion_web, 2018.5)

valores_predichos <- c(2018.5, valorGrafica, valorTv, valorRadio, valorViaPublica, valorCable, valorWeb, valorCine)

rubros_semestrales_predichos <- rbind.data.frame(rubros_semestrales_tiempo, valores_predichos)

#generación de CSV con los valores predichos
write.csv(rubros_semestrales_predichos, file = "../datasets/prediccion-por-semestres.csv")


