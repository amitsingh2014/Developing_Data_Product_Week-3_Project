# This is the user-interface definition of a Shiny web application. 
# You can run the application by clicking 'Run App'
#
# Developing Data Products: Week 4 Project
# Data Used: mtcars dataset

library(shiny)
library(markdown)
shinyUI(navbarPage("CAR OF YOUR CHOICE",
                   #shinyUI(titlePanel("Find the Car of Your Choice",
                   tabPanel("    :)   ",
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Specifications:"),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                sliderInput('mpg', 'Miles Per Gallon', min=5, max=50, value=c(5,50), step=5),
                                sliderInput('hp', 'Horsepower', min=50, max=340, value=c(50,340), step=10),
                                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                submitButton("FIND")
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   )))    