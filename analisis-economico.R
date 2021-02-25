

# pre-work jubilaciones mínimas desde 1971
jubilaciones <- read.csv("/home/rstudio/project-objectstorage/jubilacion-minima-desde-1971.csv")

#ver structura
str(jubilaciones)

#ver stats
summary(jubilaciones)

#renombrar columnas
colnames(jubilaciones) <- c("Fecha","Pesos")

#converir columna a tipo fecha
jubilaciones$Fecha <- as.Date(jubilaciones$Fecha)


head(jubilaciones, 10)

tail(jubilaciones,5)
