#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)
# Load in data objects from rds
df1 = readRDS("top10.Rds")
df2 = readRDS("df2.Rds")
df3 = readRDS("df3.Rds")
df4 = readRDS("df4.Rds")
df5 = readRDS("df5.Rds")
df6 = readRDS("df6.Rds")
df7 = readRDS("df7.Rds")
# Define server logic required to predict next word
shinyServer(function(input, output) {
   
  
  ## Prediction Algorithm
  predictNgram <- function(input, df1, df2, df3, df4, df5, df6, df7) {
    input <- stripWhitespace(removePunctuation(tolower(input$userText)))
    splitInput <- unlist(strsplit(input, split = " "))
    heptaPred <- as.character(NULL)
    hexaPred <- as.character(NULL)
    pentaPred <- as.character(NULL)
    quadPred <- as.character(NULL)
    triPred <- as.character(NULL)
    biPred <- as.character(NULL)
    # First count the words in the input and obtain highest number of consecutive word matches
    if (length(splitInput) >= 6){
      input2 <- paste(tail(splitInput, 6), collapse = " ")
      heptaPred <- head(df7[which(df7$heptaMinus1 == input2),]$NextWord, input$numPred)
    }
    if  (length(heptaPred) > 0){
      print("I was able to match the last six words you entered")
      prediction<-heptaPred
    } else { 
      if (length(splitInput) >= 5){
        input2 <- paste(tail(splitInput, 5), collapse = " ")
        hexaPred <- head(df6[which(df6$hexaMinus1 == input2),]$NextWord, input$numPred)
      }
      if  (length(hexaPred) > 0){
        print("I was able to match the last five words you entered")
        prediction<-hexaPred
      } else { 
        if (length(splitInput) >= 4){
          input2 <- paste(tail(splitInput, 4), collapse = " ")
          pentaPred <- head(df5[which(df5$pentaMinus1 == input2),]$NextWord, input$numPred)
        }
        if  (length(pentaPred) > 0){
          print("I was able to match the last four words you entered")
          prediction<-pentaPred
        } else {  
          if (length(splitInput) >= 3){
            input2 <- paste(tail(splitInput, 3), collapse = " ")
            quadPred <- head(df4[which(df4$quadMinus1 == input2),]$NextWord, input$numPred)
          }
          if  (length(quadPred) > 0){
            print("I was able to match the last three words you entered")
            prediction<-quadPred
          } else {
            if (length(splitInput) >= 2){
              input2 <- paste(tail(splitInput, 2), collapse = " ")
              triPred <- head(df3[which(df3$triMinus1 == input2),]$NextWord, input$numPred)
            }
            if  (length(triPred) > 0){
              print("I was able to match the last two words you entered")
              prediction<-triPred
            } else {
              if (length(splitInput) > 1){
                input2 <- tail(splitInput, 1)
                biPred <- head(df2[which(df2$biMinus1 == input2),]$NextWord, input$numPred)
              }
              if  (length(biPred) > 0){
                print("I was able to match the last word you entered")
                prediction<-biPred
              } else {
                uniPred <- head(df1$Word, input$numPred)
                print("I was not able to find any matches, 
                      so I will provide the most common word(s)")
                prediction<-uniPred
              }
            }
          }
        }
      }
    }
  return(prediction)
  }  
  
  
  
  output$wordPred <- renderText({
    
    predictNgram(input$userText, k = input$numPred)
    
  })
  
  prediction = reactive({
    k = input$numPred
    predList = predictNgram(input$userText, k)
    
  })
  
  output$kText = renderText(
    paste0(
      "The top ", 
      input$numPred, 
      " predicted word(s) is:", 
      collapse = "")
  )    
})
