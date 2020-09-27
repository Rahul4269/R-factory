

library("recommenderlab")
library(caTools)


book_rate_data <- read.csv('C:/Users/Rahul/Desktop/excelR submission/Recomdation Engine/Recomandation Engine Question/book.csv')
View(book_rate_data)

str(book_rate_data)



hist(book_rate_data$Book.Rating)

book_rate_data_matrix <- as(book_rate_data, 'realRatingMatrix')
book_rate_data_matrix
book_rate_data_matrix@data


book_recomm_model1 <- Recommender(book_rate_data_matrix, method="popular")

recommended_items1 <- predict(book_recomm_model1, book_rate_data_matrix, n=5)
d<- as(recommended_items1, "list")
d

library(plyr)
df<- ldply(d,data.frame)
View(df)


write.csv(df,"RE_books.csv")

