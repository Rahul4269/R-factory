#Load data
WC_AT <- read.csv("C:/Users/DELL/Desktop/WC_AT.csv")
View(WC_AT)

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
colnames(WC_AT)
model<- lm(AT~Waist,data =WC_AT)
summary(model)

new_waist=data.frame(Waist=c(40,75,200))

AT1=predict(model,new_waist)
AT1

#Predict for daily variable from the historical data
pred<-predict(model)
#Print predicted values
pred
#Prepare a new data frame with pred and error
finaldata1<-data.frame(WC_AT,pred,"Error"= WC_AT$AT-pred)
View(finaldata)
