library(shiny)

#library(shinyapps)
#deployApp()
#shinyapps deployed URL https://data0.shinyapps.io/datasci

#Variables to count game points
humanPoints <<- 0
compPoints <<- 0


shinyServer(
    function(input, output) {
        
        #gameCounter() is a function to count game rounds
        gameCounter=eventReactive(input$goButton, {
            input$goButton
        })
        
        #randomSeq() is a function to generate 37 random binomials
        randomSeq=eventReactive(input$goButton, {
            rbinom(37, 1, 0.5)
        })  
        
        #referee() is a function to select a game winner and to increment points
        referee=eventReactive(input$goButton, {
            if(regexpr(pattern = paste(input$slot_1, input$slot_2, input$slot_3, sep=""), text = paste(randomSeq(), collapse=""))[1] <=
                   regexpr(pattern = paste(ifelse(input$slot_2 == 0, 1, 0), input$slot_1, input$slot_2, sep=""), text = paste(randomSeq(), collapse=""))[1]){
                humanPoints <<- humanPoints + 1
                print(input$player_name)
            } else{
                compPoints <<- compPoints + 1
                print("Data Scientist")
            }
        })  
        
        #scorePlot() is a function to plot game score
        scorePlot = eventReactive(input$goButton, {
            barplot(c(humanPoints, compPoints), col=c("blue", "green"), main = "Score", space=c(1,1), names.arg = c(input$player_name, "Data Scientist"))
            lines(c(0,500), c((humanPoints+compPoints)/2, (humanPoints+compPoints)/2), col="red", lwd=1)
        })
        
        #render a player name
        output$output_player_name = renderText(input$player_name)
        
        #render player's choice
        output$your_choice = renderText({paste(input$slot_1, input$slot_2, input$slot_3, sep = "")})
        
        #render data scientist's choice
        output$data_sci_choice = renderText({paste(ifelse(input$slot_2 == 0, 1, 0), input$slot_1, input$slot_2, sep="")})
        
        #render game rounds
        output$round = renderText({gameCounter()})
        
        #render a binomial random sequence
        output$randomSeq = renderText({randomSeq()})
        
        #render winner's name
        output$referee = renderText({referee()})
        
        #render score plot
        output$score = renderPlot(scorePlot(), width = 500, height = 200)
    }
)
