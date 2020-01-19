library('rpart') # Usamos la libreria rpart

# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Leemos el archivo de texto y lo sacamos por pantalla
datos <- read.table("./datos21.txt")
print(datos)

# Convertimos los datos leidos en un data frame
muestra <- data.frame(datos)

# Clasificamos usando la libreria rpart, que usa el metodo Gini por defecto
clasificacion <- rpart(TipoVehiculo~., data=muestra, method="class", minsplit=1)
print(clasificacion)

# Pintamos el arbol de clasificacion para este ejercicio
plot(clasificacion, uniform=TRUE, main="Arbol de clasificacion para los vehiculos") 
text(clasificacion, use.n=TRUE, all=TRUE, cex=.7, fancy=TRUE, fwidth=0.5, fheight=0.7)
