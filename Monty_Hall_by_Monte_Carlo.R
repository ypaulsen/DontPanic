
################################################################################
################################################################################
## Monty Hall by Monte Carlo ###################################################
################################################################################
################################################################################

# The following program simulates the famous Monty Hall Paradox using Monte 
# Carlo methods. It works by creating three doors, sampling one at random for 
# the winning door, and then sampling from all three again to make a choice for 
# the simulated contestant. The program then determines which door or doors 
# remain and samples from "remaining_doors" to find a goat to reveal. Next it 
# evaluates which door would be switched to if the contestant decided to switch 
# (i.e whichever door is neither the "choice_door", nor the "revealed_goat").  

# If the "switch_to" door is the same as the "winner_door", the program records 
# a "switch_win"; these are the games that the contestant would win by changing 
# their choice. If the "original_choice" is the same as the "winner_door" then the 
# program records a "natural_win"; these are the games that would be won by the 
# contestant who decided not to switch when given the opportunity.    

# This program repeats that simulation 100,000 times to find a simulated 
# distribution of outcomes, it finally tabulates and outputs the results.  

MC <- 100000
switch_wins <- c()
natural_wins <-  c()
doors <- 1:3

for(i in 1:MC) {
  winner_door <- sample(doors, 1) 
  original_choice <- sample(doors, 1)
  remaining_doors <- doors[doors != winner_door & doors != original_choice]
  revealed_goat <- remaining_doors[sample(length(remaining_doors), 1)]
  switch_to <- doors[doors != original_choice & doors != revealed_goat]
  
  # Contestant wins by switching 
  switch_wins[i] <- ifelse(switch_to == winner_door, 1, 0)
  # Contestant wins by not switching     
  natural_wins[i] <- ifelse(original_choice == winner_door, 1, 0)
}
P_win_natural <- mean(natural_wins)
P_win_switch <- mean(switch_wins)

# Tabulate results  
tab <- rbind("Contestant never switches" = round(P_win_natural,3), 
             "Contestant always switches" = round(P_win_switch,3))
df <- data.frame(tab)
names(df) <- c("Win percent")
df

# The outcome here follows the theoretical distribution of wins. In around 67%  
# of cases the winning door is the "switch_to" door, and a natural win is 
# recorded in only around 33% of these trials - those in which the winning door 
# was chosen on the first guess. 

################################################################################
################################################################################
