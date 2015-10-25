library(data.table)
library(dplyr)
library(tidyr)
library(ggplot2)
data <- fread("data/year_age_income_from_cdc_interactive_data.csv",na.strings = c("~","*") )
data <- filter(data, Income != "All")
data <- gather(data, key = Condition, value= Prevalence, Heart_disease:Diabetes)
# data <- mutate(data, 
#                Income =as.factor(Income),
#                Year= as.factor(Year),
#                Age= as.factor(Age))


shinyServer(
    function(input, output) {
        
        output$text1 <- renderText({ 
            paste("You have selected", input$condition_chosen)
        })
        output$text2 <- renderText({ 
            paste("From", input$range[1],"to", input$range[2] )
        })
        
        output$d_prev_plot <-  renderPlot({
            input_condition <- input$condition_chosen
            input_age <- input$age_chosen
            ggplot(filter(data, Age == input_age & Condition == input_condition), aes(factor(Year), Prevalence, fill = factor(Income))) + geom_bar(stat = "identity",position = "dodge")+ ylab("Prevalence (%)") + xlab("Years")+ ggtitle(paste0(input_condition, " for Age group:  ", input_age))    
        })
        
    }
)