library(readxl)
hi = read_excel("Data.xlsx")
str(hi)

#data cleaning
anyNA.data.frame(hi)  #checking if any NA values
which(! complete.cases(hi))   #checking if any NA values
df <- na.omit(hi)

#Data transformation
#hi$health <- ifelse(hi$verygood==1, 'vg', ifelse(hi$good==1, 'g', ifelse(hi$fair==1, 'f', ifelse(hi$poor==1, 'p', NA))))
#hi$health<-as.factor(hi$health)
#hi$health<-relevel(hi$health,'p')
#Data Visualization
library(PerformanceAnalytics)
library(dplyr)
hi_cor <- select(hi,medexpense,age,income,illnesses,ssiratio,firmsize,educyr,agesqrd,logincome,logmedexpense)
chart.Correlation(hi_cor)

#Question 1
library(ggplot2)
ggplot(hi,aes(x=hi$medexpense)) + geom_histogram(color="black", fill="lightblue")+labs(title='Medical Expense',x='Medical Expense')
ggplot(hi,aes(x=log(hi$medexpense))) + geom_histogram(color="black", fill="lightblue")+labs(title='Medical Expense',x='Medical Expense')

#Linear models
#m1
hi=select(hi,-logincome,-medexpense,-vgh,-fph,-blackhisp,-firmlocation)
attach(hi)
lm1=lm(logmedexpense~.,hi)
summary(lm1)

lm1 = lm(logmedexpense~.-married-firmsize-black-hisp-ssiratio-agesqrd,hi)
summary(lm1)

#lm2 = lm(logmedexpense~.-married-firmsize-black-hisp-agesqrd-ssiratio-income-age-private,hi)
#summary(lm2)

lm2 = lm(logmedexpense~.-married-firmsize-agesqrd-ssiratio-income,hi)
summary(lm2)

library(robustbase)
lm3 <- lmrob(logmedexpense~.-married-firmsize-agesqrd-ssiratio-income, data=hi)
summary(lm3)

stargazer(lm1,lm2,lm3,type='html')

stargazer(lm1,lm2,lm3, type='text', title='Descriptive Statistics', out='table1.htm',
          single.row=TRUE)


##line for lm3

#Linearity
plot(hi$logmedexpense,lm3$fitted.values,pch=19,main="Actual v. Fitted Values")
abline(0,1,col="red",lwd=3)
plot(lm3)

#Normality
qqnorm(lm3$res)                              # Q-Q plot
qqline(lm3$res, col="red")
ks.test(rnorm(10000),lm3$res)

#homoskedasticity
bartlett.test(list(lm3$res, lm3$fit))

#autocorrelation
library(lmtest)
dwtest(lm3) 

#multicollinearity
vif(lm3)

