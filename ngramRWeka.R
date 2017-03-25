install.packages("RWeka")
install.packages("tm")
library(tm)
remove
library(RWeka)
dat1<-iconv(dat, "UTF-8", "ASCII", sub="")
corp <- VCorpus(VectorSource(dat1))
corp <- tm_map(corp, tolower)
corp <- tm_map(corp, removePunctuation)
corp <- tm_map(corp, removeNumbers)
corp <- tm_map(corp, stripWhitespace)
corp <- tm_map(corp, PlainTextDocument)

bigramTokenize <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
trigramTokenize <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
tdm2 <- TermDocumentMatrix(corp, control = list(tokenize = bigramTokenize))
tdm3 <- TermDocumentMatrix(corp, control = list(tokenize = trigramTokenize))

