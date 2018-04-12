# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta6: El codigo muestra la escritura y lectura de archivos

# Item a)
# Registros del data frame 'quakes' que corresponden a una magnitud mayor o igual a 5
q5 <- quakes[quakes$mag >= 5,]
# Escribiendo la informacion de 'q5' en el archivo de formato tabla 'q5.txt' 
write.table(x = q5, # objeto a ser escrito
            file = "/home/chia/PracticasR-2018-I/Practica1/q5.txt", # archivo donde se escribira
            sep="!", # cadena que separa los valores en cada fila
            row.names = FALSE)  # no incluimos los nombres de las filas
# Leemos el archivo 'q5.txt' y lo nombramos 'q5.dframe'
q5.dframe <- read.table(file="/home/chia/PracticasR-2018-I/Practica1/q5.txt", # archivo a leer
           header = TRUE, # la primera linea del archivo contiene los nombres de las variables  
           sep = "!") # cadena que separa los valores en cada fila

# Item b)
# Instalando el paquete "car"
install.packages("car")
# Cargando el paquete "car"
library(car)
# Guardamos el grafico como un archivo de extension '.png'
png(filename="/home/chia/PracticasR-2018-I/Practica1/DuncanPlot.png", # nombre del archivo
    width=500, # 500 pixeles de ancho
    height=500) # 500 pixeles de alto
plot.new() # Inicio de un nuevo grafico
# Configuramos el sistema de coordenadas para la ventana de graficos 
plot.window(c(0,100), # Vector numerico de longitud 2 que proporciona el rango de x
            c(0,100)) # Vector numerico de longitud 2 que proporciona el rango de y
# Dibujamos un rectangulo alrededor de la grafica actual
box()
# Agregando los ejes al grafico actual con la funcion 'axis(side)' donde 'side' especifica el lado que se dibujara
axis(1) # 'side' es 1, entonces el lado que se dibujara sera el de abajo (eje x)
axis(2) # 'side' es 2, entonces el lado que se dibujara sera el de la izquierda (eje y)
# Dibujamos la secuencia de puntos en las coordenadas especificadas por la educacion y los ingresos
points(Duncan$education[which(Duncan$prestige <=80)], Duncan$income[which(Duncan$prestige <=80)], # para valores del prestigio menores o iguales a 80
       pch = 1) # simbolo a usar: circulo blanco
points(Duncan$education[-which(Duncan$prestige <=80)], Duncan$income[-which(Duncan$prestige <=80)], # para valores del prestigio mayores a 80
       pch = 16) # simbolo a usar: circulo negro
# Escribimos texto en los margenes de la region de la figura
mtext("Educacion", # texto que se escribira
      side = 1, # Lado del grafico sobre el cual se ubicara el texto (1=abajo)
      line = 3) # Sobre que linea de margen del grafico estara el texto, empezando en 0 y contando hacia afuera
mtext("Ingresos", # texto que se escribira
      side = 2, # Lado del grafico sobre el cual se ubicara el texto (2=izquierda)
      line = 2)
mtext("Ingresos de 45 ocupaciones de los Estados Unidos en 1950\ncomo una funcion de la Educacion", # texto que se escribira
      side = 3, # Lado del grafico sobre el cual se ubicara el texto (3=arriba)
      line = 1, 
      font = 2) #  fuente del texto
# Agregamos una leyenda 
legend(1, 100, # posicion de la leyenda
       legend=c("Prestigio menor o igual a 80", "Prestigio mayor a 80"), # texto de la leyenda
       pch = c(1,16)) # simbolos usados
dev.off() # Apagamos el dispositivo

# Item c)
# Creamos una lista llamada 'exer'
exer <- list(quakes,q5.dframe,Duncan)
# Escribimos el objeto lista 'exer' en el disco llamandolo 'Ejercicio_df.txt'
dput(x = exer, # objeto a ser escrito
     file="/home/chia/PracticasR-2018-I/Practica1/Ejercicio_df.txt") # archivo donde se escribira
# Leemos el archivo 'Ejercicio_df.txt' en nuestro espacio de trabajo y llamamos 'lista.de.dataframes' al objeto resultante
lista.de.dataframes <- dget(file="/home/chia/PracticasR-2018-I/Practica1/Ejercicio_df.txt")
# Verificando que 'lista.de.dataframes' contenga los tres objetos data frames
lista.de.dataframes