install.packages("Metrics")
library(Metrics)

library(readxl)
Airlines_Data <- read_excel("C:/Users/Rahul/Desktop/excelR submission/Forecasting/Forecasting Question/Airlines+Data.xlsx")
View(Airlines_Data)

plot(Airlines_Data$Passengers,type="l")
# So creating 11 dummy variables 

X<- data.frame(outer(rep(month.abb,length = 96), month.abb,"==") + 0 )# Creating dummies for 12 months

colnames(X)<-month.abb # Assigning month names 
View(X)
airdata<-cbind(Airlines_Data,X)
View(airdata)

airdata["t"]<- 1:96
View(airdata)
airdata["log_Passengers"]<-log(airdata["Passengers"])
airdata["t_square"]<-airdata["t"]*airdata["t"]
#attach(trakdata)

##Data Partition
train<-airdata[1:67,]
test<-airdata[68:96,]

########################### LINEAR MODEL #############################
#Airlines_Data$Passengers
linear_model<-lm(Passengers~t,data=train)
linear_pred<-data.frame(predict(linear_model,interval='predict',newdata =test))
View(linear_pred)
rmse_linear<-rmse(test$Passengers,linear_pred$fit)
rmse_linear

######################### Exponential #################################


expo_model<-lm(log_Passengers~t,data=train)

expo_pred<-data.frame(predict(expo_model,interval='predict',newdata=test))
rmse_expo<-rmse(test$Passengers,exp(expo_pred$fit))

rmse_expo 

######################### Quadratic ####################################

Quad_model<-lm(Passengers~t+t_square,data=train)

Quad_pred<-data.frame(predict(Quad_model,interval='predict',newdata=test))
rmse_Quad<-rmse(test$Passengers,Quad_pred$fit)
rmse_Quad 

######################### Additive Seasonality #########################

sea_add_model<-lm(Passengers~Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data=train)
sea_add_pred<-data.frame(predict(sea_add_model,newdata=test,interval='predict'))
rmse_sea_add<-rmse(test$Passengers,sea_add_pred$fit)

rmse_sea_add

######################## Additive Seasonality with Linear #################

Add_sea_Linear_model<-lm(Passengers~t+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data=train)
summary(Add_sea_Linear_model)
Add_sea_Linear_pred<-data.frame(predict(Add_sea_Linear_model,interval='predict',newdata=test))
rmse_Add_sea_Linear<-rmse(test$Passengers,Add_sea_Linear_pred$fit)

rmse_Add_sea_Linear

######################## Additive Seasonality with Quadratic #################

Add_sea_Quad_model<-lm(Passengers~t+t_square+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data=train)

Add_sea_Quad_pred<-data.frame(predict(Add_sea_Quad_model,interval='predict',newdata=test))
rmse_Add_sea_Quad<-rmse(test$Passengers,Add_sea_Quad_pred$fit)

rmse_Add_sea_Quad 

######################## Multiplicative Seasonality #########################

multi_sea_model<-lm(log_Passengers~Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)

multi_sea_pred<-data.frame(predict(multi_sea_model,newdata=test,interval='predict'))
rmse_multi_sea<-rmse(test$Passengers,exp(multi_sea_pred$fit))

rmse_multi_sea

######################## Multiplicative Seasonality Linear trend ##########################

multi_add_sea_model<-lm(log_Passengers~t+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)
summary(multi_add_sea_model) 
multi_add_sea_pred<-data.frame(predict(multi_add_sea_model,newdata=test,interval='predict'))
rmse_multi_add_sea<-rmse(test$Passengers,exp(multi_add_sea_pred$fit))

rmse_multi_add_sea 

# Preparing table on model and it's RMSE values 

table_rmse<-data.frame('Model'=c("rmse_linear","rmse_expo","rmse_Quad","rmse_sea_add","rmse_Add_sea_Quad","rmse_multi_sea","rmse_multi_add_sea"),'RMSE'=c(rmse_linear,rmse_expo,rmse_Quad,rmse_sea_add,rmse_Add_sea_Quad,rmse_multi_sea,rmse_multi_add_sea))

colnames(table_rmse)<-c("model","RMSE")
View(table_rmse)

  new_model <- lm(log_Passengers~t+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data=airdata)

# Getting residuals 
resid <- residuals(new_model)
acf(resid,lag.max = 10)

# By principal of parcimony we will consider lag - 1  as we have so 
# many significant lags 
# Building Autoregressive model on residuals consider lag-1 
k <- arima(resid, order=c(1,0,0))
pred_res<- predict(arima(resid,order=c(1,0,0)),n.ahead = 12)
str(pred_res)
pred_res$pred
acf(k$residuals)
