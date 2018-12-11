source('lectura_datasets.R')
library(plyr)
library(ggplot2)

obtener_6_primeros_medios_proporcion <- function(dataframe) {
  #reemplazo titulo total_con_iva por total para poder ser usado el script desde 2014 a 2018
  if(colnames(dataframe)[3] == 'total_con_iva'){
    colnames(dataframe)[3] <- "total"
  }
  
  if(ncol(dataframe) > 10 && colnames(dataframe)[12] == 'total_con_iva'){
    colnames(dataframe)[12] <- "total"
  }
  
  proporcion <- (dataframe$total/sum(dataframe$total))*100
  
  medio_proporcion <- cbind.data.frame(dataframe$medio,proporcion)
  names(medio_proporcion) <- c("medio", "proporcion")
  proporcion <- aggregate(medio_proporcion$proporcion, by=list(medio=medio_proporcion$medio), FUN=sum)
  
  proporcion_ordenado <- proporcion[order(-proporcion$x),]
  
  return(head(proporcion_ordenado, 6))
}

graficar <- function(dataframe){
  
  # plot(dataframe$proporcion, dataframe$medio)
  # plot(dataframe$proporcion, dataframe$medio, type = "b")
  grafico<-ggplot(data=dataframe, aes(x=medio, y=proporcion)) + geom_bar(stat="identity")
  grafico
}

medios2014 <- obtener_6_primeros_medios_proporcion(pauta2018_1)
names(medios2014) <- c('medio', 'proporcion')
graficar(medios2014)

# medios2015 <- obtener_10_primeros_medios_proporcion(pauta2015)
# names(medios2015) <- c('medio', 'proporcion')
# medios2016_1 <- obtener_10_primeros_medios_proporcion(pauta2016_1)
# names(medios2016_1) <- c('medio', 'proporcion')
# medios2016_2 <- obtener_10_primeros_medios_proporcion(pauta2016_2)
# names(medios2016_2) <- c('medio', 'proporcion')
# medios2017_1 <- obtener_10_primeros_medios_proporcion(pauta2017_1)
# names(medios2017_1) <- c('medio', 'proporcion')
# medios2017_2 <- obtener_10_primeros_medios_proporcion(pauta2017_2)
# names(medios2017_2) <- c('medio', 'proporcion')
# medios2018_1 <- obtener_10_primeros_medios_proporcion(pauta2018_1)
# names(medios2018_1) <- c('medio', 'proporcion')
# proporcion_10_medios <- data.frame(medios2014, medios2015, medios2016_1, medios2016_2, medios2017_1, medios2018_1)
# write.csv(proporcion_10_medios, file = "proporcion_medios.csv")




