

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


#pre-work pbi
#source bancomundial

install.packages("readxl")
library(readxl)
?read_xls

pbi <- read_xls("/home/rstudio/project-objectstorage/pbi_bancomundial.xls", sheet = "ARG", col_names = FALSE)
pbi <- as.data.frame(pbi)
colnames(pbi) <- c("Año", "USD")
head(pbi)
tail(pbi)

#pre-work base monetaria (dias hábiles)
#source banco central
base <- read_xlsx("/home/rstudio/project-objectstorage/base_monetaria_bcra.xlsx")
base <- as.data.frame(base)
colnames(base) <- c("Fecha","PesosM")
tail(base)

#pre-work inflacion mensual (fin de mes)
#source banco central

inflacion <- read_xlsx("/home/rstudio/project-objectstorage/inflacion_variacion_mensual_bcra.xlsx")
inflacion <- as.data.frame(inflacion)
head(inflacion)


#pre-work aux
#source datos.gob.ar
auh <- read.csv("/home/rstudio/project-objectstorage/auh-desde-2009.csv")

colnames(auh) <- c("Fecha", "Pesos")
head(auh)
tail(auh)

tail(base)
library(ggplot2)
ggplot(data=base, aes(x=Fecha, y=PesosM)) + geom_line(size=0.1, colour="DarkGreen")


tail(salario)
ggplot(data=salario, aes(x=Fecha, y=Mensual)) + geom_line(size=0.2, colour="DarkBlue")

ggplot(data=salario[salario$Fecha > "2010-01-01",], aes(x=Fecha, y=Mensual)) + geom_line(size=0.2, colour="DarkBlue")

par(mfrow=c(2,2))
?plot
plot(salario$Fecha,salario$Mensual)
plot(base$Fecha,base$PesosM)

tail(salario)
head(salario)
head(inflacion)

ggplot(data=inflacion, aes(x=Fecha, y=Mensual)) + geom_line(size=0.2, colour="DarkBlue")
