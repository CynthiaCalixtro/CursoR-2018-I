# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta3: El codigo muestra el uso de 
# declaraciones if, if ... else y la funcion
# ifelse

# Item a)
# Creamos dos vectores
vec1 <- c(2,1,1,3,2,1,0)
vec2 <- c(3,8,2,2,0,0,0)
# Como los valores de vec[1] y vec2[2] son 2 y 8, respectivamente. Entonces, el 
# valor de su suma es 10. Por lo cual esta declaracion 'if' si imprime la cadena
if( (vec1[1] + vec2[2]) == 10){ cat("Imprime el resultado!") }
# Como los valores de vec[1] y vec2[1] son 2 y 3, respectivamente. Entonces, el
# valor tanto de 'vec1[1] >= 2' como de 'vec2[1] >=2' es TRUE. Asi, el valor de
# 'vec1[1] >= 2 && vec2[1] >=2' es TRUE. Por lo cual esta declaracion 'if' si 
# imprime la cadena
if(vec1[1] >= 2 && vec2[1] >=2){ cat("Imprime el resultado!") }
# '(vec2-vec1)[c(2,6)]' devuelve (7,-1), los cuales son los elementos de indices
# 2 y 6, respectivamente, del vector resultante al restar 'vec2' con 'vec1'. 
# Entonces, '(vec2-vec1)[c(2,6)]<7' devuelve (FALSE,TRUE). Asi, al pasar este
# vector logico a la funcion 'all', esta devuelve FALSE ya que no todos los 
# elementos de su argumento son TRUE. Por lo cual esta declaracion 'if' no imprime 
# la cadena
if(all((vec2-vec1)[c(2,6)]<7)){ cat("Imprime el resultado!") }
# Como el valor de vec2[3] es 2. Entonces, al pasar este valor a la funcion 
# 'is.na' devolvera FALSE. Asi, '!is.na(vec2[3])' devolvera TRUE. Por lo cual 
# esta declaracion 'if' si imprime la cadena
if(!is.na(vec2[3])){ cat("Imprime el resultado!") }

# Item b)
# La funcion vectorizada 'ifelse' devuelve un vector donde el valor de cada uno de
# sus elemento esta dado segun 'yes' si se cumple el 'test', en caso contrario, 
# esta dado segun 'no'. Asi, el siguiente codigo multiplica los elementos 
# correspondientes de los vectores 'vec1' y 'vec2' si su suma es mayor que 3, de 
# lo contrario, simplemente suma los dos elementos
ifelse(test = vec1+vec2 > 3, yes = vec1*vec2, no = vec1+vec2)

# Item c)
# Creamos la funcion 'myfunction'
myfunction <- function(mymat){ # recibe una matriz de caractes cuadrada
  # vector logico que evalua cuando la cadena de caracteres en la diagonal 
  # comienza con la letra g, minuscula o mayuscula
  test.mymat <- substr(diag(mymat),1,1) == "g" | substr(diag(mymat),1,1) == "G"
  if (any(test.mymat)){ # si cumple el test para al menos un elemento de la diagonal
    # sobrescribimos estas entradas especificas con la cadena "AQUI"
    diag(mymat)[which(test.mymat)] = "AQUI" 
  } else{ # en caso contrario
    # toda la matriz se reemplaza con una matriz identidad de las mismas dimensiones
    mymat = diag(dim(mymat)[1])
  }
  print(mymat)
}
# Probemos nuestra funcion con las siguiente matrices
# Matriz 'mymat1'
( mymat1 <- matrix(as.character(1:16),4,4) )
# Despues de aplicar la funcion a 'mymat1'
myfunction(mymat1)
# Matriz 'mymat2'
( mymat2 <- matrix(c("DANDELION","Hyacinthus","Gerbera",
                  "MARIGOLD","geranium","ligularia",
                  "Pachysandra","SNAPDRAGON","GLADIOLUS"),3,3) )
# Despues de aplicar la funcion a 'mymat2'
myfunction(mymat2)
# Matriz 'mymat3'
( mymat3 <- matrix(c("GREAT","ejercicioss","agua","hey"),2,2,byrow=T) )
# Despues de aplicar la funcion a 'mymat2'
myfunction(mymat3)