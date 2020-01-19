library("readxl") # Libreria para leer archivos de excel
library("ggplot2") # Libreria para hacer plots avanzados

# Establecemos el working directory como el directorio actual
directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Leemos los datos desde el excel
datos <- read_excel("Dataset.xlsx")

# Representamos los datos con un gráfico de dispersión
print(ggplot(datos, aes(Item_Visibility, Item_MRP)) 
    + geom_point(aes(color = Item_Type)) 
    + scale_x_continuous("Visibilidad de los articulos", breaks = seq(0,0.35,0.05))
    + scale_y_continuous("MRP de los articulos", breaks = seq(0,270,by = 30))
    + theme_bw() + labs(title="Estudio de la relacion entre variables con Scatterplot"))