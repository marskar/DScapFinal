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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Johns Hopkins Data Science Specialization Capstone"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h5("by marskar"),
      br(),
      h4("Please type your entry below"),
      textInput(inputId = "userText", 
                label = "", 
                value = "" # 
      ),
       sliderInput("numPred",
                   "Number of word to predict:",
                   min = 1,
                   max = 10,
                   value = 4)
    ), # End of sideBar
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Prediction",
          h4("The predicted word (with highest probability) is:"),
          h3(textOutput("wordPred"), align="center"),
          # HTML("</span>"),
          br(),
          h4(textOutput("kText")),
          hr()#,
          # div(dataTableOutput("predTable"), style='font-size:150%')        
        ),
        tabPanel("App documentation",
                 includeMarkdown("documentation.Rmd")
        )
      )
    ) # End of mainPanel
  )
))
