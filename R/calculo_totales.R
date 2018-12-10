source('lectura_datasets.R')
library(plyr)

total2014 <- sum(pauta2014$total)
proporcion<- (pauta2014$total/sum(pauta2014$total))*100

medio_prop <- cbind.data.frame(pauta2014$medio,proporcion)
names(medio_prop) <- c("medio", "proporcion")
prop <- aggregate(medio_prop$proporcion, by=list(medio=medio_prop$medio), FUN=sum)
newdata <- prop[order(-prop$x),]

print(head(newdata))