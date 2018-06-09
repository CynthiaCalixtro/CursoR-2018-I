# Nombre: Cynthia Calixtro Ames 20150456D
# Respuesta8: El codigo muestra el uso de mensajes de error y de advertencia. Ademas del 
# uso de la funcion 'try' la cual evalua una expresion y atrapa cualquier error que ocurra
# durante la evaluacion de tal manera que el usuario pueda manejar este error.

# Creamos una funcion que invierte cada matriz de una lista
# Argumentos: 
# 'x', lista cuyos elementos se buscara invertir
# 'noninv', para completar los resultados donde los elementos de la matriz en 'x' no pueda invertirse
# 'nonmat', resultado si un elemento de x no es una matriz
# 'silent', valor logico que se pasara a try en el cuerpo del codigo
invertir <- function(x,noninv = NA, nonmat = "no es una matriz!", silent = TRUE){
  if (!is.list(x)){ # si 'x' no es una lista
    stop("'x' no es una lista") # mostramos un mensaje de error
  }
  
  if (length(x) < 1){ # si la longitud de la lista es menor a 1
    stop("'x' no tiene elementos") # mostramos un mensaje de error
  }
  
  if (!is.character(nonmat)){ # si 'nonmat' no es una cadena de caracteres
    warning("'nonmat' no es una cadena de caracteres ---Coercionando 'nonmat'") # mostramos un mensaje de advertencia
    nonmat <- as.character(nonmat) # coercionamos 'nonmat'
  }
  
  # Bucle para recorrer todos los elementos de la lista 'x'
  for (i in 1:length(x)){
    if (is.matrix(x[[i]])){ # si el elemento de 'x' es una matriz 
      res <- try(solve(x[[i]]),silent) # tratamos de invertirla
      if(class(res)=="try-error"){ # si hay un error
        x[[i]] <- noninv # sobrescribimos el elemento de 'x' con el valor de 'noninv'
      }else{ # si no hay un error
        x[[i]] <- res # sobrescribimos el elemento de 'x' con el resultado 'res'
      }
    }else{ # si el elemento de 'x' no es una matriz
      x[[i]] <- nonmat # sobrescribimos el elemento de 'x' con el valor de 'nonmat'.
    }
  }
  return(x) # devolvemos la lista 'x' modificada
}

# Probando la funcion 'invertir'
# Primer prueba
x <- list(1:4,matrix(1:4,1,4),matrix(1:4,4,1),matrix(1:4,2,2))
invertir(x)
# Segunda prueba
invertir(x, noninv = Inf, nonmat = 666)
# Tercera prueba
invertir(x, noninv = Inf, nonmat = 666,silent = FALSE)
# Cuarta prueba
x <- list(diag(9),matrix(c(0.2,0.4,0.2,0.1,0.1,0.2),3,3),
          rbind(c(5,5,1,2),c(2,2,1,8),c(6,1,5,5),c(1,0,2,0)),
          matrix(1:6,2,3),cbind(c(3,5),c(6,5)),as.vector(diag(2)))
invertir(x, noninv = "matriz inadecuada")
# Quinta prueba
x <- "hola"
invertir(x)
# Sexta prueba
x <- list()
invertir(x)