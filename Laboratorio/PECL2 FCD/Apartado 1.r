# Cargamos librería arules que contiene algoritmo apriori
library("arules")

# Establecemos directorio activo
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos matriz
matriz_datos<-Matrix(c(1,1,0,1,1,1,1,1,1,0,1,1,0,1,0,1,0,1,1,0,1,1,0,0,0,0,0,0,1,0)
,6,5,byrow=T,dimnames=list(c("suceso1","suceso2","suceso3","suceso4","suceso5","suceso6")
,c("Pan","Agua","Cafe","Leche","Naranjas")),sparse=T)


# Convertimos la matriz para poder aplicar apriori
muestra<-as(matriz_datos,"nsparseMatrix")
transpuestaMatriz<-t(muestra)
transacciones<-as(transpuestaMatriz, "transactions")

# Aplicamos el algoritmo apriori con s>=50% y c>=80%
asociaciones<-apriori(transacciones, parameter=list(support=0.5,confidence=0.8))
# Lo sacamos por pantalla
inspect(asociaciones)
