#Question1
todayfahrenheit = 8 #daily temperature in fahrenheit
a1 = (todayfahrenheit-32)*(5/9) #converts fahrenheit to celsisus

#Question2
x = 100:150 #from 100 to 150
a2 = mean(100:120) #averages 100 to 120
b2 = sum(101:149) #totals 101 to 149

#Question3
var1=FALSE; var2=pi; var3=-2 #creates var1, var2, var3
a3 = (log10(var2)+var2^3)/exp(var3) #calculates a3
b3 = (var1+var2+var3)^(1/3) #calculates b3

#Question4
kb=c(7.6,15.4,19.9,22.5,28.5,25.2,30.0,24.0,27.6,35.4,31.6,28.3,26.8,27.0,25.3,27.9,27.3,13.8,22.3,17.6)
a4 = sum(25 < kb) #counts the number of times kb was above 25

#Question5
m1 = matrix(c(1:20), nrow=5, ncol=4, byrow=FALSE) #creates matrix m1 with 5 rows and 4 columns
rownames(m1) = c("row1","row2","row3","row4","row5") #labels rows
colnames(m1) = c("col1","col2","col3","col4") #labels columns
rowSums(m1); colSums(m1); sum(m1) #totals rows, columns, and all elements