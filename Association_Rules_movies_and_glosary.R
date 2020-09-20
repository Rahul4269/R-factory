
library(readr)
my_movies <- read_csv("C:/Users/Rahul/Desktop/excelR submission/Association Rule/Association Rules Question/my_movies.csv")
View(my_movies)

str(my_movies)
my_movies[] <- lapply(my_movies,as.character)
View(my_movies)

paste_fun <- function(i){
  return (paste(as.character(i),collapse=" "))
}


my_movies["new_col"] <- apply(my_movies,1,paste_fun)
View(my_movies)

install.packages("tm")
library(tm)
library(NLP)
x <- Corpus(VectorSource(my_movies$new_col)) 

x <- tm_map(x,stripWhitespace)

dtm0 <- t(TermDocumentMatrix(x))

dtm0_df <- data.frame(as.matrix(dtm0))

View(dtm0_df)

# Association Rules 

library(arules)
library(arulesViz)

windows()
 
barplot(sapply(my_movies,sum),col=1:10)

rules <- apriori(as.matrix(dtm0_df),parameter = list(support=0.002,confidence=0.5,minlen=2))
inspect(rules)
plot(rules)


rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)

rules_lift <- sort(rules,by="lift")
inspect(rules_lift)


plot(rules,method = "graph")


########## Groceries Data Set #########
library(arules)
groceries<-read.transactions(file.choose(),format="basket")
inspect(groceries[1:10])
class(groceries)


itemFrequencyPlot(groceries,topN=20)
groceries_rules<-apriori(groceries,parameter = list(support = 0.002,confidence = 0.05,minlen=3))

library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")



