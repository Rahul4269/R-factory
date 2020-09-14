library(readr)
bank_data <- read_csv("C:/Users/admin/Desktop/bank_data.csv")
View(bank_data)
colnames(bank_data)
#Finding null values
sum(is.na(bank_data))
#Removing null values- na.omit(dataset)
claimants <- na.omit(bank_data)
# Logistic Regression
logit<-glm(y ~.,family= "binomial",data=bank_data)
summary(logit)

prob=predict(logit,type=c("response"),bank_data)
prob


confusion<-table(prob>0.5,bank_data$y)
confusion


Accuracy<-sum(diag(confusion))/sum(confusion)
Accuracy
