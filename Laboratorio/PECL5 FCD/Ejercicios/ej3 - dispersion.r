# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)


# Ejercicio 3
# Analisis de datos anomalos usando medidas de dispersion
muestra <- t(matrix(c(3, 2, 3.5, 12, 4.7, 4.1, 5.2, 4.9, 7.1, 6.1, 6.2, 5.2, 14, 5.3), 2, 7, dimnames=list(c("r", "d"))))
muestra <- data.frame(muestra)

# Calculamos el intervalo de datos normales usando la desviacion
intDesv <- c(mean(muestra$d) - 2*sd(muestra$d), mean(muestra$d) + 2*sd(muestra$d))
sdd <- sqrt(var(muestra$d) * (length(muestra$d)-1 / length(muestra$d)))

# Comprobamos en bucle que los sucesos se encuentren dentro del intervalo definido
for(i in 1:length(muestra$d)){
    # Si estan fuera del rango, imprimimos el suceso por pantalla
    if(muestra$d[i] < intDesv [1] || muestra$d[i] > intDesv [2]) {
        cat("El suceso [" , i, "] = ", muestra$d[i] , "es un suceso anomalo o outlier\n")
    }
}