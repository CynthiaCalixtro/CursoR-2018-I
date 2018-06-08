# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta2: El codigo muestra los 4 estilos de coincidencia
# de argumentos de la funciones: exacto, parcial, posicional o mixto.

args(array) # Argumentos de la funcion 'array'
array(8:1,dim=c(2,2,2)) # Mixto. Se mezclan los estilos Posicional  para el
                        # argumento 'data' y Exacto (para el argumento 'dim')

args(rep) # Argumentos de la funcion 'rep'
rep(1:2,3) # Posicional

args(seq) # Argumentos de la funcion 'seq'
?seq # Ayuda de R para la funcion 'seq'
seq(from=10,to=8,length=5) # Mixto. Se mezclan los estilos Exacto (para los
                           # argumentos 'from' y 'to') y Parcial (para el 
                           # argumento 'length.out')

args(sort) # Argumentos de la funcion 'sort'
sort(decreasing=T,x=c(2,1,1,2,0.3,3,1.3)) # Exacto

args(which) # Argumentos de la funcion 'which'
which(matrix(c(T,F,T,T),2,2)) # Posicional

args(which) # Argumentos de la funcion 'which'
args(matrix) # Argumentos de la funcion 'matrix'
which(matrix(c(T,F,T,T),2,2),a=T) # Mixto. Se mezclan los estilos Posicional (para los
                                  # argumentos 'x', en which y 'data','nrow' y 'ncol' 
                                  # en matrix) y Exacta (para el argumento 'arr.ind'.