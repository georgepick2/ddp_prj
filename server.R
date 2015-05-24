library(shiny)
library(ggplot2)
library(randomForest)
data(iris)
modFit <- randomForest(Species~., data=iris)
submitPressed <- 0
shinyServer(
  function(input, output) {
    output$petalGraph <- renderPlot({
      nd <- data.frame("Sepal.Length"=input$Sepal.Length,
                       "Sepal.Width"=input$Sepal.Width,
                       "Petal.Length"=input$Petal.Length,
                       "Petal.Width"=input$Petal.Width)
      pg <- qplot(Petal.Width, Petal.Length, col=Species, data=iris)
      if(input$getSpecies > submitPressed) {
        nd$Species = predict(modFit, nd)
        submitPressed <<- input$getSpecies
        pg + geom_point(aes(x=Petal.Width, y=Petal.Length, col=Species), size=5, shape=16, data=nd)
      }
      else
        pg + geom_point(aes(x=Petal.Width, y=Petal.Length), color="black", size=5, shape=16, data=nd)
    })
  })