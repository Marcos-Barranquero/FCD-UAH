# k-vecinos con entrenamiento
# la librería kknn realiza clasificación de k-vecinos usando un training set
# después se puede aplicar a un test set
# install.packages("kknn")
library(kknn)

# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Utilizo librería que viene por defecto en R 
Data<-iris

# Cargo una muestra
Muestra <- sample(1:150, 50)

# Set de testeo
conjunto_test <- Data[Muestra, ]

# Set de aprendizaje
conjunto_aprendizaje <- Data[-Muestra, ]

# Ejecuto algoritmo y entreno modelo
modelo <- train.kknn(Species ~ ., data = conjunto_aprendizaje, kmax = 9)

# Estudio lo bien que ha entrenado
resultado_prediccion <- predict(modelo, conjunto_test[, -5])

# Matriz de confusión
matriz_confusion <- table(conjunto_test[, 5], resultado_prediccion)
print(matriz_confusion)

# Precisión
acierto <- (sum(diag(matriz_confusion)))/sum(matriz_confusion)
cat("Acierto: ", acierto, "\n")

# Error
error <- 1 - acierto
cat("Error: ", error, "\n")

# Calidad de la clasificación en función del nº de vecinos
plot(modelo)