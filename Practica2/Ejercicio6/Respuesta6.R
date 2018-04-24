# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta6: El codigo muestra el uso de los bucles implicitos

# Item a)
# Creamos la lista 'matlist'
matlist <- list(matrix(c(T,F,T,T),2,2),
                matrix(c("a","c","b","z","p","q"),3,2),
                matrix(1:8,2,4))
# Mostramos la lista 'matlist'
matlist
# Hacemos un bucle explicito para sobrescribir los miembros de la lista
# con sus respectivas transpuestas
for(i in 1:length(matlist)){
  matlist[[i]] <- t(matlist[[i]])
}
# Mostramos la lista 'matlist' despues del bucle explicito
matlist
# Convertimos el bucle anterior en uno implicito utilizando la funcion 'lapply'
matlist <- lapply(matlist, # lista
                  FUN = t) # funcion a aplicar sobre cada elemento de la lista
# Mostramos la lista 'matlist' despues de usar 'lapply'
matlist

# Item b)
# Creamos el array 'qux' de dimensiones 4 × 4 × 2 × 3, es decir, una matriz 
# tetradimensional compuesta de tres bloques, siendo cada bloque una matriz 
# compuesta por dos capas de matrices de 4 × 4
qux <- array(96:1, # elementos del array
             dim=c(4,4,2,3)) # dimension del array
# Hacemos un bucle implicito utilizando la funcion 'apply' para obtener los
# elementos diagonales de todas las matrices de segunda capa 
apply(qux[,,2,], # segunda capa de 'qux'
      MARGIN = 3, # la dimension de 'qux[,,2,]' sobre la cual sera aplicada la funcion definida en 'FUN'  
      FUN = diag) # funcion a aplicar
# Hacemos un bucle implicito utilizando la funcion 'apply' para obtener las 
# dimensiones de cada una de las tres matrices formadas accediendo a la cuarta 
# columna de cada matriz en 'qux', independientemente de la capa o bloque, 
# enlazado por otro bucle implicito (apply) que encuentre la suma de filas de esa 
# estructura, resultando en el siguiente vector
apply(apply(qux[,4,,], # accedemos a la cuarta columna de 'qux'
            MARGIN = 3, # la dimension de 'qux[,4,,]' sobre la cual sera aplicada la funcion 'dim'
            FUN = dim), 
      MARGIN = 1, # la dimension de la matriz resultante en apply sobre la cual sera aplicada la funcion 'sum'
      FUN = sum)