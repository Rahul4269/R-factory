#Load data
Sal <- read.csv("C:/Users/DELL/Desktop/Linear Regression/Simple linear Regression/Assignment/Salary_Data.csv")
View(Sal)
colnames(Sal)
#############################################################

# Visualization
install.packages("lattice")
library(lattice)
#dot plot
dotplot(Sal$YearsExperience, main="Dot Plot of YearsExperience",col="dodgerblue4")
dotplot(Sal$Salary, main="Dot Plot of Salary", col="dodgerblue4")


#box plot
boxplot(Sal$YearsExperience,col="dodgerblue4")
boxplot(Sal$Salary,col="dodgerblue4")


#scatter plot
plot(Sal$Salary)
plot(Sal$YearsExperience)
#scatter plot of x var vs y var
plot(Sal$YearsExperience,Sal$Salary)

#####################################################


#Regression equation
#Syntax  model<-lm(y~x,data=data set name)

model<- lm(Salary~YearsExperience,data =Sal)
summary(model)

new_Sal=data.frame(YearsExperience=c(5))# creating data frame for which x value we want to calculate or predict Y values
#this x value whitin the range of x colomn vales range

Sal1=predict(model,new_Sal)
Sal1

#Predict for daily variable from the historical data / predict value for each x variable
pred<-predict(model)
#Print predicted values
pred
#Prepare a new data frame with pred and error
finaldata<-data.frame(Sal,pred,"Error"= Sal$Salary-pred)
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

Sal2<-Sal[-24,]

model1<-lm(Salary~YearsExperience,data =Sal2)
summary(model1)
plot(model1) 
residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)
###############################################

Sal3<-Sal2[-20,]

model2<-lm(Salary~YearsExperience,data =Sal3)
summary(model2)
plot(model2) 

residualPlots(model2)

qqPlot(model2)
influenceIndexPlot(model2)
######################################################
Sal4<-Sal3[-9,]

model3<-lm(Salary~YearsExperience,data =Sal4)
summary(model3)
plot(model3) 

residualPlots(model3)

qqPlot(model3)
influenceIndexPlot(model3)
View(DT4)

############################################################
Sal5<-Sal4[-2,]

model4<-lm(Salary~YearsExperience,data =Sal5)
summary(model4)
plot(model4) 

residualPlots(model4)

qqPlot(model4)
influenceIndexPlot(model4)
#########################################################
Sal6<-Sal5[-c(6,16),]

model5<-lm(Salary~YearsExperience,data =Sal6)
summary(model5)
plot(model5) 

residualPlots(model5)

qqPlot(model5)
influenceIndexPlot(model5)
#########################################################
Sal7<-Sal6[-17,]

model6<-lm(Salary~YearsExperience,data =Sal7)
summary(model6)
plot(model6) 

residualPlots(model6)

qqPlot(model6)
influenceIndexPlot(model6)
