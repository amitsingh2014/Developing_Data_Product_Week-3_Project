# server.R file for the shiny app
# You can run the application by clicking 'Run App' 
#
# Developing Data Products: Week 4 Project
# Data Used: mtcars dataset

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    # Get the input range for the slider inputs    
    disp_seq   <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    hp_seq     <- seq(from = input$hp[1],   to = input$hp[2],   by = 1)
    mpg_seq    <- seq(from = input$mpg[1],  to = input$mpg[2],  by = 0.1)
    # Change the column names to user friendly names   
    data       <- transmute(mtcars, 
                            Car = rownames(mtcars), 
                            Transmission = am,
                            Cylinders = cyl, 
                            MilesPerGallon = mpg, 
                            Horsepower = hp,
                            Displacement = disp)
    
    # Filter the mtcars data based on the input values   
    data       <- filter(data, 
                         Cylinders %in% input$cyl, 
                         Displacement %in% disp_seq, 
                         MilesPerGallon %in% mpg_seq, 
                         Horsepower %in% hp_seq, 
                         Transmission %in% input$am)
    # Change transmission values from 0 and 1 to user friendly values   
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    # Sort data by Miles Per Gallon
    data <- arrange(data, MilesPerGallon)
    data
    # Set options for number of row to view at a time
  }, options = list(lengthMenu = c(5, 10, 15), pageLength = 15))
})
