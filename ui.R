library(shiny)

shinyUI(fluidPage (
    titlePanel("Historical Heights"),
    sidebarLayout(position = "right",
        sidebarPanel(
            h2("Your results are:") 
        ),
        mainPanel(
            helpText("In 1896 and 1903, Karl Pearson and Alice Lee gathered
                     and recorded the heights of English families. That was 
                     over 100 years ago. Do you wonder how tall you would
                     be if you had lived over 100 years ago in England?
                     Now you can find out."),
            h3("Tell me a little bit about you and your family..."),
             
            radioButtons("gender", label = h4("Are you"),
                         choices = list("Female?" = 1, "Male?" = 2), selected = 0),
            
            h4("How tall were your father and mother?"),
            fluidRow(
                column(5, 
                    selectInput("F_height", label = h4("Height of father: feet"),
                        choices = list("6" = 1, "5" = 2, "4" = 3), selected = 0),
                    selectInput("F_height", label = h4("Height of mother: feet"),
                                choices = list("6" = 1, "5" = 2, "4" = 3), selected = 0)
                ),
                column(3),
                column(5, 
                       selectInput("F_inches", label = h4("Height of father: inches"),
                                   choices = list("0" = 1, "1" = 2, "2" = 3, "3" = 4,
                                                  "4" = 5, "5" = 6, "6" = 7, "7" = 8,
                                                  "8" = 9, "9" = 10, "10" = 11, "11" = 12),
                                   selected = 0),
                       selectInput("F_inches", label = h4("Height of mother: inches"),
                            choices = list("0" = 1, "1" = 2, "2" = 3, "3" = 4,
                                            "4" = 5, "5" = 6, "6" = 7, "7" = 8,
                                            "8" = 9, "9" = 10, "10" = 11, "11" = 12),
                                   selected = 0)
                )
                ),
            
            submitButton("Find your Historical Height!")
            )
    )
    ) 
)