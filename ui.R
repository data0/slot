library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Illustrating Unfair Slot Machine"),
    
    sidebarPanel(
        textInput(inputId="player_name", value="Guest", label = "Enter your name"),
        p("Make your choice:"),
        sliderInput(inputId='slot_1', label='Reel 1',value = 0, min = 0, max = 1, step = 1, ticks=F),
        sliderInput(inputId='slot_2', label='Reel 2',value = 0, min = 0, max = 1, step = 1, ticks=F),
        sliderInput(inputId='slot_3', label='Reel 3',value = 0, min = 0, max = 1, step = 1, ticks=F),
        actionButton(inputId="goButton", label="Go"),
        p("Click the button to generate a random sequence and determine the winner.")    
    ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Documentation",
                     br(),
                     h4("Please read this documentation before clicking on the \"Go\" button."),
                     br(),
                     h5("This is a very simple slot machine with three reels. You may select 0 or 1 for each reel."),
                     h5("Your opponent, Data Scientist, will make a choice after you."),
                     h5("Simply press the \"Go\" button when you are ready."),
                     h5("A random sequence of 37 binomials (0 and 1) will be generated."),
                     h5("If Data Scientist's combination appears first - your opponent wins. Otherwise, you are the winner."),
                     h5("You may ask: What will be if there is no match found?"),
                     h5("The answer is simple: You won. Data Scientist is a generous person ;)"),
                     h5("It's your duty to double-check who wins. Do not trust this application."),
                     tags$hr(),
                     h4("Can you bit Data Scientist?"),
                     tags$hr(),
                     br(),
                     h5("You are able to swap between Documentation and Game panel any time."),
                     h5("If the rules are clear, feel free to switch to the Game panel and follow instructions below."),
                     tags$ol(
                         tags$li("Maximize this window"),
                         tags$li("Enter your name"),
                         tags$li("Make your choice by sliding reels and select 0 or 1"),
                         tags$li("Click the \"Go\" button"),
                         tags$li("Have fun!")
                     ),
                     br()
            ),
            tabPanel("Game Panel",
                     h6('Your Name:'),
                     verbatimTextOutput("output_player_name"),
                     
                     h6('Round:'),
                     verbatimTextOutput("round"),
                     
                     h6('Your Choice:'),
                     verbatimTextOutput("your_choice"),    
                     
                     h6('Data Scientist\'s Choice:'),
                     verbatimTextOutput("data_sci_choice"),     
                     
                     h6('Binomial Random Sequence:'),
                     verbatimTextOutput("randomSeq"),
                     
                     h6('Winner:'),
                     verbatimTextOutput("referee"),
                     
                     plotOutput("score")
            )
        )
    )
)
)
