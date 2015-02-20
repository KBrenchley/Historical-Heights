library(shiny)
library(RColorBrewer)

## Data and prediction model
library(HistData)
data(PearsonLee)
m <- min(PearsonLee$child)

shinyServer(
    function(input, output) {
        output$results <- renderPlot({
            
            chl.gen <- switch(input$cgen,
                           "Boy" = "son", 
                           "Girl" = "daughter")
   
            if (chl.gen == "son") {
                fam = "Son"
                colors = brewer.pal(9, "Blues")
                blabel = "Heights of Boys"
            }

            if (chl.gen == "daughter") {
                fam = "Daughter"
                colors = brewer.pal(9, "Greens")
                blabel = "Heights of Girls"
            }
            
            your_height <- (input$yft * 12) + input$yin
                                               
            hist(PearsonLee$child[PearsonLee$chl == fam], col = colors,  
                      main = blabel, breaks = 20,
                      xlab = "height in inches")
            abline(v = mean(PearsonLee$child[PearsonLee$chl == fam]), col = "orange", lwd = 3)
            abline(v = your_height, col = "red", lwd = 3)
            legend("topright",legend = c("Average Height","Your Height"), 
                   lty = "solid", col = c("orange", "red"))
            })
    }
)