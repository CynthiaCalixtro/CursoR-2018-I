# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta3: El codigo muestra la creacion y
# manipulacion de factores

# Item a)
# Creacion de un vector con los sexos de cada uno de los 20 habitantes:
# 1ro.- Creamos un vector de 20 caracteres "M"
sexo <- rep_len("M",20)
# 2do.- Accedemos a las posiciones donde corresponde el caracter "F" y 
#       asignamos dicho caracter
sexo[c(1,5:7,12,14:16)] <- "F"
# Creacion de un vector con los partidos con los que cada uno de los 20 
# habitantes se identifica mas:
# 1ro.- Creamos un vector de 20 elementos cada uno con el valor "Nacional"
partido <- rep_len("Nacional",20)
# 2do.- Accedemos a las posiciones donde corresponden los valores de los 
#       otros partidos politicos ("Laborista","Maori","Verdes" y "Otros") y 
#       asignamos dichos valores
partido[c(1,4,12,15,16,19)] <- "Laborista" 
partido[c(6,9,11)] <- "Verdes"
partido[c(10,20)] <- "Otros"

# Item b)
# Creacion del factor 'fsexo' usando los datos del vector 'sexo'
fsexo <- factor(sexo)
# Creacion del factor 'fpartido' usando los datos del vector 'partido'
fpartido <- factor(partido)
# Veamos los niveles de cada factor
levels(fsexo)
levels(fpartido)
# No tiene sentido usar 'ordered = TRUE' con estos factores ya que sus 
# niveles son categorias sin un orden natural. Podriamos usar 
# 'ordered = TRUE', por ejemplo, en un factor de niveles: "chico", "medio" 
# y "grande" los cuales si tienen un orden natural.
# Los valores de los factores se almacenan como enteros unicos. Estos 
# valores pertenecen a un determinado grupo o categoria conocidos como 
# niveles. Por defecto, R muestra a los factores en orden alfabetico. 
# Entonces, para el factor 'fpartido' R asignara 1 al nivel "Laborista", 
# 2 al nivel "Nacional", 3 al nivel "Otros" y 4 al nivel "Verdes". 
# Comprobemos esto:
as.numeric(fpartido)
# Y para el factor 'fsexo' R asignara 1 al nivel "F" y 2 al nivel 
# "M". Comprobemos esto:
as.numeric(fsexo)

# Item c)
# Los elementos del vector logico 'as.numeric(fsexo) == 2' son TRUE
# para los indices donde 'fsexo' toma el valor "M" (al cual R asigno como 2)
# en otro caso son FALSE. Asi, el factor de los partidos elegidos solo
# por hombres es el siguiente:
fpartido[as.numeric(fsexo) == 2]
# Los elementos del vector logico 'as.numeric(fpartido) == 2' son TRUE
# para los indices donde 'fpartido' toma el valor "Nacional" (al cual R 
# asigno como 2) en otro caso son FALSE. Asi, el factor de los generos para
# quienes elegieron solo el partido "Nacional" es el siguiente:
fsexo[as.numeric(fpartido) == 2]

# Item d)
# Resultados de la encuesta de otras 6 personas
partido2 <- c("Nacional","Maori","Maori","Laborista","Verdes","Laborista")
sexo2 <- c("M","M","F","F","F","M")
# Agregamos los resultados de los ultimos encuestados
fsexo <- factor((c(as.vector(fsexo),sexo2)))
fpartido <- factor(c(as.vector(fpartido),partido2))
# Ahora, para el factor 'fpartido' R asignara 1 al nivel "Laborista", 
# 2 al nivel "Maori", 3 al nivel "Nacional", 4 al nivel "Otros" y 5 al
# nivel "Verdes". Comporbamos esto:
as.numeric(fpartido)
# Creando un vector con los valores de los porcentajes del nivel de confianza
# en que los Laboristas ganaran mas escanios en el parlamento que los Nacionales
porcentajeConf <- c(93, 55,29, 100, 52,84, 56, 0,33, 52, 35,53, 55, 46,40, 56, 45,64, 31, 10,29, 40, 95,18, 61, 10)
# A partir de este vector creamos el factor 'nivelesConf'. Donde los niveles
# de confianza son: "Bajo" para valores en [0,30], "Moderado" para valores en (30,70] y
# "Alto" para valores en (70,100]
nivelesConf <- cut(porcentajeConf, # vector de datos
                   breaks = c(0,30,70,100), # limites de los intervalos
                   labels = c("Bajo","Moderado","Alto"), # etiquetas de los niveles
                   include.lowest = TRUE) # el primer intervalo es cerrado
# Los elementos del vector logico 'as.numeric(fpartido) == 1' son TRUE para 
# los indices donde 'fpartido' toma el valor "Laborista" (al cual R asigno 
# como 1) en otro caso son FALSE. Asi, los niveles de los individuos que
# originalmente dijeron que se identificaban con el partido "Laborista" son: 
nivelesConf[as.numeric(fpartido) == 1]
# Los elementos del vector logico 'as.numeric(fpartido) == 3' son TRUE para 
# los indices donde 'fpartido' toma el valor "Nacional" (al cual R asigno 
# como 3) en otro caso son FALSE. Asi, los niveles de los individuos que
# originalmente dijeron que se identificaban con el partido "Nacional" son: 
nivelesConf[as.numeric(fpartido) == 3]
# Esto quiere decir que las personas que se identifican mas con el partido
# "Laborista" tienen mayor confianza en su partido que las personas que se
# identifican con el partido "Nacional"