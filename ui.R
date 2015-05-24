library(shiny)
data(iris)

Sepal.Length.Min = min(iris$Sepal.Length)
Sepal.Length.Max = max(iris$Sepal.Length)
Sepal.Length.Mean = mean(iris$Sepal.Length)
Sepal.Width.Min = min(iris$Sepal.Width)
Sepal.Width.Max = max(iris$Sepal.Width)
Sepal.Width.Mean = mean(iris$Sepal.Width)

Petal.Length.Min = min(iris$Petal.Length)
Petal.Length.Max = max(iris$Petal.Length)
Petal.Length.Mean = mean(iris$Petal.Length)
Petal.Width.Min = min(iris$Petal.Width)
Petal.Width.Max = max(iris$Petal.Width)
Petal.Width.Mean = mean(iris$Petal.Width)

shinyUI(pageWithSidebar(
  headerPanel("Flower Species Predictor"),
  sidebarPanel(
    sliderInput('Sepal.Length', 'Sepal Length', value = Sepal.Length.Mean, min = Sepal.Length.Min, max = Sepal.Length.Max, step = .5),
    sliderInput('Sepal.Width', 'Sepal Width', value = Sepal.Width.Mean, min = Sepal.Width.Min, max = Sepal.Width.Max, step = .5),
    sliderInput('Petal.Length', 'Petal Length', value = Petal.Length.Mean, min = Petal.Length.Min, max = Petal.Length.Max, step = .5),
    sliderInput('Petal.Width', 'Petal Width', value = Petal.Width.Mean, min = Petal.Width.Min, max = Petal.Width.Max, step = .5),
    actionButton("getSpecies", "Determine Species")
    ),
  mainPanel(
    plotOutput('petalGraph'),
    'This app is based on the R iris dataset. It implements a machine learning algorithm to predict the species of a flower based on sepal length/width and petal length/width. Set those values using the sliders on the left. The graph above will track your input. When ready to make a prediction, press the "Determine Species" button. The point on the graph corresponding to your input will change color according to the prediction made by the algorithm.'
  )
))