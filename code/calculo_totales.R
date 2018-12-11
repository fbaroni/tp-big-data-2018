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
  
  grafico<-ggplot(data=dataframe, aes(x=medio, y=proporcion)) + geom_bar(stat="identity")
  grafico
}

medios2014 <- obtener_6_primeros_medios_proporcion(pauta2018_1)
names(medios2014) <- c('medio', 'proporcion')
graficar(medios2014)
