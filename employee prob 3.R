#Load data
emp <- read.csv("C:/Users/DELL/Desktop/Linear Regression/Simple linear Regression/Assignment/emp_data.csv")
View(emp)
colnames(emp)
#############################################################

# Visualization
install.packages("lattice")
library(lattice)
#dot plot
dotplot(emp$Salary_hike, main="Dot Plot of Salary_hike",col="dodgerblue4")
dotplot(emp$Churn_out_rate, main="Dot Plot of Churn_out_rate", col="dodgerblue4")


#box plot
boxplot(emp$Salary_hike,col="dodgerblue4")
boxplot(emp$Churn_out_rate,col="dodgerblue4")


#scatter plot
plot(emp$Churn_out_rate)
plot(emp$Salary_hike)
#scatter plot of x var vs y var
plot(emp$Salary_hike,emp$Churn_out_rate)

#####################################################


#Regression equation
#Syntax  model<-lm(y~x,data=data set name)

model<- lm(Churn_out_rate~Salary_hike,data =emp)
summary(model)

new_emp=data.frame(Salary_hike=c(1700))# creating data frame for which x value we want to calculate or predict Y values
#this x value whitin the range of x colomn vales range

emp1=predict(model,new_emp)
emp1

#Predict for daily variable from the historical data / predict value for each x variable
pred<-predict(model)
#Print predicted values
pred
#Prepare a new data frame with pred and error
finaldata<-data.frame(emp,pred,"Error"= emp$Churn_out_rate-pred)
View(finaldata)


#########################
plot(emp)
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

emp2<-emp[-10,]

model1<-lm(Churn_out_rate~Salary_hike,data =emp2)
summary(model1)
plot(model1) 
residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)
###############################################

emp3<-emp2[-9,]

model2<-lm(Churn_out_rate~Salary_hike,data =emp3)
summary(model2)
plot(model2) 

residualPlots(model2)

qqPlot(model2)
influenceIndexPlot(model2)
######################################################
emp4<-emp3[-1,]

model3<-lm(Churn_out_rate~Salary_hike,data =emp4)
summary(model3)
plot(model3) 

residualPlots(model3)

qqPlot(model3)
influenceIndexPlot(model3)
View(emp4)

############################################################
