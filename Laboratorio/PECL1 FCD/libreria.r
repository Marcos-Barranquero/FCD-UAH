rango <-
function(vector)(max(vector)-min(vector))

frecuencia_absoluta <-
function(vector)(table(" "=vector))

frecuencia_absoluta_acumulada <-
function(vector)(cumsum(frecuencia_absoluta(vector)))

frecuencia_relativa <-
function(vector)(round(frecuencia_absoluta(vector)/length(vector), 4))

frecuencia_relativa_acumulada <-
function(vector)(round(frecuencia_absoluta_acumulada(vector)/length(vector), 4))
