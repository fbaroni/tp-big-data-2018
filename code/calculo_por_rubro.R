source('lectura_datasets.R')
library(ggplot2)
limpiar_total <- function(dataframe){
  if(colnames(dataframe)[3] == 'total_con_iva'){
    colnames(dataframe)[3] <- "total"
  }
  
  if(ncol(dataframe) > 10 && colnames(dataframe)[12] == 'total_con_iva'){
    colnames(dataframe)[12] <- "total"
  }
  
  return(dataframe)
}

graficar_proporcion_rubro <- function(dataframe) {
  dataframe <- limpiar_total(dataframe)
  #Por rubro
  proporcion <- (dataframe$total/sum(dataframe$total))*100
  
  by_rubro <- cbind.data.frame(dataframe$rubro, proporcion)
  
  #arreglar nombre
  names(by_rubro) <- c("rubro", "proporcion")
  
  #suma por clase
  by_grupo_suma <- aggregate(by_rubro$proporcion, by=list(rubro=by_rubro$rubro), FUN=sum)
  
  #ordenar
  by_grupo_suma <- by_grupo_suma[order(-by_grupo_suma$x),]
  
  write.csv(by_grupo_suma, file = "rubro_.csv")
  # #grafico de torta
  # pie(by_grupo_suma$x, by_grupo_suma$rubro)
  # 
  # #grafico barra ggplot
  # plot(by_grupo_suma$x, by_grupo_suma$rubro)
  # plot(by_grupo_suma$x, by_grupo_suma$rubro, type = "b")
  # p<-ggplot(data=by_grupo_suma, aes(x=rubro, y=x)) + geom_bar(stat="identity")
  # p
}
obtener_archvo_rubro_proporcion <- function(dataframe, filename) {
  dataframe <- limpiar_total(dataframe)
  #Por rubro
  proporcion <- (dataframe$total/sum(dataframe$total))*100
  
  by_rubro <- cbind.data.frame(dataframe$rubro, proporcion)
  
  #arreglar nombre
  names(by_rubro) <- c("rubro", "proporcion")
  
  #suma por clase
  by_grupo_suma <- aggregate(by_rubro$proporcion, by=list(rubro=by_rubro$rubro), FUN=sum)
  
  #ordenar
  by_grupo_suma <- by_grupo_suma[order(-by_grupo_suma$x),]
  
  write.csv(by_grupo_suma, file = filename)
}
obtener_archvo_rubro_proporcion(pauta2017_2, 'rubro_2017_2.csv')