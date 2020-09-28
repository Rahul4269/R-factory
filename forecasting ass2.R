install.packages("Metrics")
install.packages(c("forecast","fpp","smooth","tseries"))

library(Metrics)
library(forecast)
library(fpp)
library(smooth)
library(tseries)
library(readr)

library(readxl)
CocaCola_Sales <- read_excel("C:/Users/Rahul/Desktop/excelR submission/Forecasting/Forecasting Question/CocaCola_Sales_Rawdata.xlsx")
View(CocaCola_Sales)


View(cocacola)
CocaCola_Sales1<-ts(CocaCola_Sales$Sales,frequency = 4,start=c(86))
View(CocaCola_Sales1)
plot(CocaCola_Sales1)


train<-CocaCola_Sales1[1:38]
test<-CocaCola_Sales1[39:42] 


train<-ts(train,frequency = 4)
test<-ts(test,frequency = 4)
plot(train)
acf(train)
pacf(train)


library(forecast)
model_AA <- auto.arima(train) 

model_AA
acf(model_AA$residuals)
windows()
plot(forecast(model_AA,h=4),xaxt="n")





