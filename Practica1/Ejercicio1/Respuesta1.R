# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta1: El codigo muestra la creacion y 
# manipulacion de vectores

# Item a)
# La secuencia inicia en 5 y va disminuyendo en 0.3 hasta 11 (sin incluirlo)
x <- seq(5,-11,by = -0.3) 

# Item b)
# Para invertir la secuencia invertiremos el vector de indices
# El vector de indices para x es 1:length(x), podemos invertirlo de
# dos formas
# Primera forma:
length(x)+1-1:length(x)
# Segunda forma:
sort(1:length(x),decreasing = T)
# Luego usariamos el vector de indices invertido para acceder a
# los elementos de x y así poder invertir x.
# Secuencia de x en orden invertido (primera forma):
x1 <- x[length(x)+1-1:length(x)]
# Secuencia de x en orden invertido (segunda forma):
x2 <- x[sort(1:length(x),decreasing = T)]
# Finalmente, sobreescribiriamos x usando cualquiera de los
# x_i:
x <- x1

# Item c)
y <- c(-1,3,-5,7,-9)
# Repetimos el vector (times) y 2 veces, cada (each) elemento repetido 10 veces
yrep <- rep(y,times=2,each=10)
# Ordenamos yrep de mayor a menor, es decir, de forma decreciente (decreasing = TRUE)
yord <- sort(yrep, decreasing = TRUE)
# Mostramos el resultado
print(yord)

# Item d)
# Secuencia de enteros de a 6 a 12 (incluyendolos)
d1 <- 6:12
# Repeticion de 5.3 3 veces (times)
d2 <- rep(5.3,times = 3)
# El numero 3
d3 <- 3
# Secuencia de 9 valores (length) que comienza en 102
d4 <- seq(102,length(yrep),length.out = 9)
# Concatemos d1, d2, d3 y d4 usando la funcion 'c' 
d <- c(d1,d2,d3,d4)
# Comprobamos que la longitud de d es 20
length(d)
