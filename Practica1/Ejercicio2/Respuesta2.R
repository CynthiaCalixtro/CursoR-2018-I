# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta2: El codigo muestra la creacion y 
# manipulacion de matrices

# Item a)
# Vector de valores que tendra la matriz
a <- c(4.3,3.1,8.2,8.2,3.2,0.9,1.6,6.5)
# Creacion de una matriz a partir del vector 'a'
# Para que los valores del vector 'a' se llenen 
# por fila en la matrix 'Aa' usamos el argumento
# byrow = TRUE
Aa <- matrix(a,nrow = 4, byrow = TRUE) 

# Item b)
# Creamos la matriz 'Ab' a partir de 'Aa' sin su 4ta fila 
Ab <- Aa[-4,]
# Verificamos que la nueva matriz sea de dimension 3x2
dim(Ab)

# Item c)
# Con Aa[,2] accedemos a la segunda columna de Aa,
# entonces, para sobrescribir la segunda columna de Aa
# hacemos:
Aa[,2] <- sort(Aa[,2])
# donde sort(Aa[,2]) ordena de forma creciente (Por defecto
# el argumento decreasing de sort es FALSE)

# Item d)
# Creamos la matriz 'Ad' a partir de 'Aa' eliminado su 4ta
# fila y su 1era columna
Ad <- Aa[-4,-1]
is.matrix(Ad) # Devuelve FALSE, esto quiere decir que 'Ad' no es una matriz
is.vector(Ad) # Devuelve TRUE, esto quiere decir que 'Ad' es un vector
# Para que Ad sea una matriz usemos la funcion 'matrix'
Ad <- matrix(Ad)
# Verificando que Ad sea ahora una matriz de una columna
is.matrix(Ad)

# Item e)
# Con Aa[c(3,4),] accedemos a los 4 elementos inferiores de 'Aa'
# Con estos elementos creamos una nueva matriz 'Ae'
Ae <- Aa[c(3,4),]

# Item f)
# Sobrescribiendo la matriz 'Aa' en las posiciones (4,2),(1,2),(4,1) y (1,1)
# con -1/2 de los dos valores en la diagonal de 'Ae'. Para acceder a la diagonal
# de 'Ae' usamos la funcion 'diag'
Aa[c(4,1,4,1),c(2,2,1,1)] <- -diag(Ae)/2

# Item g)
# Creamos una matriz diagonal con la funcion 'diag'
# que recibe un vector de los elementos que estaran 
# en la diagonal de la matriz
A <- diag(c(2,3,5,-1))
# Para invetir una matriz usamos la funcion 'solve'
# y para crear la matriz identidad de orden 'k' usamos
# diag(k)
# Con esto, podemos verificar que la inversa de A multiplicada
# con A menos la matriz identidad de orden 4 es una matriz
# 4x4 de ceros 
solve(A)*A - diag(4)