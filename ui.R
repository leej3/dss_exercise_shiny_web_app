shinyUI(fluidPage(
    titlePanel("To change the plot:"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select the disease condition and the age group which you wish to assess"),
            
            selectInput("condition_chosen", 
                        label = "Condition",
                        choices = unique(as.character(data$Condition)),
                        selected = "Heart_disease"),
            selectInput("age_chosen", 
                        label = "Age group",
                        choices = unique(as.character(data$Age)))
            
            
        ),
        
        mainPanel(
            h1("A plot of disease prevalence in the USA separated by age group and income status"),
            #textOutput("text1"),
            #textOutput("text2"),
            plotOutput("d_prev_plot"),
            h6("Data  was obtained from the website of the USA's ''Centre for disease control and prevention'' website (based on the survey data of the NHIS). Family income expressed as a percent of the poverty threshold. Reported and imputed income levels were grouped into three categories: poor (<100% of the poverty threshold), near poor (100% to <200% of the poverty threshold) and nonpoor (200% of the poverty threshold or greater). The poverty threshold for each year is based on definitions originally developed by the Social Security Administration. These thresholds are updated annually by the U.S. Census Bureau to reflect changes in the Consumer Price Index for all urban consumers (CPI-U). ")
            
        )
    )
))