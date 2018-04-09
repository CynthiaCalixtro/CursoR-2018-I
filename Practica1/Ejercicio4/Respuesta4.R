# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta4: El codigo muestra como obtener las clases
# de los objetos y como realizar coerciones

# Item a)
f1 <- array(data=1:36,dim=c(3,3,4))
bar <- as.vector(f1)
baz <- as.character(bar)
qux <- as.factor(baz)
quux <- bar+c(-0.1,0.1)
# Identificando las clases de cada objeto
class(f1) # Devuelve 'array'. 
oldClass(f1)  # Como no tiene un atributo de clase entonces se trata de una clase 
              # implicitamente definida
class(bar) # Devuelve 'integer' 
oldClass(bar) # Como no tiene un atributo de clase entonces se trata de una clase 
              # implicitamente definida
class(baz) # Devuelve 'character' 
oldClass(baz) # Como no tiene un atributo de clase entonces se trata de una clase 
              # implicitamente definida
class(qux) # Devuelve 'factor' 
oldClass(qux) # Como tiene un atributo de clase entonces se trata de una clase 
              # explicitamente definida
class(quux) # Devulve 'numeric' 
oldClass(quux)  # Como no tiene un atributo de clase entonces se trata de una clase  
                # implicitamente definida

# Item b)
# Calulamos la suma del resultado de la llamada a 'is.numeric' y a 'is.integer' 
# para cada objeto definido en el item anterior
( res1 <- is.numeric(f1) + is.integer(f1) )
( res2 <- is.numeric(bar) + is.integer(bar) )
( res3 <- is.numeric(baz) + is.integer(baz) )
( res4 <- is.numeric(qux) + is.integer(qux) )
( res5 <- is.numeric(quux) + is.integer(quux) )
# Convirtiendo la coleccion de los cinco resultados anteriores en un factor
fRes <- factor(c(res1,res2,res3,res4,res5), # vector de datos
               levels = c(0,1,2)) # niveles
# Imprimimos el factor
fRes
# Coercionamos el factor en un vector numerico
as.numeric(fRes)
# Comparando los dos ultimos resultados notamos que los valores no coinciden. Esto
# se debe a que cuando se coerciona un factor en un vector numerico nos da como
# resultado los valores que R asigno a cada nivel. En este caso, para el factor 
# 'fRes' R asigno el valor de 1 al nivel 0, 2 al nivel 1 y 3 al nivel 2 

# Item c)
# Creamos el vector 'a' con los datos que tendra la matriz 'A'
a <- c(34,0,1,23,1,2,33,1,1,42,0,1,41,0,2)
# Creamos la matriz 'A' 
A <- matrix(a, # vector de datos
            nrow = 5, # cantidad de filas
            byrow = TRUE) # la matriz se llenara por filas
# Realizamos una coercion de la matriz 'A' a un data frame con la ayuda de la 
# funcion 'as.data.frame'. Ademas, asignamos el data frame resultante a la 
# variable 'Aframe' y la mostramos en pantalla
( Aframe <- as.data.frame(A) )
# Realizamos una coercion de la segunda columna de 'Aframe' para que tenga un 
# valor logico con la ayuda de la funcion 'as.logical'. Para esto accedemos a la
# segunda columna de 'Aframe' con 'Aframe[[2]]'
as.logical(Aframe[[2]])
# Realizamos una coercion de la tercera columna de 'Aframe' para que tenga un 
# valor de factor con la ayuda de la funcion 'as.factor'.
as.factor(Aframe[[3]])