#Geofrey Ogoti


#MISCELLANEOUS CODE

options(repos=c(RStudio='http://rstudio.org/_packages', getOption('repos')))
install.packages('shiny')
install.packages(c("cluster", "foreign", "KernSmooth", "lattice", "MASS", "Matrix", "mgcv", "nlme", "rpart", "survival"))
options(repos=c(RStudio='http://rstudio.org/_packages', getOption('repos')))
install.packages('shiny')
options(repos=c(RStudio='http://rstudio.org/_packages', getOption('repos')))
install.packages('shiny')
install.packages('shiny')


#QUESTION B

countydata<-read.csv("C:\\Users\\Geofrey Ogoti\\Desktop\\TSA\\countydata.csv", header=T, sep=",")
summary(countydata)
plot (countydata)
fix(countydata)
cor(countydata)
plot(countydata$cmort~countydata$part, ylab= "cardiovascular mortality", xlab="particulate pollution", col="blue", main= "Mortality vs Particulate Pollution", type="l")
plot (countydata$cmort, ylab="Mortality", xlab="Index", main="Mortality Occurrences", col="purple")
plot(countydata$cmort~countydata$temp, ylab= "cardiovascular mortality", xlab="temperature", col="green", main= "Mortality vs Temperature", type="l")
hist(countydata$temp)
hist(countydata$cmort, xlab="Mortality", main= "Mortality")
plot(countydata$cmort~countydata$temp, ylab= "cardiovascular mortality", xlab="temperature", col="green", main= "Mortality vs Temperature", type="l")
getwd()
plot (countydata$part, type="l", col= "maroon", ylab="Particulate", main= "Particulates")
plot(countydata$cmort, ylab="Mortality", type="l", col="purple", main="Mortality Rates")
plot(countydata$part, type="l", ylab="particulate", Main= "Particulates", col= "yellow")
summary(countydata$temp)
plot(countydata$temp)
plot(countydata$temp, type= "l")
?plot
?markov
attach(countydata)
dev.new()
plot (countydata$cmort, ylab= "mortality", main= "Mortality Data", type="l", col= "red")
plot (countydata$temp, ylab= "temperature", main= "Temperature Data", type="l", col= "maroon")
plot (countydata$part, ylab= "particulate pollution", main= "Particulate Pollution Data", type="l", col= "green")
plot (countydata, main = "Scatterplot Matrix")
tempr = temp-mean(temp)
tempr2 = tempr^2
trend = time(cmort)
fit1 = lm (cmort~trend)
fit2 = lm (cmort~ trend + tempr)
fit3 = lm (cmort~ trend + tempr + tempr2)
fit4 = lm (cmort~ trend + tempr + tempr2 + part)
num = length (cmort)
AIC(fit1)/num - log(2*pi)
AIC(fit2)/num - log(2*pi)
AIC(fit3)/num - log(2*pi)
AIC(fit4)/num - log(2*pi)
AIC(fit1, k=log(num))/num - log(2*pi) #Bayesian Information Criterion
AIC(fit2, k=log(num))/num - log(2*pi) #Bayesian Information Criterion
AIC(fit3, k=log(num))/num - log(2*pi) #Bayesian Information Criterion
AIC(fit4, k=log(num))/num - log(2*pi) #Bayesian Information Criterion
(AICc = log(sum(resid(fit)^2)/num) + (num+5)/(num-5-2))
summary (fit1)
summary (fit2)
summary (fit3)
summary (fit4)
anova (fit1)
anova (fit2)
anova (fit3)
anova (fit4)
plot.ts (cmort, ylab= "mortality", main= "Mortality data with imposed fits")
lines (fit1$fit,col= "red")
lines (fit2$fit,col= "blue")
lines (fit3$fit,col= "green")
lines (fit4$fit,col= "maroon")
legend(270, 133, c("fit1", "fit2"), c("red", "blue"))
legend(400, 133, c("fit4", "fit5"), c("green", "maroon"))

#Question B Code

wk = time(cmort) - mean(time(cmort))
t1 = 1:length(cmort)
wk2 = wk^2
t2 = t1^2
wk3 = wk^3
t3 = t1^3
cs = cos(2*pi*wk)
c = cos(2*pi*t1/52)
sn = sin(2*pi*wk)
s = sin(2*pi*t1/52)
reg1 = lm(cmort~wk + wk2 + wk3, na.action=NULL) # first fit
fit5 = lm (cmort~t1 + t2 + t3)
reg2 = lm(cmort~wk + wk2 + wk3 + cs + sn, na.action=NULL) #second fit
fit6 = lm (cmort ~ t1 + t2 + t3 + c + s) 
summary (reg1)
summary(reg2)
plot.ts(cmort, ylab= "mortality", main= "Question 1B with fitted models")
lines(fit5$fit, col= "red")
lines(fit6$fit, col= "blue")  #similiar to lines(reg2$fit, col= "blue")
legend(400, 133, c("fit5", "fit6"), c("red", "blue")) 
anova(fit5)
anova(fit6)


# new assignment
stand = c (1 : 20)
x = c (3.3,3.4,3.4,3.5,3.6,3.6,3.7,3.7,3.8,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,5.0,5.1,5.2) #soil pH
y = c (17.78,21.59,23.84,15.13,23.45,20.87,17.78,20.09,17.78,12.46,14.95,15.87,17.45,14.35,14.64,17.25,12.57,7.15,7.50,4.34) #growth retardation
length (x)
length (y)
study = data.frame(STAND = stand, PH= x, GROWTH = y)
study
plot (y~x, ylab= "retardation growth", xlab="Soil pH", main = "Scatterplot of Growth vs Soil pH" , lwd=3)
fit = lm (y~x)
abline(fit)
legend(4.5, 22, "line fit", lty=1)
summary (fit)
anova(fit)


# new assignment part 2
infant = c (1:25) #infant
x1 = c (3, 4,5,6,3,4,5,6,3,4,5,6,3,4,5,6,3,4,5,6,3,4,5,6,6) #age
length (x1)
x2= c (2.61,2.67,2.98 ,3.98,2.87,3.41,3.49,4.03,3.41,2.81,3.24,3.75,3.18,3.13,3.98,4.55,3.41,3.35,3.75,3.83,3.18,3.52,3.49,3.81,4.03) #weight
length (x2)
y = c (80,90,96,102,81,96,99,110,88,90,100,102,86,93,101,103,86,91,100,105,84,91,95,104,107) #blood pressure
length (y)
medicalstudy = data.frame (INFANT= infant, AGE = x1, WEIGHT = x2, BP = y)
medicalstudy
fitA = lm (y ~ x1 + x2) # y is blood pressure x1 is Age and x2 is Weight
summary (fitA)
anova (fitA)

par(mfrow = c(2,1))

plot (y~x2, ylab= "blood pressure", xlab= "weight", main= "Blood Pressure Vs WEIGHT and AGE")

plot (y~x1, ylab= "blood pressure", xlab= "Age")


#legend

legend(3.5, 10, "x", lty =1, lwd=6, col ="green" )
