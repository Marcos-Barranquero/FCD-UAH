# Insertamos matriz de datos
matriz_datos_iniciales<-matrix(c(4,4,3,5,1,2,5,5,0,1,2,2,4,5,2,1),2,8)

matriz_datos_iniciales<-t(matriz_datos_iniciales)

# Calculamos centroides
centroides <- matrix(c(0,1,2,2),2,2)

centroides <- t(centroides)

# Realizamos clasificación
clasificacion_kmeans = kmeans(matriz_datos_iniciales, centroides, 4)

# Observamos resultados
print(clasificacion_kmeans)

# Separamos en clusters
matriz_datos_clasificados <- cbind(clasificacion_kmeans$cluster, matriz_datos_iniciales)

matriz_cluster1 <- subset(matriz_datos_clasificados, matriz_datos_clasificados[,1]==1)
matriz_cluster2 <- subset(matriz_datos_clasificados, matriz_datos_clasificados[,1]==2)

# Eliminamos columna sobrante
matriz_cluster1<- matriz_cluster1[,-1]
matriz_cluster2<- matriz_cluster2[,-1]

# Imprimimos clusters
print(matriz_cluster1)
print(matriz_cluster2)

 
