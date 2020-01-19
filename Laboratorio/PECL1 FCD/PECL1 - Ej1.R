

### PECL1 - Apartado 1 ###

# El primer paso es establecer el working directory como el directorio en el que se encuentra el script de R:
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos las librerias:
source("./libreria.r")  # Libreria con algunas funciones
library(foreign)  # Libreria foreign
library(xtable)

## Parte 1.1 - Satelites ##
cat("\n#################################\n")
cat("######### EJERCICIO 1.1 #########\n")
cat("#################################\n")


# Se importa el archivo y se almacena en una variable:


satelites <- read.table("./Datos/satelites.txt")
# Sacamos la variable con la que queremos trabajar de la tabla:
radio <- satelites$radio

cat("\nSatelites ordenados por radio:\n")
print(satelites[order(radio), ])

# Una vez con ello, procedo a realizar calculos:
# Frecuencias absolutas:
frecuenciaAbsolutaRadio <- frecuencia_absoluta(radio)
frecAbsolutaAcumRadio <- frecuencia_absoluta_acumulada(radio)
print(xtable(frecuenciaAbsolutaRadio))

cat("\nFrecuencias Absolutas:")
print(frecuenciaAbsolutaRadio)
cat("Frecuencias Absolutas Acumuladas:\n")
print(frecAbsolutaAcumRadio)

# Frecuencias relativas:
frecuenciaRelativaRadio <- frecuencia_relativa(radio)
frecuenciaRelarti <-
  frecuencia_relativa_acumulada(radio)

cat("Frecuencias Relativas:")
print(frecuenciaRelativaRadio)
cat("Frecuencias Relativas Acumuladas:\n")
print(frecuenciaRelarti)

# Media aritmetica, desviacion tipica, varianza y rango
mediaAritmeticaRadio <- round(mean(radio), 2)
varianzaRadio <- round(var(radio), 2)
desviacionRadio <- round(sd(radio), 2)
rangoRadio <- rango(radio)

cat("\nMedia aritmetica:\n")
cat(mediaAritmeticaRadio, "\n")
cat("Varianza:\n")
cat(varianzaRadio, "\n")
cat("Desviacion tipica:\n")
cat(desviacionRadio, "\n")
cat("Rango:\n")
cat(rangoRadio, "\n")

# Medidas de ordenacion
medianaRadio <- median(radio)
cuartil1Radio <- quantile(radio, 0.25)
cuartil2Radio <- quantile(radio, 0.50)
cuartil3Radio <- quantile(radio, 0.75)
cuartil4Radio <- quantile(radio, 1.00)
quantil54Radio <- quantile(radio, 0.54)

cat("\nMediana:\n")
cat(medianaRadio, "\n")
cat("Cuartil 1:\n")
print(cuartil1Radio)
cat("Cuartil 2:\n")
print(cuartil2Radio)
cat("Cuartil 3:\n")
print(cuartil3Radio)
cat("Cuartil 4:\n")
print(cuartil4Radio)
cat("Cuantil 54:\n")
print(quantil54Radio)

## Parte 1.2 - Automoviles ##
cat("\n#################################\n")
cat("######### EJERCICIO 1.2 #########\n")
cat("#################################\n")

# Se importa el archivo y se almacena en una variable:
automoviles <- read.spss("./Datos/cardata.sav")

# Sacamos la variable con la que queremos trabajar de la tabla:
mpg <- automoviles$mpg

# Eliminamos los valores NA
mpg <- mpg[!is.na(mpg)]

# Una vez con ello, procedo a realizar calculos:
# Frecuencias absolutas:
frecuenciaAbsolutaMpg <- frecuencia_absoluta(mpg)
frecAbsolutaAcumMpg <- frecuencia_absoluta_acumulada(mpg)

cat("\nFrecuencias Absolutas:")
print(frecuenciaAbsolutaMpg)
cat("Frecuencias Absolutas Acumuladas:\n")
print(frecAbsolutaAcumMpg)

# Frecuencias relativas:
frecuenciaRelativaMpg <- frecuencia_relativa(mpg)
frecuenciaRelAcumMpg <- frecuencia_relativa_acumulada(mpg)


cat("Frecuencias Relativas:")
print(frecuenciaRelativaMpg)
cat("Frecuencias Relativas Acumuladas:\n")
print(frecuenciaRelAcumMpg)

# Media aritmetica, desviacion tipica, varianza y rango
mediaMpg <- round(mean(mpg), 2)
varianzaMpg <- round(var(mpg), 2)
desviacionMpg <- round(sd(mpg), 2)
rangoMpg <- rango(mpg)

cat("\nMedia aritmetica:\n")
cat(mediaMpg, "\n")
cat("Varianza:\n")
cat(varianzaMpg, "\n")
cat("Desviacion tipica:\n")
cat(desviacionMpg, "\n")
cat("Rango:\n")
cat(rangoMpg, "\n")

# Medidas de ordenacion
medianaMpg <- median(mpg)
cuartil1Mpg <- quantile(mpg, 0.25)
cuartil2Mpg <- quantile(mpg, 0.50)
cuartil3Mpg <- quantile(mpg, 0.75)
cuartil4Mpg <- quantile(mpg, 1.00)
quantil54Mpg <- quantile(mpg, 0.54)

cat("\nMediana:\n")
cat(medianaMpg, "\n")
cat("Cuartilil 1:\n")
print(cuartil1Mpg)
cat("Cuartilil 2:\n")
print(cuartil2Mpg)
cat("Cuartilil 3:\n")
print(cuartil3Mpg)
cat("Cuartilil 4:\n")
print(cuartil4Mpg)
cat("Cuantil 54:quantil54Mpg\n")
print(quantil54Mpg)

cat("\n\nErrores del archivo cardata.sav:\n\n")