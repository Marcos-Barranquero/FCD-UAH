# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos los datos
planetas <- read.table("./planetas.txt")
print(planetas)

# Hacemos el estudio de la regresion
regresion = lm(D~R, data=planetas)
print(regresion)