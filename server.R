library(shiny)
library(ggplot2)

## Data and prediction model
library(HistData)
data(PearsonLee)
str(PearsonLee)

shinyServer(
    function(input, output) {
        output$results <- renderPlot({

            fam <- switch(input$family,
                "Fathers and Sons" = "fs", 
                "Mothers and Sons" = "ms",
                "Fathers and Daughters" =  "fd",
                "Mothers and Daughters" =  "md")

            colors <- switch(input$family,
                          "Fathers and Sons" = "navy", 
                          "Mothers and Sons" =  "blue",
                          "Fathers and Daughters" =  "purple",
                          "Mothers and Daughters" =  "pink")
            
            blabel <- switch(input$family,
                          "Fathers and Sons" = "Heights of Sons based on Father's Height", 
                          "Mothers and Sons" =  "Heights of Sons based on Mother's Height",
                          "Fathers and Daughters" =  "Heights of Daughters based on Father's Height",
                          "Mothers and Daughters" =  "Heights of Daughters based on Mother's Height")   

#            g <- ggplot(data = PearsonLee, aes(PearsonLee$child[PearsonLee$gp == fam]))
#            g <- g + geom_histogram(aes(y = ..density..), fill = colors, binwidth=1, colour = "black")
#            g <- g + geom_density(size = 2, colour = "black")
#            g            
            
            
            hist(PearsonLee$child[PearsonLee$gp == fam], col = colors,  
                      main = blabel, breaks = 20,
                      xlab = "Average height shown with orange line")
            abline(v = mean(PearsonLee$child[PearsonLee$gp == fam]), col = "orange", lwd = 2)

            })
    }
)