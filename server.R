library(shiny)

## Data and prediction model
library(HistData)
data(PearsonLee)
fit <- lm(child ~ ., data = PearsonLee)

shinyServer(
    function(input, output) {
        
    }
)