

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

head(jubilaciones)
tail(jubilaciones)

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

head(salario)
tail(salario)


#pre-work actividad ied
#source datos.gob.ar

install.packages("readxl")
library(readxl)
?read_xls
pbi <- read_xls("/home/rstudio/project-objectstorage/pbi_bancomundial.xls", sheet = "ARG", col_names = FALSE)
pbi <- as.data.frame(pbi)
colnames(pbi) <- c("Año", "USD")
head(pbi)
tail(pbi)



