
library(ggplot2)
install.packages("directlabels")
library(directlabels)

#Question 1
ggplot(diamonds, aes(cut)) + geom_bar()
#Creates a barplot that show the amount of specific diamond cuts
#As cut increase from fair to ideal, the count increases

#Question 2
qplot(cut, data = diamonds, geom = "bar",fill = clarity)
#Creates a barplot that show the amount of specific diamond cuts and the amount of type of clarity
#As cut increase from fair to ideal, the count increases. Each cut is made up of multiple clarities

#Question 3
qplot(price, data = diamonds, geom = "histogram",fill = price)
#Creates a histogram of price

#The histogram shows exponential decay. So as the amount decreases, the price increases

#Question 4
ggplot(diamonds, aes(clarity, price)) + geom_boxplot()
#Creates a boxplot with price on the y-axis and clarity on the x-axis

#The price varies less from I1 to VS2, stays about the same from VS2 to VS1, then price varies more from VS1 to IF

#Question 5
qplot(cut, depth, data = diamonds, geom= "boxplot")
#Creates a boxplot with depth on the y-axis and cut on the x-axis

#The mean depth decrease from Fair to Premium, but then ticks up a bit from Premium to Ideal
#The range of the depth decrease from Fair to Premium, then inceases from Premium to Ideal
#Fair has the highest depth, which is near 80. While, Fair and Ideal share the lowest depth around 43
#The relationship seems that variance in depth decreases from Fari to Premium, then increases from Premium to Ideal

#Question 6
ggplot(diamonds, aes(carat, price)) + xlab(NULL) + ylab(NULL) + geom_point(shape = ".")+geom_smooth()
#Creates a scatterplot with price on the y-axis and carat on the x-axis. It also contains a trend line.

# The trend-line price increase from arounds 0.3 carat to around 2.3 carat, then the price decrease from around 2.3 carat to around 3.2 carat, which then increases from around 3.2 carat to 5 carat.

#Question 7
ggplot(diamonds, aes(carat, price, color = cut)) + xlab(NULL) + ylab(NULL) + geom_point(shape = ".") + geom_smooth(aes(group=cut))
#Creates a scatterplot with price on the y-axis and carat on the x-axis. It also contains a trend line for each cut.

#Fair: price increase as carat increase. Max carat of 5
#Good: price increase as carat increase. Max carat of 3
#Very Good: price increase as carat increase until carat of around 2.1, then price flattens out. Max carat of 4
#Premium: price increase as carat increase until carat of around 2.1, then price flattens out. Max carat of 4
#Ideal: price increase as carat increase until carat of around 2.1, then price decreases. Max carat of 3.5





                                                                                                                                 