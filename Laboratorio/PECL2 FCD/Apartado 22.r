library(arules)

directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

generar_datos <- function(nombre_archivo, lista_articulos, tamano_muestra) 
### Función encargada de generar datos de muestras aleatorios y guardarlos en un
### csv en la ruta dada.
### nombre_archivo -> nombre del archivo .CSV guardado
### lista_articulos -> posibles artículos de la tienda
### tamano_muestra -> nº de muestras (filas) a generar
{
    tamano_lista_articulos=length(lista_articulos)

    # Creo tabla de muestras
    muestra<-matrix(sample(0:1,length(tamano_muestra)*tamano_lista_articulos, replace=TRUE),tamano_muestra,tamano_lista_articulos)

    # La escribo en el csv
    #ruta <- "./"
    write.table(muestra, file=paste("./",nombre_archivo,".csv",sep=""), row.names=FALSE, col.names=FALSE, sep=",")
}

# Artículos y productos de la tienda
lista_articulos <- c("Linea movil",
                     "Linea fija",
                     "ADSL",
                     "Fibra",
                     "Television",
                     "Peliculas",
                     "Fútbol")

# Genero datos aleatorios
generar_datos("datos_aleatorios",lista_articulos, 5)

# Leo los datos generados
datos<-scan("datos_aleatorios.csv",sep=",")

# Cargo matriz adaptada
matriz_datos <- Matrix(datos, ncol=length(lista_articulos), nrow=5, byrow=T, sparse=T, dimnames=list(c(1:5), lista_articulos))

print(matriz_datos)

# Aplico apriori
asociaciones<-apriori(as(t(as(matriz_datos,"nsparseMatrix")), "transactions"), parameter = list(support=0.6,confidence=0.8))

print("-----")

# Veo asociaciones
inspect(asociaciones)
