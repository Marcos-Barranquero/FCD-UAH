
# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos los datos y los dividimos en 4 muestras
datos <- read.table("./datos22.txt", header=TRUE) 
muestras <- split(datos, factor(sort(rank(row.names(datos))%%4))) 

# Realizamos la regresion para cada muestra
cat("Muestra 1: \n\n")
print(muestras[[1]])
regresion1 = lm(Y~X, data=muestras[[1]])
print(regresion1)

cat("\nMuestra 2: \n\n")
print(muestras[[2]])
regresion2 = lm(Y~X, data=muestras[[2]])
print(regresion2)

cat("\nMuestra 3: \n\n")
print(muestras[[3]])
regresion3 = lm(Y~X, data=muestras[[3]])
print(regresion3)

cat("\nMuestra 4: \n\n")
print(muestras[[4]])
regresion4 = lm(Y~X, data=muestras[[4]])
print(regresion4)

# Pintamos las graficas resultantes de las regresiones
par(mfrow=c(2,2))
plot(muestras[[1]]$X, muestras[[1]]$Y, main="Muestra 1", xlab="x", ylab="y")
abline(regresion1, col="red")
plot(muestras[[2]]$X, muestras[[2]]$Y, main="Muestra 2", xlab="x", ylab="y")
abline(regresion2, col="red")
plot(muestras[[3]]$X, muestras[[3]]$Y, main="Muestra 3", xlab="x", ylab="y")
abline(regresion3, col="red")
plot(muestras[[4]]$X, muestras[[4]]$Y, main="Muestra 4", xlab="x", ylab="y")
abline(regresion4, col="red")
mtext(expression(paste(bold("Comparativa de rectas de regresion de las muestras"))),
         side = 3, line = -2, outer = TRUE)
