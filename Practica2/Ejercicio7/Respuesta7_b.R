# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta7.b: El codigo muestra  el uso de las funciones 
# 'file', 'close', 'readLines' y el empleo de teoria de 
# probabilidades para la resolucion del ejercicio 

f <- file("stdin") # leyendo la entrada
on.exit(close(f)) # cerrando la conexion

# Leemos las lineas (data)
T <- readLines(f)
# El resultado es una cadena que contiene la suma de los resultados de 
# Vilma y Esther separados por un espacio

# Dividimos la data para obtener cada uno de las sumas de Vilma y Esther
# por separado
T <- strsplit(T, " ")
# El resultado es una lista con dos cadenas con el valor de las sumas 
# de Vilma y Esther

# Almacenamos la suma de los resultados de Vilma en 'B'
# Almacenamos la suma de los resultados de Esther en 'C'
B <- as.numeric(T[[1]][1])
C <- as.numeric(T[[1]][2]) 

# Hallando el maximo de B y C
if (B >= C){
    max <- B
}else{
    max <- C
}

# Como el experimento es lanzar 3 dados entonces hay 6^3 casos totales 
# ya que cada dado tiene 6 posibles salidas
totales <- 6**3

# Hallando los casos favorables
favorables <- 0
for(i in 1:6){ # lanzamiento del primer dado
    for (j in 1:6){ # lanzamiento del segundo dado
        for (k in 1:6){ # lanzamiento del tercer dado
            A <- i+j+k # suma de los resultados de Jessica
            if (A >= max){ # condicion para que gane Jessica
                favorables <- favorables + 1
            }
        }
    }
}

# La probabilidad (P) de que Jessica gane viene dado por la division:
# P = favorables/totales
# Como debemos expresar P como fraccion irreductible hallamos primero el 'gcd' 
# (greatest common divisor) de los numeros 'favorables' y 'totales'

# Creando la funcion 'gcd'
gcd <- function(x,y) {
    if(y != 0){
        return(gcd(y,x%%y))
    }else{
        return(x)
    }
}

# Almacenamos el 'gcd' (greatest common divisor) de los numeros 'favorables'
# y 'totales' en la variable 'q'
q <- gcd(favorables,totales)

# Luego, dividimos cada uno de los numeros por 'q'
x <- favorables/q
y <- totales/q

# Asi, la probabilidad de que gane Jessica expresada como fraccion irreductible es:
cat(sprintf("%d/%d",x,y))