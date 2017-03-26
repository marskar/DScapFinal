Coursera Data Science Specialization Capstone Project
========================================================
author: Martin Skarzynski

The [NxtWrd application](https://marskar.shinyapps.io/DScapFinal/) for predicting the next word.

The application is the capstone project for the Coursera Data Science specialization held by professors of the Johns Hopkins University and in cooperation with SwiftKey.
![Coursera Logo](Coursera.png)
![SwiftKey Logo](SwiftKey.png)
![DSS Logo](DSS.png)
The Objective
========================================================

The main goal of this capstone project is to build a shiny application that is able to predict the next word. 

This exercise was divided into seven sub tasks like data cleansing, exploratory analysis, the creation of a predictive model and more.


All text mining and natural language processing was done with the usage of a variety of well-known R packages.

The Applied Methods & Models
========================================================

After creating a data sample from the HC Corpora data, this sample was cleaned by conversion to lowercase, removing punctuation, links, white space, numbers and all kinds of special characters.
This data sample was then [tokenized](http://en.wikipedia.org/wiki/Tokenization_%28lexical_analysis%29) into so-called [*n*-grams](http://en.wikipedia.org/wiki/N-gram). 
> In the fields of computational linguistics and probability, an *n*-gram is a contiguous sequence of n items from a given sequence of text or speech. ([Source](http://en.wikipedia.org/wiki/N-gram))


Those aggregated bi-,tri- and quadgram term frequency matrices have been transferred into frequency dictionaries.

The resulting data.frames are used to predict the next word in connection with the text input by a user of the described application and the frequencies of the underlying *n*-grams table.


The Usage Of The Application
========================================================


![App Screenshot](NxtWrdScreen.PNG)


Additional Information
========================================================

* The next word prediction app is hosted on shinyapps.io: [https://marskar.shinyapps.io/DScapFinal/](https://marskar.shinyapps.io/DScapFinal/)


* All of code used during the course of the Capstone experience can be found at this [GitHub repo](https://github.com/marskar/DScapFinal)

* This pitch deck is located here: [http://rpubs.com/marskar/DScapFinal](http://rpubs.com/marskar/DScapFinal)

* To learn more about the Coursera Data Science Specialization, please visit this webpage [https://www.coursera.org/specialization/jhudatascience](https://www.coursera.org/specialization/jhudatascience/1)