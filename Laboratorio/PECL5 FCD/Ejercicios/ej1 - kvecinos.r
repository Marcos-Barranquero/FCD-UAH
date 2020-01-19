# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Ejercicio 1
# Algoritmo K-vecinos
muestra <- matrix(c(4, 4, 4, 3, 5, 5, 1, 1, 5, 4), 2,5)
muestra <- t(muestra)

# Creamos una matriz que almacene las distancias entre puntos de la muestra
distancias <- as.matrix(dist(muestra))
distancias <- matrix(distancias, 5, 5)

# Ordenamos las distancias de menor a mayor
for(i in 1:5){
    distancias[,i] = sort(distancias[,i])
}

distanciasOrdenadas <- distancias

# Si esta a una distancia superior a 2.5, es un dato anomalo
for(i in 1:5){
    if(distanciasOrdenadas[4,i] > 2.5) {
        cat("[", i, "] es un suceso anomalo o outlier\n")
    }
}