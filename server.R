library(shiny)

library(HistData)
data(PearsonLee)
fit <- lm(child ~ ., data = PearsonLee)

shinyServer(
    function(input, output) {
        
    }
)