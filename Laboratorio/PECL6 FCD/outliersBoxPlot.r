library("readxl") # Libreria para leer archivos de excel
library("ggplot2") # Libreria para hacer plots avanzados

# Establecemos el working directory como el directorio actual
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Leemos los datos desde el excel
datos <- read_excel("Dataset.xlsx")

# Representamos los datos usando caja y bigotes, pudiendo verse los outliers
print(ggplot(datos, aes(Outlet_Identifier, Item_Outlet_Sales)) 
        + geom_boxplot(fill = "red")+ scale_y_continuous("Ventas de articulo", breaks= seq(0,15000, by=500)) 
        + labs(title = "Datos anomalos con Box Plot", x = "Identificador de articulo"))
