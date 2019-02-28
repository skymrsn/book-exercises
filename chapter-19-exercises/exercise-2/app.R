# Exercise 2: a basic Shiny app
install.packages("shiny")
# Load the `shiny` package
library("shiny")


# Define a new `ui` variable. This variable should be assigned a `fluidPage()` layout
# The `fluidPage()` layout should be passed the following:
my_ui <- fluidPage(
  titlePanel("Cost Caculator"),
  numericInput(inputId = "input_price",
               label = "Price(in dollars)",
               min = 0, value = 0),
  numericInput(inputId = "quanity", label = "Quantity",
               min = 1, value = 1),

  
  # A `titlePanel()` layout with the text "Cost Calculator"

  
  # A `numericInput()` widget with the label "Price (in dollars)"
  # It should have a default value of 0 and a minimum value of 0
  # Hint: look up the function's arguments in the documentation!

  
  # A second `numericInput()` widget with the label "Quantity"
  # It should have a default value of 1 and a minimum value of 1  

  
  # The word "Cost", strongly bolded
  strong("Cost"),
  
  # A `textOutput()` output of a calculated value labeled `cost`
  textOutput("cost")
)


# Define a `server` function (with appropriate arguments)
# This function should perform the following:
 my_server <- function(input,output) {
  
  # Assign a reactive `renderText()` function to the output's `cost` value
  # The reactive expression should return the input `price` times the `quantity`
  # So it looks nice, paste a "$" in front of it!
  output$cost <- renderText({
    result <- paste("$",input$input_price * input$quanity)
  })
 }


# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = my_ui, server = my_server)
