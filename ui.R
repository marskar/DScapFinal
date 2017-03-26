#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#install.packages("shiny")
#install.packages("markdown")
library(shiny)
library(markdown)

# Define UI for application that predicts the next word
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Johns Hopkins Data Science Specialization Capstone Project"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h2("NxtWrd"),
      h5("by marskar"),
      br(),
      h4("Please type your entry below"),
      textInput(inputId = "userText", 
                label = "", 
                value = "" # 
      ),
       sliderInput("numPred",
                   "Max. number of words to predict:",
                   min = 1,
                   max = 10,
                   value = 1)
    ), # End of sideBar
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Prediction",
          h4(textOutput("n")),
          h3(textOutput("wordPred"), align="left"),
          br(),
          hr()
        ),
        tabPanel("App info",
                 includeMarkdown("about.Rmd")
        )
      )
    ) # End of mainPanel
  )
))
