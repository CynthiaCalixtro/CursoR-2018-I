# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta8: El codigo muestra la creacion y
# manipulacion de data frames

# Item a)
# Creando el data frame 'dframe'
dframe <- data.frame(persona = c("Stan","Francine","Steve","Roger","Hayley","Klaus"), # vector de caracteres
                     sexo = factor(c("M","F","M","M","F","M")), # factor con niveles "F" y "M"
                     puntuacion = factor(c("Alto","Medio","Bajo","Alto","Medio","Medio"), levels = c("Alto","Medio","Bajo")), # factor
                     stringsAsFactors = FALSE) # los vectores de caracteres no se consideran factores automaticamente

# Item b)
# Creando el vector que contiene las edades de las personas
edad <- c(41,41,15,1600,21,60)
# Agregando estos datos como una nueva variable columna numerica en 'dframe'
dframe$edad <- edad

# Item c)
# Creando el data frame 'misdatos'
misdatos <- data.frame(persona = c("Peter","Lois","Megs","Chris","Stewie"), # vector de caracteres
                       edad = c(42,40,17,14,1), # edad de las personas
                       sexo = factor(c("M","F","F","M","M")), # factor con niveles "F" y "M"
                       stringsAsFactors = FALSE) # los vectores de caracteres no se consideran factores automaticamente
# Reordenamos las variables de columna en 'dframe' para ajustarlos al data frame 'misdatos'
dframe <- dframe[,c(1,4,2,3)]

# Item d)
# Agregando la variable 'edad.mom' como nueva columna en 'misdatos'
misdatos$edad.mom <- misdatos$edad*12
# Creando una nueva version de 'misdatos' llamada 'misdatos2' eliminando la columna 'edad.mom'
misdatos2 <- misdatos[,-4]

# Item e)
# Agregando la variable 'puntuacion' como nueva columna en 'misdatos2'
misdatos2$puntuacion <- factor(c("Medio","Bajo","Bajo","Medio","Alto"), levels = c("Alto","Medio","Bajo"))
# Combinando por filas 'misdatos2' con 'dframe' con la funcion 'rbind'. Al resultado lo llamamos 'misdatosframe'
misdatosframe <- rbind(misdatos2, dframe)
