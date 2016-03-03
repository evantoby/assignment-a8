library(plotly)
library(shiny)
library(dplyr)

#Stores the data frame into a new data frame.
data_iris <- data.frame(iris)

shinyServer(function(input, output) {
  #Creates an adjustable graph that varies based on user input
  output$graph <- renderPlotly({
    
    #filter the data based on user input for species
    data_species <- switch(input$species, 
                           "setosa" = data_iris %>% filter(Species == "setosa"),
                           "versicolor" = data_iris %>% filter(Species == "versicolor"),
                           "virginica" = data_iris %>% filter(Species == "virginica"))
    
    
    #selects width column
    data_x <- switch(input$select_x, 
                    "Sepal Width" = data_species$Sepal.Width,
                    "Petal Width" = data_iris$Petal.Width)
    
    #selects length column
    data_y <- switch(input$select_y, 
                    "Sepal Length" = data_species$Sepal.Length,
                    "Petal Length" = data_iris$Petal.Length)
    
    #Creates a constant for area
    area <- data_y * data_x
    
    #Creates the scatterplot that adjusts its labels and shows the area information when hovering over the points.
    plot_ly(
      x = data_x,
      y = data_y,
      text = paste('Area: ', area, 'cm sq.'),
      name = "Iris Graph",
      mode = "markers",
      color = area,
      size = area / 10
    ) %>%  layout(title = paste(input$select_x, "Vs", input$select_y), 
                  xaxis = list(title = paste(input$select_x, "in Centimeters")),
                  yaxis = list(title = paste(input$select_y, "in Centimeters")))
    
  })
}
)