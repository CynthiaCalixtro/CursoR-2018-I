# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta5: El codigo muestra como dibujar un
# diagrama de dispersion simple de los datos de 
# 'pressure' de 2 formas distintas

# Item a)
plot.new() # Inicio de un nuevo grafico
# Configuramos el sistema de coordenadas para la ventana de graficos 
plot.window(range(pressure$temperature), # Vector numerico de longitud 2 que proporciona el rango de x
            range(pressure$pressure)) # Vector numerico de longitud 2 que proporciona el rango de y
# Dibujamos un rectangulo alrededor de la grafica actual
box()
# Agregando los ejes al grafico actual con la funcion 'axis(side)' donde 'side' especifica el lado que se dibujara
axis(1) # 'side' es 1, entonces el lado que se dibujara sera el de abajo (eje x)
axis(2) # 'side' es 2, entonces el lado que se dibujara sera el de la izquierda (eje y)
# Dibujamos la secuencia de puntos en las coordenadas especificadas por las temperaturas y el la presion de mercurio
points(pressure$temperature, pressure$pressure)
# Escribimos texto en los margenes de la region de la figura
mtext("temperatura", # texto que se escribira
      side = 1, # Lado del grafico sobre el cual se ubicara el texto (1=abajo)
      line = 3) # Sobre que linea de margen del grafico estara el texto, empezando en 0 y contando hacia afuera
mtext("presion", # texto que se escribira
      side = 2, # Lado del grafico sobre el cual se ubicara el texto (2=izquierda)
      line = 3)
mtext("Presion de vapor de Mercurio\ncomo una funcion de la Temperatura", # texto que se escribira
      side = 3, # Lado del grafico sobre el cual se ubicara el texto (3=arriba)
      line = 1, 
      font = 2) # fuente del texto

# Item b)
# Cargamos el paquete 'grid'
library(grid)
# Iniciamos en una nueva pagina
grid.newpage()
# Agregamos dos viewports al arbol de viewports del paquete 'grid'
# En el primero, con la funcion 'plotViewport' producimos una ventana de graficos con los margenes especificados 
pushViewport(plotViewport(margins = c(5, 4, 4, 2))) # margenes correspondientes a abajo, izquierda, arriba, derecha
# En el segundo, con la funcion 'dataViewport' producimos una ventana de graficos con escalas de los ejes segun el 
# rango de los datos a dibujar
pushViewport(dataViewport(pressure$temperature, # Rango del eje x
                          pressure$pressure)) # Rango del eje y
# Dibujamos un rectangulo alrededor de la grafica actual
grid.rect()
# Dibujamos la secuencia de puntos en las coordenadas especificadas por las temperaturas y el la presion de mercurio
grid.points(pressure$temperature, pressure$pressure)
# Creamos y dibujamos el eje x
grid.xaxis(at = seq(0,350,50))  # valores de x para las marcas de graduacion en el respectivo eje (Podemos omitir 
                                # especificar estos valores en el argumento 'at' y dejar que R los determine. En 
                                # este caso los especificamos para que la grafica resultante se parezca mas a la 
                                # grafica del Item a)
# Creamos y dibujamos el eje y
grid.yaxis() 
# Escribimos texto en los margenes de la region de la figura
grid.text("temperatura", # texto que se escribira
          y = unit(-3.5, "line")) # ubicacion del texto: a 3.5 'lineas de texto' bajo el eje x
grid.text("presion", # texto que se escribira
          x = unit(-3.5, "line"), # ubicacion del texto: a 3.5 'lineas de texto' a la izquierda del eje y
          rot = 90) # angulo en que se rotara el texto
grid.text("Presion de vapor de Mercurio\ncomo una funcion de la Temperatura", # texto que se escribira
          gp = gpar(font = 2), # fuente del texto establecida mediante un objeto 'gpar'
          y = unit(1, "npc") + unit(2, "lines"))  # ubicacion del texto: a 2 'lineas de texto' arriba de la ventana de
                                                  # graficos. Donde 1 unidad en "npc" es la altura de la ventana de 
                                                  # graficos 