library(GGally)
library(ggplot2)


homework = read.csv("./homework8data.csv")

#Backwards
mdl1.1 = lm(Life.Exp ~ Population + Income + Murder + HS.Grad + Frost + Area + Illiteracy, data = homework)
#creates model with all categories
summary(mdl1.1) 
#remove Area because it has a p-value greater than .15. Area p-value = 0.9649

mdl1.2 = lm(Life.Exp ~ Population + Income + Murder + HS.Grad + Frost + Illiteracy, data = homework)
#creates model without Area. Keeps Population, Income, Murder, HS.Grad, Frost and Illiteracy
summary(mdl1.2) 
#remove Illiteracy because it has a p-value greater than .15. Illiteracy p-value = 0.9269

mdl1.3 = lm(Life.Exp ~ Population + Income + Murder + HS.Grad + Frost, data = homework)
#creates model without Area and Illiteracy. Keeps Population, Income, Murder, HS.Grad and Frost
summary(mdl1.3) 
#remove Income because it has a p-value greater than .15. Income p-value = 0.9153

mdl1 = lm(Life.Exp ~ Population + Murder + HS.Grad + Frost, data = homework)
#creates model without Area, Illiteracy and Income. Keeps Population, Murder, HS.Grad and Frost
summary(mdl1) 
#no more removals needed. Final model achieved
#final model
#Life.Exp = 7.103e+01 +5.014e-05(Population) -3.001e-01(Murder) +4.658e-02(HS.Grad) -5.943e-03(Frost) +e

#Fowards
mdl2.1 = lm(Life.Exp ~ Population, data = homework)
summary(mdl2.1) 
# 7th lowest p-value, p-value = 0.639

mdl2.2 = lm(Life.Exp ~ Income, data = homework)
summary(mdl2.2) 
# 4th lowest p-value, p-value = 0.0156

mdl2.3 = lm(Life.Exp ~ Murder, data = homework)
summary(mdl2.3) 
# 1st lowest p-value, p-value = 2.26e-11

mdl2.4 = lm(Life.Exp ~ HS.Grad, data = homework)
summary(mdl2.4) 
# 3rd lowest p-value, p-value = 9.2e-06

mdl2.5 = lm(Life.Exp ~ Frost, data = homework)
summary(mdl2.5) 
# 5th lowest p-value, p-value = 0.066

mdl2.6 = lm(Life.Exp ~ Area, data = homework)
summary(mdl2.6) 
# 6th lowest p-value, p-value = 0.458  

mdl2.7 = lm(Life.Exp ~ Illiteracy, data = homework)
summary(mdl2.7) 
# 2nd lowest p-value, p-value = 6.97e-06

mdl2 = lm(Life.Exp ~ Murder, data = homework) 
#adds Murder to model
summary(mdl2) 
#check if any variables have a p-value above .15
#no p-values above .15

mdl2 = lm(Life.Exp ~ Murder + Illiteracy, data = homework) 
#adds Illiteracy
summary(mdl2)
#check if any variables have a p-value above .15
#Illiteracy has a p-values above .15

mdl2 = lm(Life.Exp ~ Murder + HS.Grad, data = homework) 
#adds HS.Grad, removes Illiteracy to model
summary(mdl2)
#check if any variables have a p-value above .15
#no p-values above .15

mdl2 = lm(Life.Exp ~ Murder + HS.Grad + Income, data = homework) 
#adds Income to model
summary(mdl2)
#check if any variables have a p-value above .15
#Income has a p-values above .15

mdl2 = lm(Life.Exp ~ Murder + HS.Grad + Frost, data = homework) 
#adds Frost, removes Income to model
summary(mdl2)
#check if any variables have a p-value above .15
#no p-values above .15

mdl2 = lm(Life.Exp ~ Murder + HS.Grad + Frost + Area, data = homework)
#adds Area to model
summary(mdl2)
#check if any variables have a p-value above .15
#Area has a p-values above .15

mdl2 = lm(Life.Exp ~  Murder + HS.Grad + Frost + Population, data = homework) 
#adds Population, removes Area to model
summary(mdl2)
#check if any variables have a p-value above .15
#no p-values above .15

mdl2 = lm(Life.Exp ~  Murder + HS.Grad + Frost + Population, data = homework) 
#final model 
summary(mdl2) 
#summarizes final model
# Life.Exp = 7.103e+01 -3.001e-01(Murder) +4.658e-02(HS.Grad) -5.943e-03(Frost) +5.014e-05(Population) +e

#step fuction
step(mdl1.1, direction='backward')
#step function uses backward selection to create final model
# Life.Exp = 7.103e+01 +5.014e-05(Population) -3.001e-01(Murder) +4.658e-02(HS.Grad) -5.943e-03(Frost) +e

nullmod = lm(Life.Exp ~ 1, data = homework)
fwd = step(nullmod, scope=list(upper=mdl1.1), direction='forward')
#step function uses forward selection to create final model
# Life.Exp = 7.103e+01 -3.001e-01(Murder) +4.658e-02(HS.Grad) -5.943e-03(Frost) +5.014e-05(Population) +e

#fowards and backwards selection produced the same models

#plot of model
plot(mdl1,lwd=0.5)
#plots the final model
#Residual don't have a pattern 
#Normal Q-Q has a shows a positive trend
#Scale-location is scatter (no pattern)
#Residuals vs Leverage has a group around 0 standardized residuals with a few point spread out

cookdist = cooks.distance(mdl1)
#creates cook distance of final model
plot(cookdist)
#plots cook distance
#one potetial outlier with a cookdist above .3, the rest seem to be equl to .1 or lower

