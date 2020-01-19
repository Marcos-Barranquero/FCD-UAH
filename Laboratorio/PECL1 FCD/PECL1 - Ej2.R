### PECL1 - Apartado 2 ###

directorio <- dirname(parent.frame(2)$ofile)
setwd(directorio)

# Cargamos los datos a partir de una tabla Excel .xlsx
# mediante el paquete "xlsx".
# Puede instalarse con install.packages("xlsx")
library(xlsx)
satelites <- read.xlsx("./Datos/satelites.xlsx", 1)
radio <- satelites$radio

cat("\nSatelites ordenados por radio:\n")
print(satelites[order(radio),])

cat("\n")

# Empleamos table() para calcular las frecuencias absolutas
# y prop.table() para frecuencias relativas.
# Usamos data.frame() para manipular la tablas usando nombres de columna
# y para mostrarlo todo en una sola tabla con nombres.
frecAbs <- data.frame(table(radio))
frecAbsAcum <- cumsum(frecAbs["Freq"])
frecRel <- prop.table(frecAbs["Freq"])
frecRelAcum <- cumsum(frecRel["Freq"])

frecuencias <- data.frame(
    frecAbs["radio"],
    frecAbs["Freq"],
    frecAbsAcum["Freq"],
    frecRel["Freq"],
    frecRelAcum["Freq"]
)
names(frecuencias) <- c("Radio", "Absoluta", "Abs. acumulada", "Relativa", "Rel. acumulada")
print(frecuencias)

cat("\n")

# Empleamos el paquete "pastecs" para calcular
# media, mediana, min., max. y medidas de dispersión.
# Puede instalarse con install.packages("pastecs")
library(pastecs)

dispersion <- stat.desc(radio)[c("mean", "var", "std.dev", "range", "min", "max", "median")]
names(dispersion) <- c("Media", "Varianza", "Desv. tipica", "Rango", "Minimo", "Maximo", "Mediana")
print(dispersion)

cat("\n")

# Finalmente, empleamos summary para generar máximo, mínimo, cuartiles y media
# ordenados según aparecen.
# Añadimos el cuantil 54% en su posicion correspondiente.
cuantil54 <- quantile(radio, 0.54)
cuantiles <- c(summary(radio), cuantil54)
cuantiles <- cuantiles[order(unlist(cuantiles))] # Ordenamos el cuantil 54%
print(cuantiles)
