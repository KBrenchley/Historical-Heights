library(shiny)

shinyUI(fluidPage (
    titlePanel("Historical Heights"),
    sidebarLayout(

        sidebarPanel(
            helpText("In 1896 and 1903, Karl Pearson and Alice Lee gathered
                     and recorded the heights of English families. That was 
                     over 100 years ago."),
            h3("Let's take a look at these children..."),
            selectInput("pgen",
                        label="The parent whose height was recorded was the",
                        choices = c("Father", "Mother"),
                        selected = "Father"),
            selectInput("cgen",
                        label="The child was a",
                        choices = c("Son", "Daughter"),
                        selected = "Son")
                        ),
        mainPanel(
            plotOutput("results")
        )
    )
))

