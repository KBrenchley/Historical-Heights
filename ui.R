library(shiny)

shinyUI(fluidPage (
    titlePanel("Historical Heights"),
    sidebarLayout(

        sidebarPanel(
            helpText("In 1896 and 1903, Karl Pearson and Alice Lee gathered
                     and recorded the heights of English families. That was 
                     over 100 years ago."),
            numericInput("yft", label="How tall are you? : feet", value = 5,
                         min = 4, max = 7, step = 1),
            numericInput("yin", label="How tall are you? : inches", value = 6,
                         min = 0, max = 11, step = 1),
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
            tabsetPanel(type = "tabs",
                        tabPanel("Results", plotOutput("results")),
                                 
                        tabPanel("FAQ", tags$style("body {background-color: sepia;}"),
                                 h4("What is this app, and why should I care?"),
                                 br(),
                                 h4("OK, so how does it work?"),
                                 br(),
                                 h4("Who are the people in the picture?"),
                                 p(
                                     
                                 ),
                                 br(),
                                 h4("Anything else I should know?"),
                                 p(
                                 )
                                 
                                 ) #tabPanel
                        
                        )
        )
    )
))


