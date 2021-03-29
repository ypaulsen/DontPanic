
################################################################################
################################################################################
## Monty Hall by Monte Carlo ###################################################
################################################################################
################################################################################

# The following program simulates the famous Monte Hall Paradox using Monte 
# Carlo methods. It works by creating three doors, sampling one at random for 
# the winning door, and then sampling from all three again to make a choice for 
# the simulated contestant. The program then decides which door or doors remain.
# E.g. If the winning door is 1, and the contestant chooses 1, then 
# "other_doors" will contain 2 and 3. If the winning door is 1 and the 
# contestant chooses 2, then "other_doors" will contain only 3. 

# The program then samples from "other_doors" to find an empty door to reveal. 
# Next the program evaluates which door would be switched to if the contestant
# decided to switch (i.e whichever door is neither the "choice_door", nor the 
# "empty_door_revealed").  

# If the "switch_to" door is the same as the "winner_door" then the program 
# records a "switch_win"; these are the games that the contestant would win by 
# switching doors when offered the option. If the "choice_door" is the same as 
# the "winner_door" then the program records a "natural_win"; these are the 
# games that would be won by the contestant who decided not to switch when given 
# the opportunity.    

# Finally this program repeats that procedure 100,000 times to find the 
# simulated distribution of outcomes, it then tabulates and outputs the results.  

# The outcome here follows the theoretical distribution of wins. In around 67%  
# of cases the winning door is the "switch_to" door, and a natural win is 
# recorded in only around 33% of these trials - those in which the winning door 
# was chosen on the first guess.   


set.seed(1701)
n <- 100000
switch_wins <- c()
natural_wins <-  c()
doors <- 1:3

for(i in 1:n) {
  winner_door <- sample(doors, 1) 
  choice_door <- sample(doors, 1)
  other_doors <- doors[doors != winner_door & doors != choice_door]
  
  empty_door_revealed <-  other_doors[sample(length(other_doors), 1)]
  switch_to <- doors[doors != choice_door & doors != empty_door_revealed]
  
  # Contestant wins by switching 
  switch_wins[i] <- ifelse(switch_to == winner_door, 1, 0)
  
  # Contestant wins by not switching     
  natural_wins[i] <- ifelse(choice_door == winner_door, 1, 0)
}

Pnw <- sum(natural_wins)/length(natural_wins)
Psw <- sum(switch_wins)/length(switch_wins)

# Tabulate results  
tab <- rbind("Contestant never switches" = round(Pnw,3), 
             "Contestant always switches" = round(Psw,3))
df <- data.frame(tab)
names(df) <- c("Win percent")
df


################################################################################
################################################################################
