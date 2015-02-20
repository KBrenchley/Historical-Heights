library(shiny)

shinyUI(fluidPage (
    titlePanel("Historical Heights"),
    sidebarLayout(

        sidebarPanel(
            helpText("Ever wondered what life was like around the year 1900, in England? ",
                     "We can get an idea of it, by taking a look at the heights of children who lived then.",
                     "The histogram on the right shows you how many boys or girls (you choose) were at the different heights, in inches.",
                     "Then you tell the app how tall you are, and you can compare your height with theirs."),

            h3("Let's take a look at these children..."),
            selectInput("cgen",
                        label="Look at the heights of a",
                        choices = c("Boy", "Girl"),
                        selected = "Boy"),
            numericInput("yft", label="How tall are you? : feet", value = 5,
                         min = 4, max = 7, step = 1),
            numericInput("yin", label="How tall are you? : inches", value = 6,
                         min = 0, max = 11, step = 1)
                        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Results", plotOutput("results")),
                                 
                        tabPanel("FAQ", tags$style("body {background-color: sepia;}"),
                                 h4("What is this app, and why should I care?"),
                                 p("This app displays a histogram of the heights of boys and girls",
                                   " collected in the years 1896 and 1903. The app also shows you",
                                   " the average heights (with the orange bar) and your height (with the",
                                   " red bar). This lets you compare how tall you are to how tall ",
                                   "children were in these years in England. Are you taller or shorter",
                                   "? Why could that be?"),
                                 br(),
                                 h4("OK, so how does it work?"),
                                 p("You pick whether to look at the boys or the girls, and the app ",
                                   "instantly updates the display. At that point the app also instantly updates the",
                                   " average. Whenever you change your height, the app also instantly updates",
                                   " your height on the graph."),
                                 br(),
                                 h4("Anything else I should know?"),
                                 p("The dataset used by this app came from:"), br(),
                                 p("Pearson, K. and Lee, A. (1896). Mathematical contributions to the theory of evolution. On telegony in man, etc. Proceedings of the Royal Society of London, 60 , 273-283."),
                                 br(),
                                 p(" and "), br(),
                                 p("Pearson, K. and Lee, A. (1903). On the laws of inheritance in man: I. Inheritance of physical characters. Biometika, 2(4), 357-462. (Tables XXII, p. 415; XXV, p. 417; XXVIII, p. 419 and XXXI, p. 421.)"
                                 )
                                 
                                 ) #tabPanel 2
                        
                        ) #tabsetPanel
        )
    )
))


