# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta1: El codigo muestra como obtener los elementos contenidos
# en un determinado paquete y obtener el entorno que posse algunas
# funciones

# Item a)
# Elementos contenidos en el paquete 'methods'
ls("package:methods")
# Identificamos los primeros 20 elementos
ls("package:methods")[1:20]
# Cantidad total de elementos
length(ls("package:methods"))

# Item b)
# Entorno que posee la fucnion 'read.table'
environment(read.table)
# Entorno que posee la fucnion 'data'
environment(data)
# Entorno que posee la fucnion 'matrix'
environment(matrix)
# Entorno que posee la fucnion 'jpeg'
environment(jpeg)

# Item c)
# Verificando que la funcion 'smoothScatter' es parte del paquete 'graphics'.
# 'check' es un vector logico que contiene 'FALSE' en las posiciones donde
# no se cumple la condicion y 'TRUE' donde si se cumple
check <- ls("package:graphics") == "smoothScatter"
# La funcion 'any' devuelve 'TRUE' si hay al menos un elemento 'TRUE' en el
# vector logico 'check'
any(check)