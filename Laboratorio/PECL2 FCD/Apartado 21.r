library("arules") # Libreria arules

# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

datos <- read.transactions("datos.txt", sep=" ")
print(as(datos, "ngCMatrix"))
soporte <- apriori(datos)
inspect(soporte)


