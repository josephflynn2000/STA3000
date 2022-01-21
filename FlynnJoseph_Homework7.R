library(ISwR)
library(tidyr)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(directlabels)
library(BlandAltmanLeh)

#Question 1: (1-sample t-test)

ggplot() + aes(react)+ geom_histogram(binwidth=1,fill = "white", color = "grey30")
#the distributed looks reasonably normal

a1 = t.test(react, mu= 0, alternative = "two.sided") #conducts 1-sample t-test of react data
a1 #p-value = 1.115^-13
#the mean differes significantly from zero 

#Question 2: (Wilcoxon signed-rank test)

#H0= mu=42, HA= mu <42
percoldiff = midwest$percollege-42 #difference between values and H0
percolabs = abs(percoldiff) #absolute value of difference
Ri = rank(percolabs) #rank of absolute
Zi = (percoldiff>0)*1 #checks if difference is positive
W = sum(Zi*Ri) #sums vaules with a poisitive difference, W = 20

n = length(midwest$percollege) #number of data points, n=437
mu = n*(n+1)/4 #mu of W, mu = 47851.5
variance = n*(n+1)*(2*n+1)/24 #variance of W, variance = 6978343.75

W2 = (W - mu)/sqrt(variance) #W2 = -18.1066

p_value = pnorm(W2,lower.tail = TRUE) 
#The probability that the mu is greater than 42 is 1.4124^-73, p_value = 1.4124^-73

a2 = p_value*2
#The probability that the mu is equal to 42 is 2.8248^-73, a2 = 2.8248^-73

#Question 3: (2-sample t-test)

mid = midwest %>% filter(state == "IL" | state == "WI") %>% select(state, percadultpoverty)
#Creates table of only entries with IL or WI as the state

p1 <- ggplot(mid, aes(percadultpoverty)) +geom_histogram(fill = "white", color = "grey30") +facet_wrap(~ state)
#Creates a histogram of percent adult poverty for IL and WI
p2 = ggplot(mid, aes(log(percadultpoverty))) +geom_histogram(fill = "white", color = "grey30") +facet_wrap(~ state)
#Creates a histogram of the log percent adult poverty for IL and WI
grid.arrange(p1, p2, nrow = 2)
#Plots p1 and p2
#p2 looks closer to a normal distribution than p1, so the log of percent adult poverty will be used in the two-sample t-test

a3 = t.test(log(percadultpoverty) ~ state, data = mid, var.equal=TRUE)
a3 #p-value = 0.1706
#There isn't a significant differences between the average percent of adult proverty in IL and WI 

#Question 4: (Paired t-test)

bland.altman.plot(intake$pre,intake$post,graph.sys = "ggplot2")
#Creates graph of difference between pre and post

before = intake$pre #values before 
after = intake$post #values after 
differ = before - after #difference of before and after

t_stat = mean(differ)/(sd(differ)/sqrt(length(differ))) #t_stat for difference of before and after
t_stat #t_stat = 11.9413

crit_val = qt(0.975, length(differ)-1) #critical value for difference
crit_val #crit_val = 2.2281

#The absolute value of t_stat is greater than crit_val means that these distributions are significantly different

a4 = 2*pt(t_stat, length(differ)-1, lower.tail = FALSE) #a4 = 3.0590^-7
#probability that the distributions are the same is 3.0590^-7
#The two distributions have significant difference between pre-intake and post-intake


