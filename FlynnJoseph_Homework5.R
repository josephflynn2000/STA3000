library(ISwR)
library(dplyr)
#Question 1
stroke <- read.csv2(system.file("rawdata","stroke.csv", package="ISwR"),na.strings=".")#sets stroke data to variable stroke
  #1
stroke = stroke %>% mutate(DSTR = as.Date(stroke$DSTR, format= '%d.%m.%Y')) 
#converts DSTR to date class
stroke = stroke %>% mutate(DIED = as.Date(stroke$DIED, format= '%d.%m.%Y')) 
#converts DIED to date class

  #2
a1 = c(mean = mean.Date(stroke$DSTR), median = median(stroke$DSTR)) 
#mean = 1992-07-27, median = 1992-08-12
#calculates mean and median of DSTR, sets it to a1 

  #3
a2 = c(mean = mean.Date(na.omit(stroke$DIED)), median = median(na.omit(stroke$DIED))) 
#mean = 1993-02-15, median = 1993-01-23
#calculates mean and median of DIED after removing N/A, sets it to a2 

  #4
a3 = a2[1]-a1[1] 
#Time difference of 203.4268 days
#the difference between mean death and mean date of stroke

#Question 2
#The probability of getting a female chick is 55%

b1 = dbinom(6, size=10, prob= .55) # b1 = 0.2383
#probability of getting 6 female chicks out of 10

b2 = 1 - pbinom(5, size=10, prob= .55) # b2 = 0.5044
#probability of getting 6 or more female chicks outs of 10

#Question 3

# radndom variable X from a distribution with mean = 80.2 & sd = 2.12
#P(X≤a) =0.4, find a and equal it to variable c
c = qnorm(.4, 80.2, 2.12) # c = 79.6629
# X has a proability of .4 of being less than or equal to a = c = 79.6629

