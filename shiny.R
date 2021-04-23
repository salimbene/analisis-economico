#install.packages("shiny")


setwd('/Users/matisalimba/dev/learning/r/eco')
library(shiny)
library(ggplot2)
library(readxl)
library(xlsx)

base <- read_xlsx("base_monetaria_bcra.xlsx")
base <- as.data.frame(base)
colnames(base) <- c("Fecha","Pesos")
base$Fecha <- as.Date(base$Fecha)
head(base)
summary(base)


server = function(input, output, session){
  
  data <- reactive({
    base[base$Fecha <= input$sliderBase,]
  })
  
  output$plot <- renderPlot({
    plot(data(), col = "red", pch = 21, bty = "n")
  })
  
  output$ggplot <- renderPlot({
    ggplot() + 
      geom_line(data=data(), aes(x=Fecha, y=Pesos)) +
      geom_point(data=data(), aes(x=Fecha, y=Pesos), colour="red") +
      coord_cartesian(xlim=c(as.Date("1996-02-01"),as.Date("2021-01-28")), ylim=c(0,2683991))
      
  })
#?coord_cartesian
#
  
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


base$Pesos[base$Fecha <= as.Date("2000-02-01")]
head(base[,])

ggplot() + 
  geom_line(data=base, aes(x=Fecha, y=Pesos))

?coord_fixed


a <- c("a","b","c","d","e","f")
b <- c(1,2,3)

df <- data.frame(a,b)
df
?data.fram

#scripts naming convention (req. for deployment)
#mono script: app.R
#double script: server.R, ui.R
