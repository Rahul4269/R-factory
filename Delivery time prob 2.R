#Load data
DT <- read.csv("C:/Users/DELL/Desktop/Linear Regression/Simple linear Regression/Assignment/delivery_time.csv")
View(DT)
colnames(DT)
#############################################################

# Visualization
install.packages("lattice")
library(lattice)
#dot plot
dotplot(DT$Delivery.Time, main="Dot Plot of Delivery.Time",col="dodgerblue4")
dotplot(DT$Sorting.Time, main="Dot Plot of Sorting.Time", col="dodgerblue4")


#box plot
boxplot(DT$Delivery.Time,col="dodgerblue4")
boxplot(DT$Sorting.Time,col="dodgerblue4")


#scatter plot
plot(DT$Sorting.Time)
plot(DT$Delivery.Time)
#scatter plot of x var vs y var
plot(DT$Sorting.Time,DT$Delivery.Time)

#####################################################


#Regression equation
#Syntax  model<-lm(y~x,data=data set name)

model<- lm(Delivery.Time~Sorting.Time,data =DT)
summary(model)

new_DT=data.frame(Sorting.Time=c(7.5))# creating data frame for which x value we want to calculate or predict Y values
#this x value whitin the range of x colomn vales range

DT1=predict(model,new_DT)
DT1

#Predict for daily variable from the historical data / predict value for each x variable
pred<-predict(model)
#Print predicted values
pred
#Prepare a new data frame with pred and error
finaldata<-data.frame(DT,pred,"Error"= DT$Delivery.Time-pred)
View(finaldata)


#########################
plot(DT)
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

DT2<-DT[-21,]

model1<-lm(Delivery.Time~Sorting.Time,data =DT2)
summary(model1)
plot(model1) 
residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)
###############################################

DT3<-DT2[-5,]

model2<-lm(Delivery.Time~Sorting.Time,data =DT3)
summary(model2)
plot(model2) 

residualPlots(model2)

qqPlot(model2)
influenceIndexPlot(model2)
######################################################
DT4<-DT3[-9,]

model3<-lm(Delivery.Time~Sorting.Time,data =DT4)
summary(model3)
plot(model3) 

residualPlots(model3)

qqPlot(model3)
influenceIndexPlot(model3)
View(DT4)

############################################################
DT5<-DT4[-8,]

model4<-lm(Delivery.Time~Sorting.Time,data =DT5)
summary(model4)
plot(model4) 

residualPlots(model4)

qqPlot(model4)
influenceIndexPlot(model4)
View(DT5)
plot(DT5$Sorting.Time,DT5$Delivery.Time)
boxplot(DT5$Delivery.Time,col="dodgerblue4")
boxplot(DT5$Sorting.Time,col="dodgerblue4")

