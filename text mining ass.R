install.packages(c("rvest","XML","magrittr"))

library(rvest)
library(XML)
library(magrittr)




aurl <-"https://www.amazon.in/Samsung-Galaxy-Ocean-Blue-Storage/product-reviews/B07HGJKDQL/ref=cm_cr_getr_d_paging_btm_next_5?ie=UTF8&reviewerType=all_reviews&pageNumber"
amazon_reviews <- NULL
for (i in 1:5)
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev <- murl %>% html_nodes(".review-text") %>% html_text()

  amazon_reviews <- c(amazon_reviews,rev)  
  length(amazon_reviews)  
  write.table(amazon_reviews,"samsung.txt",row.names = F)  
  getwd()  

  
install.packages("syuzhet")
library("syuzhet")
library(lubridate,ggplot2)
library(ggplot2)
library(scales)
library(dplyr)
library(reshape2)    


txt = readLines('D:/14 july/14 july/ExcelR/Text mining and NLP/samsung.txt')
txt <- iconv(txt, "UTF-8")


x <- get_nrc_sentiment(txt)
head(x,n=5)


get_nrc_sentiment('happy') #Range for 
get_nrc_sentiment('boring')


get_sentiment('boring',method="afinn")
get_sentiment('happy',method="afinn")


example<-get_sentences(txt)
nrc_data<-get_nrc_sentiment(example)


windows()
barplot(colSums(nrc_data), las = 1, col = rainbow(10), ylab = 'Count', main = 'Emotion scores')

sentiment_vector<-get_sentiment(example,method="bing")
sentiment_afinn<-get_sentiment(example,method="afinn")
sentiment_nrc<-get_sentiment(example,method="nrc")


sum(sentiment_afinn)
mean(sentiment_afinn)
summary(sentiment_afinn)


windows()
plot(sentiment_vector,type='l',maim='Plot trajectory',xlab='Narative time',ylab='Emotional valence')
abline(h=0,color='red')


plot(
  sentiment_vector, 
  type="h", 
  main="Example Plot Trajectory", 
  xlab = "Narrative Time", 
  ylab= "Emotional Valence"
)

ft_values <- get_transformed_values(
  sentiment_vector, 
  low_pass_size = 3, 
  x_reverse_len = 100,
  padding_factor = 2,
  scale_vals = TRUE,
  scale_range = FALSE
)


plot(
  ft_values, 
  type ="l", 
  main ="samsung using Transformed Values", 
  xlab = "Narrative Time", 
  ylab = "Emotional Valence", 
  col = "red"
)


negative<-example[which.min(sentiment_vector)]
negative

positive<-example[which.max(sentiment_vector)]
positive

