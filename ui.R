# Shiny user interface
library(shiny)
shinyUI(pageWithSidebar(
 headerPanel("Mushroom predictions"),
 sidebarPanel(


# User choice for odour of the mushroom
radioButtons("odor", "Odour of the mushroom:",
             c("Almond odour" = "almond",
               "Alise odour" = "alise",
               "Cresote odour" = "creosote",
               "Fishy odour" = "fishy",
               "Foul odour" = "foul",
               "Musty odour" = "musty",
               "No odour" = "none",
               "Pungent odour" = "pungent",
               "Spicy odour" = "spicy"),
             selected = NULL),

# User choice for gill size of the mushroom
radioButtons("gill_size", "Gill size of the mushroom:",
             c("Broad" = "broad",
               "Narrow" = "narrow"),
             selected = NULL),

# User choice for gill color of the mushroom
radioButtons("gill_color", "Gill color of the mushroom:",
             c("Black" = "black",
               "Brown" = "brown",
               "Buff" = "buff",
               "Chocolate" = "chocolate",
               "Gray" = "gray",
               "Green" = "green",
               "Orange" = "orange",
               "Pink" = "pink",
               "Purple" = "purple",
               "Red" = "red",
               "White" = "white",
               "Yellow" = "yellow"),
             selected = NULL),

# User choice for spore print color of the mushroom
radioButtons("spore_print_color", "Color of the mushroom spore:",
             c("Black" = "black",
               "Brown" = "brown",
               "Buff" = "buff",
               "Chocolate" = "chocolate",
               "Green" = "green",
               "Orange" = "orange",
               "Purple" = "purple",
               "White" = "white",
               "Yellow" = "yellow"),
             selected = NULL)
),

#####################

mainPanel("This is a submission for the Data Science Specialisation of Johns Hopkins Bloomberg
          School. This is a deployment classification rules algorithm for predicting whether
          a mushroom with certain characteristics is poisonous or edible.
          I have used the 'ZIPPER' algorithm from the 'RWeka' package.
          The raw data set is a simplified version of Mushroom dataset available at 
          the UCI Machine Learning Repository.
          I have only used four most important feature to predict the mushroom quality.
          The user can choose the various options below for each of the feature.
          
          ",
   h5("Odour of the mushroom is:"),
   verbatimTextOutput("oodor"),
   h5("Gill size of the mushroom is:"),
   verbatimTextOutput("ogill_size"),
   h5("Gill color of the mushroom is:"),
   verbatimTextOutput("ogill_color"),
   h5("Color of the mushroom spore is:"),
   verbatimTextOutput("ospore_print_color"),
   
#   submitButton("Predict"),
   
   h5("The mushroom is predicted to be:"),
   verbatimTextOutput("prediction")
 )
))