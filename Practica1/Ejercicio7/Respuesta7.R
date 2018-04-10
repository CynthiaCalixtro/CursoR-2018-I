# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta7: El codigo muestra el uso de la funcion which y 
# la manipulacion de los numeros especiales Inf, -Inf, NA, NaN

# Item a)
# Creamos el vector 'f1'
f1 <- c(13563,-14156,-14319,16981,12921,11979,9568,8833,-12968, 8133)
# El vector logico de los indices de los elementos de f1 que al elevarlos a una potencia de 75
# no son infinitos es '!is.infinite(f1**75)'. Entonces, accedemos a estos elementos de la
# siguiente manera:
f1[!is.infinite(f1**75)]
# La funcion 'which(x)' devuelve los indices de los elementos TRUE del vector logico 'x'. Asi, 
# mostramos todos los elementos de f1 excepto los que cumplen la condicion pedida, 'f1**75 == -Inf', 
# de la siguiente manera:
f1[-which(f1**75 == -Inf)]

# Item b)
# Creamos la matriz 'varMatriz'
varMatriz <- matrix(c(77875.40,27551.45,23764.30,-36478.88,-35466.25,-73333.85,36599.69,-70585.69,-39803.81,55976.34,76694.82,47032.00), # vector de datos
                    nrow = 3, # cantidad de filas
                    byrow = TRUE) # la matriz se llena por filas
# Usamos la funcion 'which' para mostrar los indices de las entradas de 'varMatriz' que son 'NaN' cuando 
# 'varMatriz' se eleva a una potencia de 65 y se divide por 'Inf'
which(is.nan(varMatriz**65/Inf), # vector logico
      arr.ind = TRUE) # devuelve los indices de las filas y columnas
# Para acceder a los valores de 'varMatriz' que no son NaN cuando 'varMatriz' se eleva a una potencia de 67 
# y se le adiciona 'Inf' usamos el vector logico '!is.nan(varMatriz**67+Inf)' el cual evalua la condicion pedida
( resul1 <- varMatriz[!is.nan(varMatriz**67+Inf)] )
# Logramos el mismo resultado con la condicion 'varMatriz**67 != -Inf'
( resul2 <- varMatriz[varMatriz**67 != -Inf] )
# Comprobando que 'res1' es igual a 'res2'
resul1 == resul2
# Accediendo a los valores de 'varMatriz' que sean igual a '-Inf' o finito cuando 'varMatriz' se eleva a una 
# potencia de 67 
varMatriz[varMatriz**67 == -Inf | is.finite(varMatriz**67)]

# Item c)
# Creamos el vector 'f2'
f2 <- c(4.3,2.2,NULL,2.4,NaN,3.3,3.1,NULL,3.4,NA)
length(f2) # La longitud de f2 es 8 ya que las entradas 'NULL' tienen longitud 0
which(x = is.na(x = f2)) # Devuelve 4 y 8 ya que la funcion 'is.na' devuelve TRUE para los valores 'NaN' y 'NA'
is.null(x = f2) # Devuelve FALSE ya que f2 tambien contiene elementos que no son NULL






