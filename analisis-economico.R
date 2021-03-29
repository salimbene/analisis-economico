

# pre-work jubilaciones mínimas desde 1971
#source datos.gob.ar
jubilaciones <- read.csv("/home/rstudio/project-objectstorage/jubilacion-minima-desde-1971.csv")
#install.packages("cartography")
#install.packages("sf", repos = "https://mac.r-project.org/")
#install.packages('/Users/matisalimba/Download/sf_0.9-7.tgz',repos = NULL, type = "source")
#install.packages("devtools")
#devtools::install_local('/Users/matisalimba/Downloads/sf_0.9-7.tgz')


library(readxl)
library(scales)
library(ggplot2)
library(shiny)

setwd('/home/rstudio/project-objectstorage/')

jubilaciones <- read.csv("jubilacion-minima-desde-1971.csv")
salario <- read.csv("indice-salario-minimo-vital-movil-valores-mensuales-pesos-corrientes-desde-1988.csv", stringsAsFactors = F)
auh <- read.csv("auh-desde-2009.csv")
pbi <- read_xls("pbi_bancomundial.xls", sheet = "ARG", col_names = FALSE)
base <- read_xlsx("base_monetaria_bcra.xlsx")
inflacion <- read_xlsx("inflacion_variacion_mensual_bcra.xlsx")
dolar <- read_xlsx("dolar_oficial_bcra.xlsx")
blue <- read.csv("dolar_paralelo_desde2009.csv")

str(blue)
?read.csv

base <- as.data.frame(base)
inflacion <- as.data.frame(inflacion)
pbi <- as.data.frame(pbi)
dolar <- as.data.frame(dolar)

colnames(auh) <- c("Fecha","Pesos")
auh$Fecha <- as.Date(auh$Fecha)

colnames(inflacion) <- c("Fecha","Pesos")
inflacion$Fecha <- as.Date(inflacion$Fecha)

colnames(base) <- c("Fecha","Pesos")
base$Fecha <- as.Date(base$Fecha)

colnames(jubilaciones) <- c("Fecha","Pesos")
jubilaciones$Fecha <- as.Date(jubilaciones$Fecha)

colnames(pbi) <- c("Fecha","Pesos")
colnames(dolar) <- c("Fecha","Pesos")
colnames(blue) <- c("Fecha", "Compra", "Venta")
dolar$Fecha <- as.Date(dolar$Fecha)
blue$Fecha <- as.Date(blue$Fecha, format = "%m-%d-%Y")
head(blue)

head(pbi) #anual desde 1060

head(salario) #mensual, diario, por hora desde 1965
head(jubilaciones) #mensual desde 1971
head(inflacion) #mensual a fin de mes desde 1943
head(base,10) #dias hábiles desde 1996
head(auh) #mensual desde 2009
head(blue) #dolar paralelo desde 209 diario
head(dolar) #diario desde 2010 diario

#mask <- jubilaciones$Fecha >= "2009-11-01"
#head(jubilaciones[mask,])

str(blue)

ggplot() +
  geom_point(data=dolar, aes(x=Fecha, y=Pesos), colour="green", size=.5) + 
  geom_line(data=blue, aes(x=Fecha, y=Compra), colour="blue") +
  coord_cartesian(xlim=c(as.Date("1990-01-01"),as.Date("2021-01-01")))


server = function(input, output, session){
  
  base1 <- reactive({
    dolar[dolar$Fecha <= input$sliderBase,]
  })
  
  data2 <- reactive({
    blue[blue$Fecha <= input$sliderBase,]
  })
  
  output$ggplot <- renderPlot({
    ggplot() + 
      geom_point(data=base1(), aes(x=Fecha, y=Pesos), colour="green", size=.5) + 
      geom_line(data=base2(), aes(x=Fecha, y=Compra), colour="blue") +
      coord_cartesian(xlim=c(as.Date("1996-02-01"),as.Date("2021-01-28")), ylim=c(0,2683991))
    
  })
  
}
ui = basicPage(
  sliderInput(inputId = "sliderBase",
              label = "Base monetaria",
              value = as.Date("2000-02-01"),
              min = as.Date("1996-02-01"), 
              max = as.Date("2021-01-28"),
              timeFormat = "%F"),
  plotOutput("ggplot")
  
)
shinyApp(ui = ui, server = server)

