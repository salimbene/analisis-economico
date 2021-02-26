

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
salario <- read.csv("/home/rstudio/project-objectstorage/indice-salario-minimo-vital-movil-valores-mensuales-pesos-corrientes-desde-1988.csv", stringsAsFactors = F)

#ver estructura
str(salario)

#ver stats
summary(salario)

#renombrar columnas
colnames(salario) <- c("Fecha","Mensual","Diario","Hora")

#converir columna a tipo fecha
salario$Fecha <- as.Date(salario$Fecha) #format = "%d-%m-%Y"

#lala <- salario$Pesos * 21
?as.Date
?strptime
?as.difftime

tail(jubilaciones)
head(salario)

jubilaciones[600, 1] == salario[672, 1]


salario[salario$Fecha == "01-01-95", 1]
jubilaciones[jubilaciones$Fecha == "1995-01-01", 1]

nrow(salario[salario$Fecha > "2022-01-01", ])
head(salario)

salario[salario$Fecha > "2022-01-01", 1] <- salario[salario$Fecha > "2022-01-01", 1] - as.difftime(365, unit="days")



substr(a,1,2)

a <- "123456"
a(0)






print("Pude hacer commit - Ori")
