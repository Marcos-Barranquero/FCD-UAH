library("readxl") # Libreria para leer archivos de excel
library("ggplot2") # Libreria para hacer plots avanzados

# Establecemos el working directory como el directorio actual
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Leemos los datos desde el excel
datos <- read_excel("Dataset.xlsx")

# Representamos los datos con un Heat Map
print(ggplot(datos, aes(Outlet_Identifier, Item_Type))
        + geom_raster(aes(fill = Item_MRP))
        + labs(title ="Heat Map", x = "Identificador de outlet", y = "Tipo de articulo")
        + scale_fill_continuous(name = "MRP"))