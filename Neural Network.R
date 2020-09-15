min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}




forestfire<-read.csv('C:/Users/Rahul/Desktop/excelR submission/Neural Network/Neural Network Question/forestfires.csv')
View(forestfire)




forestfire1 <- forestfire[ -c(0,1:2) ]
View(forestfire1)

categories <- unique(forestfire1$size_category)
categories


forestfire1$size_category1<-as.integer(as.factor(forestfire1$size_category))
forestfire1$size_category1


forestfire2 <- forestfire1[ -c(0,29) ]
View(forestfire2)





forestfire_norm <- as.data.frame(lapply(forestfire2[1:29 ], min_max_norm))
View(forestfire_norm)


forestfire_train <- forestfire_norm[1:362, ]
forestfire_test <- forestfire_norm[363:517, ]



library(caTools)
sample <- sample.int(n = nrow(forestfire_norm), size = floor(.75*nrow(forestfire_norm)), replace = F)
train <- forestfire_norm[sample, ]
test  <- forestfire_norm[-sample, ]


colnames(forestfire_train)



install.packages("neuralnet")
library(neuralnet)

forestfire_model <- neuralnet(size_category1 ~FFMC+DMC+DC+ISI+temp+RH+wind+rain
                              +area+dayfri+daymon+daysat+daysun+daythu+daytue+daywed
                              +monthapr+monthaug+monthdec+monthfeb+monthjan+monthjul
                              +monthjun+monthmar+monthmay+monthnov+monthoct+monthsep,
                            data = forestfire_train,act.fct ="logistic")




plot(forestfire_model)



model_results <- compute(forestfire_model, forestfire_test[1:29])
model_results
predicted_strength <- model_results$net.result
predicted_strength




cor(predicted_strength, forestfire_test$size_category1)





forestfire_model1 <- neuralnet(size_category1 ~FFMC+DMC+DC+ISI+temp+RH+wind+rain
                             +area+dayfri+daymon+daysat+daysun+daythu+daytue+daywed
                             +monthapr+monthaug+monthdec+monthfeb+monthjan+monthjul
                             +monthjun+monthmar+monthmay+monthnov+monthoct+monthsep,
                             data = forestfire_train)


windows();

plot(forestfire_model1)

model_results2 <- compute(forestfire_model1, forestfire_test[1:29])
predicted_strength2 <- model_results2$net.result
cor(predicted_strength2, forestfire_test$size_category1)
