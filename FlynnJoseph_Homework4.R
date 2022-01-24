library(gapminder)
library(tidyr)
library(dplyr)
# Question 1

  #Part 1
c1 = gapminder %>% group_by(continent, year) %>% summarise(medLife = median(lifeExp)) 
#averages lifeExp by year and continent. Stores values in c1
e1 = c1 %>% group_by(continent) %>% summarise(perChange = (max(medLife)-min(medLife))/min(medLife))
#computes percentchange of lifeExp per continent by using the max and min averages of each continet from c1. Stores values in e1
f1 = e1 %>% filter(perChange == max(perChange))
#selects the entry with the greatest percent change in LifeExp
a1 = f1$continent
#selects the continents name
#a1 = Asia

  #Part 2
c2 = gapminder %>% group_by(continent, year) %>% filter(continent == 'Africa', gdpPercap == max(gdpPercap), year==2007)
#finds the entry with highest gdpPercap from Africa in 2007
a2 = c2$gdpPercap  
#selects the gdpPercap from c2
#a2 = 13206.48

  #Part 3
c3 = gapminder %>% group_by(continent, year) %>% filter(continent == 'Europe', gdpPercap== max(gdpPercap), year==2007)
#finds the entry with highest gdpPercap from Europe in 2007
a3 = c3$gdpPercap
#selects the gdpPercap from c3
#a3 = 49357.19

  #Part 4
a4 = 100*(count(gapminder %>% filter(continent == 'Asia', year == 2007, pop >= 50000000))/count((gapminder %>% filter(continent == 'Asia', year == 2007))))
#calculates percentage of Asian countries with a pop above 5 million in 2007
#a4 = 30.30303%

  #Part 5
a5 = 100*(count(gapminder %>% filter(continent == 'Europe', year == 2007, gdpPercap > 30000))/count((gapminder %>% filter(continent == 'Europe', year == 2007))))
#calculates percentage of European countries with a gdpPercap above 30,000 in 2007
#a5 = 43.33333%

#Question 2
nba_ht_wt = read.csv("./nba_ht_wt.csv")
#sets the csv file to nba_ht_wt

  #Part 1
nba_ht_wt = nba_ht_wt %>% mutate(Height= Height*.0254, Weight= Weight/2.20462)
#converts Height from inches to meters and converts Weight from lbs to kg

  #Part 2
d1 = nba_ht_wt[which.max(nba_ht_wt$Weight/(nba_ht_wt$Height^2)),]
#finds entry with highest BMI
b1 = d1$Player
#selects player's name with highest BMI
#b1 = Glen Davis

  #Part 3
b2 = 100*sum((nba_ht_wt$Weight/(nba_ht_wt$Height^2))>25)/sum(nba_ht_wt$Weight>=0)
#calculates the percentage of nba players with a BMI above 25
#b2 = 45.34653%

  #Part 4
d3 = nba_ht_wt %>% filter(Age>30)
#creates array of only players above 30
b3 =mean(d3$Weight/(d3$Height^2))
#calculates mean for players above 30 BMI
#b3 = 25.25125

  #Part 5
d4 = nba_ht_wt %>% filter(Pos == 'F')
#creates array of only Forwards 
b4 = mean(d4$Weight/(d4$Height^2))
#calculates mean of Forwards BMI
#b4 = 24.96092

