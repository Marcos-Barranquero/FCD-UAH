library(jpeg)
library(ggplot2)

# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)


# Leemos imagen
imagen <- readJPEG(normalizePath('amarillo.jpg'))

# Obtenemos dimensión de la imagen
dimensionesImg <- dim(imagen)

# Asignamos colores RGB de la imagen
imgRGB <- data.frame(
  x = rep(1:dimensionesImg[2], each = dimensionesImg[1]),
  y = rep(dimensionesImg[1]:1, dimensionesImg[2]),
  R = as.vector(imagen[,,1]),
  G = as.vector(imagen[,,2]),
  B = as.vector(imagen[,,3])
  )

# Realizamos el clustering
nClusters <- 4
kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = nClusters)
nColores <- rgb(kMeans$centers[kMeans$cluster,])

# Creamos plot
show(ggplot(data = imgRGB, aes(x = x, y = y)) + 
  geom_point(colour = nColores) +
  labs(title = paste("K-Means realizado con ", nClusters, " clusters. ")) +
  xlab("x") +
  ylab("y"))

# Dumpeamos en una imagen
ggsave("clusteres4.png")

