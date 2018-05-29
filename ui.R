suppressMessages(library(shiny))

shinyUI(pageWithSidebar(
  headerPanel("Data Science Capstone Project - Word Prediction App"),
  sidebarPanel(
    h3("User Input"),
    br(),
    
    strong(""),
    textInput("impText", "Type in the first three words of a phrase below:", value = "Having a good"),
    br(),
    
    selectInput("impWords", "How many words to return?",
      choices = list("1" = 1, "2" = 2,
                     "3" = 3, "4" = 4,
                     "5" = 5), selected = 5),
    br(),
  
    strong("Click the button below to return the predictedd words."),
    actionButton("button1", "Text analysis")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Predictions",
      
      h4('The text as interpreted by the application:'),
      verbatimTextOutput("inputText"),
      
      h4('The top five predictions are:'),
      tableOutput("predTable")
      
    ),
    
    tabPanel(
      "Documentation",
      h4("Introduction"),
      p(
        "Predictive text is a feature found on mobile phones, tablets and other mobile technology which 
        is nearly ubiquitous throughout the world. However the way this works eludes most users of these
        devices"
      ),
      p(
        "For this project we learned about N-Gram probabilistic-language-modeling-based approaches. This provides
        basis of understanding of how certain words tend to be combined together in our language and a high likelihood
        of accuracy for predicting the completion of frequent word combinations. This therefore provides the basis 
        a likely completion to common phrases."
      ),
      p(
        "Thanks to a partnership between Johns Hopkins and ",
        a("SwiftKey", href = "http://swiftkey.com", target = "_blank"),
        ", the leading company on predictive text input for Android and iOS keyboards we were provided a robust corpus
        or body of texts from which to build an N-Gram model"
      ),
      br(),
      h4("Highlights"),
      p(
        "Speed: The probabilities were all previously computed and are loaded prior to execution. 
        The app looks down the word tables to instantly recover the most probable next word."
      ),
      p(
        "Naturalness: Stopwords, were left in, as they are present in normal language 
        and could be the expected next input from a user."
      ),
      br(),
      
      h4("App Interface"),
      p(
        "This app provides instructions and is simple and intuitive to use."
      ),
      p(
        "Just type in the first few words of a common phrase in the user input panel on the left which
        contains a text box for user input and a dropdown selection of number of results to return to the UI.
        The results are analysed on the fly while text is being displayed."
      ),
      p(
        "On the right panel of the UI, the app returns the last three words of the phrase as interpreted by 
        the prediction algorithm and a table of words predicted based on the phrase provided." 
      ),
      br(),
      
      h4("App Functionality"),
      p(
        "The app works by truncating the user input to the final three words of the phrase provided and uses those
        to look for matches in look up tables which are light weight and loaded with the application. If matches are
        not found in the highest order table then the algorithm backs of to the lower order N-Gram table until max 5 
        matches are made"
      ),
      p(
        "This approach is based on the widely used N-gram language model and on the ",
        a(
          "'Stupid Backoff' model",
          href = "https://web.stanford.edu/~jurafsky/slp3/",
          target = "_blank"
        ),
        ". More details can be found ",
        a("here", href = "https://github.com/j-p-courneya/wordPredictionApp", target = "_blank"),
        "."
      ),
      p(
        "Step 1: If the user enters e.g. 'to be or not to', it is chopped to the last 3 words ('or not to')."
      ),
      p(
        "Step 2: A search is done for a match to the chopped input."
      ),
      p(
        "Step 3: If a match is found, the algorith skips to Step 4. Otherwise, the user input is 
        shortened again ('not to', etc.), and the algorithm go back to Step 2 but in a ."
      ),
      p(
        "Step 4: If a match was found, it is returned to the user interface. Otherwise, the most 
        frequent word in the corpora is returned."
      ),
      br(),
      h4("Source Code"),
      p(
        "All source code and files used to build and run this app can be found on this ",
        a("git repo",
          href = "https://github.com/j-p-courneya/wordPredictionApp",
          target = "_blank"),
        "."
      )
      
      )
      ))
      ))
