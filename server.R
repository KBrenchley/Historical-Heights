library(shiny)
library(ggplot2)

## Data and prediction model
library(HistData)
data(PearsonLee)
m <- min(PearsonLee$child)

shinyServer(
    function(input, output) {
        output$results <- renderPlot({

            par.gen <- switch(input$pgen,
                "Father" = "dad", 
                "Mother" = "mom")
            
            chl.gen <- switch(input$cgen,
                           "Son" = "son", 
                           "Daughter" = "daughter")
   
            if (par.gen == "dad" && chl.gen == "son") {
                fam = "fs"
                colors = "navy"
                blabel = "Heights of Sons"
            }

            if (par.gen == "dad" && chl.gen == "daughter") {
                fam = "fd"
                colors = "purple"
                blabel = "Heights of Daughters"
            }
            
            if (par.gen == "mom" && chl.gen == "son") {
                fam = "ms"
                colors = "blue"
                blabel = "Heights of Sons"
            }
            
            if (par.gen == "mom" && chl.gen == "daughter") {
                fam = "md"
                colors = "red"
                blabel = "Heights of Daughters"
            }
            
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