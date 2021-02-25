

# pre-work jubilaciones mínimas desde 1971
#source datos.gob.ar
jubilaciones <- read.csv("/home/rstudio/project-objectstorage/jubilacion-minima-desde-1971.csv")

#ver structura
str(jubilaciones)

#ver stats
summary(jubilaciones)

#renombrar columnas
colnames(jubilaciones) <- c("Fecha","Pesos")

#converir columna a tipo fecha
jubilaciones$Fecha <- as.Date(jubilaciones$Fecha)

head(jubilaciones, 5)
tail(jubilaciones, 5)

#pre-work salario minimo desde 1988
#source datos.gob.ar
salario <- read.csv("/home/rstudio/project-objectstorage/indice-salario-minimo-vital-movil-valores-mensuales-pesos-corrientes-desde-1988.csv")

#ver estructura
str(salario)

#ver stats
summary(salario)

#renombrar columnas
colnames(salario) <- c("Fecha","Mensual","Diario","Hora")

#converir columna a tipo fecha
salario$Fecha <- as.Date(salario$Fecha)

#lala <- salario$Pesos * 21


head(salario, 5)
tail(salario, 10)

salario[salario$Fecha == "01-01-95", ]
jubilaciones[jubilaciones$Fecha == "1995-01-01", ]

print("Pude hacer commit - Ori")
