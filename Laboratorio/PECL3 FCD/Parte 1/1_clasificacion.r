
library('rpart')
library('tree')

# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Trabajo con datos y la libreria rpart
calificaciones <- read.table("./calificaciones.txt")
#print(calificaciones)

muestra <- data.frame(calificaciones)

# Clasificamos usando la funcion rpart
clasificacion <- rpart(Calificacion~., data=muestra, method="class", minsplit=1)
print(clasificacion)
print("-----------------")

# Clasificamos usando la funcion tree
calificaciontree <- tree(Calificacion~., data=muestra, mincut=1, minsize=2)
print(calificaciontree)


