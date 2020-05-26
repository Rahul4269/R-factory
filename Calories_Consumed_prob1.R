#Load data
cal <- read.csv("C:/Users/DELL/Desktop/Linear Regression/Simple linear Regression/Assignment/calories_consumed.csv")
View(cal)
colnames(cal)
#############################################################

# Visualization
install.packages("lattice")
library(lattice)
#dot plot
dotplot(cal$Weight_gained_.grams., main="Dot Plot of Weight_gained_.grams.",col="dodgerblue4")
dotplot(cal$Calories_Consumed, main="Dot Plot of Calories_Consumed", col="dodgerblue4")


#box plot
boxplot(cal$Weight_gained_.grams.,col="dodgerblue4")
boxplot(cal$Calories_Consumed,col="dodgerblue4")


#scatter plot
plot(cal$Calories_Consumed)
plot(cal$Weight_gained_.grams.)
#scatter plot of x var vs y var
plot(cal$Calories_Consumed,cal$Weight_gained_.grams.)

#####################################################


#Regression equation
#Syntax  model<-lm(y~x,data=data set name)

model<- lm(Weight_gained_.grams.~Calories_Consumed,data =cal)
summary(model)

new_cal=data.frame(Calories_Consumed=c(2400))# creating data frame for which x value we want to calculate or predict Y values
#this x value whitin the range of x colomn vales range

cal1=predict(model,new_cal)
cal1

#Predict for daily variable from the historical data / predict value for each x variable
pred<-predict(model)
#Print predicted values
pred
#Prepare a new data frame with pred and error
finaldata<-data.frame(cal,pred,"Error"= cal$Weight_gained_.grams.-pred)
View(finaldata)


#########################
plot(cal)
plot(model)

#Residuals vs Regressors
library(car)
residualPlots(model)
#Added Variable Plots
avPlots(model)
#QQ plots of studentized residuals
qqPlot(model)
#Deletion Diagnostics
influenceIndexPlot(model) # Index Plots of the influence measures

##################################################3

cal2<-cal[-13,]

model1<-lm(Weight_gained_.grams.~Calories_Consumed,data =cal2)
summary(model1)
plot(model1) 
residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)
###############################################

cal3<-cal2[-7,]

model2<-lm(Weight_gained_.grams.~Calories_Consumed,data =cal3)
summary(model2)
plot(model2) 

residualPlots(model2)

qqPlot(model2)
influenceIndexPlot(model2)
######################################################
cal4<-cal3[-1,]

model3<-lm(Weight_gained_.grams.~Calories_Consumed,data =cal4)
summary(model3)
plot(model3) 

residualPlots(model3)

qqPlot(model3)
influenceIndexPlot(model3)
View(cal4)
