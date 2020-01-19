# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)


# Ejercicio 2
# Método de caja y bigotes

# Cargo datos
muestra <- t(matrix(c(3, 2, 3.5, 12, 4.7, 4.1, 5.2, 4.9, 7.1, 6.1, 6.2, 5.2, 14, 5.3), 2, 7, dimnames = list(c("r","s"))))

muestra = data.frame(muestra)

# Ejecuto algoritmo caja y bigotes. 
# No dibujamos
boxplot(muestra$r, range=1.5, plot = FALSE)

# Como boxplot es una función de caja negra, lo hacemos también a mano

# Calculo cuantiles
q1 <- quantile(muestra$r, 0.25)
q3 <- quantile(muestra$r, 0.75)

# Calculo el intervalo de datos normales
s = 1.5
intervalo <- c(q1 - s * (q3 - q1), q1 + s*(q3-q1))

# Compruebo para cada dato si se encuentra en el intervalo
for (i in 1:length(muestra$r))
{
    # si se sale del intervalo, es un outlayer
    if(muestra$r[i] < intervalo[1] || muestra$r[i] > intervalo[2])
    {
        cat("El dato", muestra$r[i], "es un outlayer.")
    }

}

