# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)


# Ejercicio 4 
# Análisis de datos anómalos sobre regresión


# Cargo datos
muestra <- t(matrix(c(3,2,3.5,12,4.7,4.1,5.2,4.9,7.1,6.1,6.2,5.2,4,5.3), 2, 7, dimnames = list(c("r","d"))))

muestra = data.frame(muestra)

# Calculo regresión
regresion = lm(muestra$d~muestra$r)

# Extraigo residuos 
residuos = summary(regresion)$residuals
print(residuos)

# Calculo el error estándar, en función del vector.
error_estandar = sqrt(sum(residuos**2)/length(muestra$d))

# Grado igual que el ejercicio de clase
grado_outlier = 1.5

dsr = grado_outlier * error_estandar

# Sorpresa sale lo mismo que en clase
for (i in 1:length(muestra$r))
{
    if(abs(residuos[i]) > dsr)
    {
        cat("El dato", muestra$d[i], "es un outlayer. \n")
    }
}