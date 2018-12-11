rubros_anuales <- read.csv(file="../datasets/rubros-anuales.csv", header=TRUE, sep=",")

#se extrapola el dato de la proporción en los semestres 2014_1, 2014_2, 2015_1, 2015_2
#se duplican los valores ya que son proporciones
rubros_duplicado_2014 <- cbind(rubros_anuales[1:2],  rubros_anuales[2:8])
names(rubros_duplicado_2014)[2] <- 'X2014.1'
names(rubros_duplicado_2014)[3] <- 'X2014.2'

rubros_duplicado_2015 <- cbind(rubros_duplicado_2014[1:4],  rubros_duplicado_2014[4:9])
names(rubros_duplicado_2015)[4] <- 'X2015.1'
names(rubros_duplicado_2015)[5] <- 'X2015.2'

write.csv(rubros_duplicado_2015, file = "../datasets/rubros-semestrales.csv")