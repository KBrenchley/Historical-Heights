library(shiny)
library(RColorBrewer)

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
                colors = brewer.pal(9, "Blues")
                blabel = "Heights of Sons"
            }

            if (par.gen == "dad" && chl.gen == "daughter") {
                fam = "fd"
                colors = brewer.pal(9, "Purples")
                blabel = "Heights of Daughters"
            }
            
            if (par.gen == "mom" && chl.gen == "son") {
                fam = "ms"
                colors = brewer.pal(9, "Reds")
                blabel = "Heights of Sons"
            }
            
            if (par.gen == "mom" && chl.gen == "daughter") {
                fam = "md"
                colors = brewer.pal(9, "Greens")
                blabel = "Heights of Daughters"
            }
            
            your_height <- (input$yft * 12) + input$yin
                        
            hist(PearsonLee$child[PearsonLee$gp == fam], col = colors,  
                      main = blabel, breaks = 20,
                      xlab = "")
            abline(v = mean(PearsonLee$child[PearsonLee$gp == fam]), col = "orange", lwd = 3)
            abline(v = your_height, col = "gold", lwd = 3)
            legend("topright",legend = c("Average Height","Your Height"), 
                   lty = "solid", col = c("orange", "gold"))
            })
    }
)