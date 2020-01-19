# Establecemos el directorio de trabajo como el directorio donde se encuentra el script de R
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Usando el modelo multivariante
url <- "https://raw.githubusercontent.com/selva86/datasets/master/ozone.csv" 
ozono <- read.csv(url)  # Leemos el csv desde una URL

modelo <- lm(ozone_reading~., data=ozono)
distancia_cooks <- cooks.distance(modelo)

valor_maximo <- 4*mean(distancia_cooks, na.rm=T)

plot(distancia_cooks, pch="*", cex=2, main="Estudio de valores anómalos con la distancia de Cooks")  # Pintamos la distancia de cooks
abline(h = valor_maximo, col="red")  # Pintamos la linea que separa los datos normales de los outliers
text(x=1:length(distancia_cooks)+1, y=distancia_cooks, labels=ifelse(distancia_cooks>valor_maximo,names(distancia_cooks),""), col="red")  # Añadimos etiquetas para identificar los outliers

outliers <- list() # Creamos la lista para almacenar los outliers

for(i in 1:length(distancia_cooks)){
    if(distancia_cooks[i] > valor_maximo) { # Si los datos estan fuera del rango de valores normales
        outliers <- append(outliers, i) # Se añaden a la lista de anomalos
    }
}

# Sacamos por pantalla la lista de 
matriz <- matrix(unlist(outliers))
cat("Los datos outliers son:\n")
cat(matriz, sep =', ')
cat("\n")