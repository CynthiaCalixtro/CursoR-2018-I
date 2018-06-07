# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta7: El codigo muestra  el uso de las funciones 
# 'file', 'close', 'readLines' y el empleo de teoria de 
# probabilidades para la resolucion del ejercicio 

f <- file("stdin") # leyendo la entrada
on.exit(close(f)) # cerrando la conexion

# Leemos las lineas (data)
T <- readLines(f, warn = FALSE)
# El resultado es un vector (T) con dos elementos donde el i-esimo elemento
# es una cadena con la informacion de la i-esima linea leida


# Dividimos la data para obtener cada una de las lineas por separado
# y a la vez dividimos caracter por caracter cada una de las lineas
T <- strsplit(T, "")
# El resultado es una lista con dos vectores de caracteres donde
# cada vector contiene la informacion de una de las lineas

# Almacenamos la informacion la linea 1 en 'Info'
# Almacenamos la informacion la linea 2 en 'A'
Info <- T[[1]] # la informacion que 'B' proporciona
A <- T[[2]] # la informacion que 'A' cree recibir

pos_B = sum(Info == "+") - sum(Info == "-") # posicion de la antena
pos_A = sum(A == "+") - sum(A == "-") # posicion de la antena segun 'A'
dif <- pos_B - pos_A # minima cantidad de "?" que debe tener la cadena de 'A'

x <- sum(A == "?") # cantidad de "?" en la cadena que 'A' cree recibir

# Si, para los posibles valores de "?", asignamos al signo "+" el valor de +1 y 
# al signo "-" el valor de -1, entonces podemos establecer una suma asociada a cada una de 
# las posibles cadenas que se pueden formar de la informacion que 'A' cree recibir
# de la siguiente manera:
# Supongamos que "*" representa una cadena de "+" y "-" de longitud no negativa, luego
# Si x = 1, entonces la cadena de A es: *?*. Lo cual nos da 2 posibles cadenas: *+*,*-*
#					 Y las sumas asociadas a estas cadenas son 1 y -1, respectivamente.
# Si x = 2, entonces la cadena de A es: *?*?*. Lo cual nos da 4 posibles cadenas: *+*+*, *-*+*,*+*-*,*-*-*
#						Y las sumas asociadas a estas cadenas son 2,0,0,-2.
# Y asi, sucesivamente
# Entonces, los elementos en 'seq(x,-x,-2)' son todas las sumas (sin repeticion) asociadas a las
# posibles cadenas que se pueden formar con la informacion que 'A' cree recibir

# La variable logica 'check' devuelve TRUE en la posicion donde uno de los elementos de 'seq(x,-x,-2)' toma el valor de 'dif'
check <- dif == seq(x,-x,-2)  

if (sum(check) == 1){ # Si el valor de 'dif' pertenece al conjunto de las sumas asociadas
                      # entonces, la probabilidad pedida es diferente de 0
  
  # Calculamos los casos totales. Como cada "?" tiene dos posibilidades ("+" o "-")
  # entonces, para una cantidad x de "?" en la cadena de 'A'
  # habran 2^x casos totales
  totales <- 2**x
  
  # Determinamos la cantidad de "+" que debe tener la cadena de 'A' para que pueda colocar la
  # antena en el lugar determinado por 'B'
  if (dif >= 0){
    cant.posi <- dif + (x-dif)/2
  }else{
    cant.posi <- x - (dif + (x-dif)/2)
  }
  
  # Calculamos los casos favorables a partir de que ya conocemos cuantos "+" debe tener la cadena
  # de 'A' para que pueda colocar la antena en el lugar determinado por 'B' y que conocemos tambien la cantidad
  # de "?". Asi, la cantidad de casos favorables vendria dado por la combinatoria de x en cant.posi
  favorables <- choose(x,cant.posi)
  
  # La probabilidad de que 'A' coloque satisfactoriamente la antena es la sgte
  cat(sprintf("%.9f",favorables/totales))
}else{  # Si el valor de 'dif' no pertenece al conjunto de las sumas asociadas
        # entonces, no existira ninguna cadena (generada por la informacion de 'A')
        # con la que 'A' pueda colocar la antena en el lugar indicado por 'B'. 
        # Asi, la probabilidad pedida es 0
  cat(sprintf("%.9f",0))
}
