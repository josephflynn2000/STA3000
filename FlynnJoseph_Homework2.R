#Question 1
m1 = matrix(c(50,8,20,60,30,40,40,30,40),nrow = 3, ncol = 3, byrow=TRUE)
rownames(m1) = c("breakfast","lunch","dinner")
colnames(m1) = c("carbs","fat","protein")
m1 #matrix of meals and macronutrients

#part 1
p1 = colSums(m1) #carbs at 150g, fat at 68g, and protein at 100g
p1

#part 2
p2 = (m1[,1]*4)+(m1[,2]*9)+(m1[,3]*4) #breakfast at 352, lunch at 670, and dinner at 590
p2
p3 = sum(p2) #total of 1612 calories
p3
#Yes he stayed under 1,800 calories for the day by a margin of 188 calories.

#part 3
p4 = c((sum(m1[,1]*4)/p3)*100,(sum(m1[,2]*9)/p3)*100,(sum(m1[,3]*4)/p3)*100) #carbs=37.22084%, fat=37.96526%, protein=24.81390%
names(p4) = c("carbs","fat","protein")
p4
#He got close to his goal. He needs to eat less fats and eat slightly more proteins and carbs.
