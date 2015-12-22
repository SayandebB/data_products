# Shiny server script
library(shiny)
library(RWeka)
dat01<-read.csv("modified_mushrooms.csv", stringsAsFactors = TRUE, header = TRUE)

shinyServer(
  function(input, output){
    
    output$oodor <- renderPrint({input$odor})
    output$ogill_size <- renderPrint({input$gill_size})
    output$ogill_color <- renderPrint({input$gill_color})
    output$ospore_print_color <- renderPrint({input$spore_print_color})
    output$prediction <- renderPrint({pred(input$odor,
                                           input$gill_size,
                                           input$gill_color,
                                           input$spore_print_color)})
    
    ################################################
    # Function to predict the safety of the mushroom
    ################################################
    
    pred <- function(in_odor, in_gill_size, in_gill_color, in_spore_print_color){
      # source("mod.R")
      # Call the model fit from the training function
      fit <- mod(dat01)
      
      # Create an empty data frame to capture user inputs and pass to predict
      df <- data.frame(odor=character(), 
                       gill_size=character(), 
                       gill_size=character(),
                       spore_print_color=character())
      
      new_row <- data.frame(odor=in_odor, 
                            gill_size=in_gill_size, 
                            gill_color=in_gill_color,
                            spore_print_color=in_spore_print_color)
      
      df <- rbind(df, new_row)
      
      # Do the prediction
      p <- predict(fit, df)
      p
    }
    #### END OF PREDICTION FUNCTION ####
  }
)



####################################################
# Function to train the model on classification rule
####################################################
mod <- function(df){
  fit <- JRip(type~., data = df)
  fit
  }