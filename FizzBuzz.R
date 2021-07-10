

FizzBuzz1 <- c()

for(i in 1:100){
  FizzBuzz1[i] <- i 
  if (i%%5 == 0 & i%%3 == 0) {FizzBuzz1[i] <- "Fizz Buzz"}
  else { 
    if (i%%3 == 0) {FizzBuzz1[i] <- "Fizz"} 
    else{
      if (i%%5 == 0) {FizzBuzz1[i] <- "Buzz"}
  }}
}
FizzBuzz1


FizzBuzz2 <- 1:100
fz <- which(FizzBuzz2%%3 == 0)
bz <- which(FizzBuzz2%%5 == 0)
fzbz <- which(FizzBuzz2%%5 == 0 & FizzBuzz2%%3 == 0)
FizzBuzz2[fz] <- "Fizz"
FizzBuzz2[bz] <- "Buzz"
FizzBuzz2[fzbz] <- "Fizz Buzz"
FizzBuzz2


FizzBuzz3 <- 1:100
x <- seq(0, 100, by=3)[-1]
y <- seq(0, 100, by=5)[-1]
z <- seq(0, 100, by=15)[-1]
FizzBuzz3[x] <- "Fizz"
FizzBuzz3[y] <- "Buzz"
FizzBuzz3[z] <- "Fizz Buzz"
FizzBuzz3


fizzbuzz <- function(x){
  for(i in 1:length(x)){
    if(i%%15==0){
      x[i] <- "FizzBuzz"
    } else {
      if(i%%3==0){
        x[i] <- "Fizz"
      } else {
        if(i%%5==0){
          x[i] <- "Buzz"
        }
      }
    }
  }
  return(x)
}

FizzBuzz4 <- fizzbuzz(1:100)



