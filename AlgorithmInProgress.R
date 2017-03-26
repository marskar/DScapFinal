remove(input)
remove(splitInput)
remove(input2)
remove(pentaPred)
predictNgram <- function(input, df1, df2, df3, df4, df5, df6, df7) {
  input <- stripWhitespace(removePunctuation(tolower("beep beep beep beep beep")))
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
    heptaPred <- head(df7[which(df7$heptaMinus1 == input2),]$NextWord, 10)
  }
  if  (length(heptaPred) > 0){
    print("I was able to match the last six words you entered")
    return(heptaPred)
} else { 
      if (length(splitInput) >= 5){
        input2 <- paste(tail(splitInput, 5), collapse = " ")
        hexaPred <- head(df6[which(df6$hexaMinus1 == input2),]$NextWord, 10)
      }
      if  (length(hexaPred) > 0){
      print("I was able to match the last five words you entered")
      return(hexaPred)
      }
    } else { 
        if (length(splitInput) >= 4){
        input2 <- paste(tail(splitInput, 4), collapse = " ")
        pentaPred <- head(df5[which(df5$pentaMinus1 == input2),]$NextWord, 10)
        }
        if  (length(pentaPred) > 0){
        print("I was able to match the last four words you entered")
        return(pentaPred)
      } else {  
          if (length(splitInput) >= 3){
            input2 <- paste(tail(splitInput, 3), collapse = " ")
            quadPred <- head(df4[which(df4$quadMinus1 == input2),]$NextWord, 10)
          }
          if  (length(quadPred) > 0){
            print("I was able to match the last three words you entered")
            return(quadPred)
        } else {
            if (length(splitInput) >= 2){
                input2 <- paste(tail(splitInput, 2), collapse = " ")
                triPred <- head(df3[which(df3$triMinus1 == input2),]$NextWord, 10)
            }
            if  (length(triPred) > 0){
                print("I was able to match the last two words you entered")
                return(triPred)
          } else {
              if (length(splitInput) > 1){
                input2 <- tail(splitInput, 1)
                biPred <- head(df2[which(df2$biMinus1 == input2),]$NextWord, 10)
              }
              if  (length(biPred) > 0){
              print("I was able to match the last word you entered")
              return(biPred)
              }
              } else {
                uniPred <- head(df1$Word, 10)
                return(biPred)
        }       
  if  (length(heptaPred) > 0){
                  print("I was able to match the last six words you entered")
                  return(heptaPred)
          }
  else  if  (length(hexaPred) > 0){
                    print("I was able to match the last five words you entered")
                    return(hexaPred)
          }
  else  if  (length(pentaPred) > 0){
                        print("I was able to match the last four words you entered")
                        return(pentaPred)
          }
  else if  (length(quadPred) > 0){
                            print("I was able to match the last three words you entered")
                            return(quadPred)
  }                  
  else  if  (length(triPred) > 0){
                                print("I was able to match the last two words you entered")
                                return(triPred)
              
    if (exists("biPred")){
      if  (length(triPred) > 0){
        print("I was able to match the last word you entered")
        return(biPred)
        
              
              
                          }
          }
        }
      }
    }
  }
}
###########################33




predictNgram <- function(input, df1, df2, df3, df4, df5, df6, df7) {
  input <- stripWhitespace(removePunctuation(tolower(input)))
  splitInput <- unlist(strsplit(input, split = " "))
  if (length(splitInput) >= 6){
    input2 <- paste(tail(splitInput, 6), collapse = " ")
    heptaPred <- head(df7[which(df7$heptaMinus1 == input2),]$NextWord, 10)
    if (exists("heptaPred")) {
      if  (length(heptaPred) > 0){
        print("I was able to match the last six words you entered")
        return(heptaPred)
        
      }
    } else { 
      if (length(splitInput) >= 5){
        input2 <- paste(tail(splitInput, 5), collapse = " ")
        hexaPred <- head(df6[which(df6$hexaMinus1 == input2),]$NextWord, 10)
        if (exists("hexaPred")){
          if  (length(hexaPred) > 0){
            print("I was able to match the last five words you entered")
            return(hexaPred)
            
          }
        } else { 
          if (length(splitInput) >= 4){
            input2 <- paste(tail(splitInput, 4), collapse = " ")
            pentaPred <- head(df5[which(df5$pentaMinus1 == input2),]$NextWord, 10)
            if (exists("pentaPred")){
              if  (length(pentaPred) > 0){
                print("I was able to match the last four words you entered")
                return(pentaPred)
                
              }
            } else {            
              if (length(splitInput) >= 3){
                input2 <- paste(tail(splitInput, 3), collapse = " ")
                quadPred <- head(df4[which(df4$quadMinus1 == input2),]$NextWord, 10)
                if (exists("quadPred")){
                  if  (length(quadPred) > 0){
                    print("I was able to match the last three words you entered")
                    return(quadPred)
                    
                  }
                } else {      
                  if (length(splitInput) >= 2){
                    input2 <- paste(tail(splitInput, 2), collapse = " ")
                    triPred <- head(df3[which(df3$triMinus1 == input2),]$NextWord, 10)
                    if (exists("triPred")){
                      if  (length(triPred) > 0){
                        print("I was able to match the last two words you entered")
                        return(triPred)
                        
                      }
                    } else {
                      if (length(splitInput) > 1){
                        input2 <- tail(splitInput, 1)
                        biPred <- head(df2[which(df2$biMinus1 == input2),]$NextWord, 10)
                        if (exists("biPred")){
                          if  (length(triPred) > 0){
                            print("I was able to match the last word you entered")
                            return(biPred)
                            
                          }
                        } else {
                          uniPred <- head(df1$Word, 10)
                          print("I was not able to find a match, but here are some common words")
                          return(uniPred)
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}