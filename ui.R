library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Iris Data Visualization"),
  
  #Creates the side panel with 3 widgets that the filter which information is being displayed
  sidebarLayout(
    sidebarPanel(
      
      #Creates 3 buttons that filter the data by species
      selectInput("species", "Select Which Species of Flower",
                   c("Setosa" = "setosa",
                     "Versicolor" = "versicolor",
                     "Virginica" = "virginica")),
      
      #Filters the x axis of the graph by widths by the filtered species
      radioButtons("select_x", 
                  label = "Select Which Width Filter",
                  choices = list("Sepal Width", "Petal Width"),
                  selected = "Sepal Width"),
      
      #Filters the y axis of the graph by legnths of the filtered species
      radioButtons("select_y", 
                  label = "Select Which Length Filter",
                  choices = list("Sepal Length", "Petal Length"),
                  selected = "Sepal Length")
    ),
    
    #Plots the graph in the main panel
    mainPanel(
      plotlyOutput('graph')
    )
  )
))