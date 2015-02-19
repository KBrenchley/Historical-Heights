library(shiny)

shinyUI(fluidPage (
    titlePanel("Historical Heights"),
    sidebarLayout(

        sidebarPanel(
            helpText("In 1896 and 1903, Karl Pearson and Alice Lee gathered
                     and recorded the heights of English families. That was 
                     over 100 years ago."),
            h3("Let's take a look at these children..."),
            selectInput("family",
                        label="Choose options to display historical heights",
                        choices = c("Fathers and Sons", "Mothers and Sons",
                                    "Fathers and Daughters", "Mothers and Daughters"),
                        selected = "Fathers and Sons")
                        ),
        mainPanel(
            plotOutput("results")
        )
    )
))

