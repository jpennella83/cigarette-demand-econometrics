cig = read.csv("CigarettesSW.csv")
cig.data = subset(cig, year == "1995")
describe(cig.data)
cig.data
plot(cig.data$packs,cig.data$price)
##an introductory model to see how price, income, and tax all relate to the amount of packs sold 
cig.model = lm(packs~price+income+tax,data=cig.data)
summary(cig.model)

##a quick look at the assumption plots reveal that some are not met, but there may be transformations that can be used 
shapiro.test(resid(cig.model))
par(mfrow=c(2,2))
plot(cig.model)

##VIF is a problem with some of the factors
library(car)
vif(cig.model)

##log model, not much improvement
cig.logmodel = lm(log(packs)~price+income+tax,data=cig.data)
summary(cig.logmodel)

par(mfrow=c(2,2))
plot(cig.logmodel)
shapiro.test(resid(cig.logmodel))
vif(cig.logmodel)

##creating a new variable that controls for larger states naturally having much larger total incomes.  Dividing by population shows individual income and helps make more clear the impacts of economic effects on individuals
personal.income = cig.data$income/cig.data$population
cig.data$personal.income <- cig.data$income/cig.data$population

cig.model2 = lm(packs~personal.income+price+tax,data=cig.data)
summary(cig.model2)

##model is better, more normal 
par(mfrow=c(2,2))
plot(cig.model2)
shapiro.test(resid(cig.model2))
vif(cig.model2)

##let's try fixing the correlation in price and tax.  Since price includes tax automatically, we can create a new column for pre-tax price by subtracting the tax for each column from the price for each column

cig.data$net.price <- cig.data$price - cig.data$tax

#making a new model using our new data
cig.model3 = lm(packs ~personal.income+net.price+tax,data=cig.data)

##much better VIF, and we see a fixed constant error variance 
##in the plot of residuals vs. fitted
summary(cig.model3)
par(mfrow=c(2,2))
plot(cig.model3)
shapiro.test(resid(cig.model3))
vif(cig.model3)
plot(residuals(cig.model3))
abline(0,0)


##descriptive statistics
summary(cig.data[, c("packs", "personal.income", "net.price", "tax")])

##graphical statistics
hist(cig.data$packs)
plot(cig.data$net.price,cig.data$packs)
plot(cig.data$personal.income,cig.data$packs)
plot(cig.data$tax,cig.data$packs)