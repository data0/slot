---
title       : Illustrating Unfair Slot Machine
subtitle    : Developing Data Products Course Project
author      : Serge
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction  
  
Some time ago I was inspired by Penney's game, which has been described in 1969 by Walter Penney. 
There is a good article dedicated to this game in Wikipedia: https://en.wikipedia.org/wiki/Penney's_game.  
  
Game's rule is simple. Two players have to predict three coin tosses. Player A goes first and tells his prediction. Player B has a freedom to select any other combination, except the one predicted by player A. For example, player A has selected "tails-tails-tails" and player B - "heads-heads-heads". Then one coin is flipped repeatedly, resulting in a sequence like: "heads-tails-heads-heads-tails-tails-tails..." The prediction appears first in a run of coin tosses wins.  
  
The "magic" here is that player B has better chances to win by choosing sequences according to the matrix on the next page.


--- .class #id 

## About the Unfair Slot Machine

I had an idea to build a kind of web-based slot machine with 9 graphical reels and 33 symbols on each reel, but due to the Christmas rush I was able to manage just two symbols 3 reels machine. It's available at: https://data0.shinyapps.io/datasci. Please be charitable. I know, it looks ugly, there are known and unknown bugs, but I was not able to fix everything and implement planned features due to lack of time.
Any suggestions and constructive criticism would be welcome.  


##### Optimal player B's strategy
<!-- html table generated in R 3.2.2 by xtable 1.8-0 package -->
<!-- Mon Dec 21 12:40:44 2015 -->
<table border=1>
<tr> <th>  </th> <th> Player A </th> <th> Player B </th>  </tr>
  <tr> <td align="right"> 1 </td> <td> Heads-Heads-Heads </td> <td> Tails-Heads-Heads </td> </tr>
  <tr> <td align="right"> 2 </td> <td> Heads-Heads-Tails </td> <td> Tails-Heads-Heads </td> </tr>
  <tr> <td align="right"> 3 </td> <td> Heads-Tails-Heads </td> <td> Heads-Heads-Tails </td> </tr>
  <tr> <td align="right"> 4 </td> <td> Heads-Tails-Tails </td> <td> Heads-Heads-Tails </td> </tr>
  <tr> <td align="right"> 5 </td> <td> Tails-Heads-Heads </td> <td> Tails-Tails-Heads </td> </tr>
  <tr> <td align="right"> 6 </td> <td> Tails-Heads-Tails </td> <td> Tails-Tails-Heads </td> </tr>
  <tr> <td align="right"> 7 </td> <td> Tails-Tails-Heads </td> <td> Heads-Tails-Tails </td> </tr>
  <tr> <td align="right"> 8 </td> <td> Tails-Tails-Tails </td> <td> Heads-Tails-Tails </td> </tr>
   </table>


--- .class #id 

## ui.R Variables  


|Variable name|Description   |
|---|---|
|input$goButton|Input value of the Go button|
|slot_1|Reel 1 value (input variable)|
|slot_2|Reel 2 value (input variable)|
|slot_3|Reel 3 value (input variable)|
|output_player_name|Rendered human player's name|
|round|Rendered game counter|
|your_choice|Render human player's choise|
|data_sci_choice|Render Data Scientist's choice|
|randomSeq|Rendered 37 random binomials|
|referee|Rendered winner of the current round|
|score|Rendered score plot|


--- .class #id 

## Bugs and Features  
  
1. This application has only one shinyapps instance with instance idle timeout 30 min. This means that your score may summarize with results of another human player disregard of the entered player name.
2. Reloading your webpage will reset the Round's value, but not the Score. The Score will be reset by reaching the idle time out.
3. The red line in the score plot shows the expected draw level for a simple fair coin game.  
  
  
  
### <span style="color:green; font-weight:bold">    *** I wish you a Merry Christmas and a Happy New Year! ***</span>

  





