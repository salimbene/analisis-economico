
while(FALSE){
  print("Hello")
}


c <- 1
while (c < 12){
  print(c)
  c <- c + 1
}

a <- "01-01-65"

substr(a, 7, 8)

salario$fecha[substr(salario$fecha, 7, 8) > 60] <- paste(substr(salario$fecha, 1, 6),19,substr(salario$fecha, 7, 8), sep = "")

b <- paste(substr(a, 1, 6),19,substr(a, 7, 8), sep = "")
b
?substr

substr(a, 7, 8) < 10


salario <- read.csv("/home/rstudio/project-objectstorage/indice-salario-minimo-vital-movil-valores-mensuales-pesos-corrientes-desde-1988.csv", stringsAsFactors = F)
