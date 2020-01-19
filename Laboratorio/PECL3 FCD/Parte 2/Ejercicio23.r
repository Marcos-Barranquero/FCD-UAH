# Queremos entrenar un clasificador de notas para uso real,
# así que queremos validar si predice correctamente.
# Para esto, hemos preparado un gran conjunto de notas y su clasificación
# y vamos a separarlo de forma aleatoria en dos conjuntos:
# entrenamiento y prueba.
# Tras crear el clasificador con el conjunto de entrenamiento,
# vamos a emplearlo para predecir el conjunto de prueba y
# mostrar su matriz de confusión.

# Para instalar:
#install.packages("rpart")
#install.packages("dplyr")
#install.packages("caret")
#install.packages("e1071") # Dependencia oculta de 'caret'

# Cargamos librerías
library('rpart')
library('dplyr')
library('caret')

# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos la muestra
tablaNotas <- read.table(
    "notas23.txt",
    col.names = c("Teoria1", "Teoria2", "Laboratorio", "Calificacion")
)
notas <- data.frame(tablaNotas)

# Dividimos la muestra en set de entrenamiento y de prueba.
# Usamos una seed fija en el generador de números aleatorios
# para que siempre generemos el mismo documento final.
set.seed(3454)
notas_entrenamiento <- sample_frac(notas, 0.7)
notas_prueba <- setdiff(notas, notas_entrenamiento)

# Entrenamos el clasificador.
clasificacion <- rpart(Calificacion~., data=notas_entrenamiento, method="class", minsplit=1)
print(clasificacion)

# Predecimos el set de prueba.
prediccion <- predict(clasificacion, newdata=notas_prueba, type="class")

# Comprobamos la matriz de precisión: nos interesa el campo 'Accuracy'.
confusion = confusionMatrix(table(prediccion, notas_prueba$Calificacion))
print(confusion)
