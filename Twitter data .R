install.packages("twitteR")
library("twitteR")

install.packages("ROAuth")
library("ROAuth")

install.packages("base64enc")
library(base64enc)

install.packages("httpuv")
library(httpuv)
### https://apps.twitter.com/

cred <- OAuthFactory$new(consumerKey='yJZb4kF71rS2XWIBhQKaFYl46',
                         consumerSecret='SPa19LmfSIgo9Oa83Qu3XdlNeQwZW4OuCPeiDw9XW00WtxaVde',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

setup_twitter_oauth("yJZb4kF71rS2XWIBhQKaFYl46", 
                    "SPa19LmfSIgo9Oa83Qu3XdlNeQwZW4OuCPeiDw9XW00WtxaVde",
                    "713260485236301824-6XPP17iv2claLjVmL0LnlrcJ6K24Wlj", 
                    "i9IXA6RnrcCqCJXQ64XJOrUWPyFbnUs52GYbfjlWiOpQm") 

Tweets <- userTimeline('Sachin Tendulkar', n = 1000)

TweetsDF <- twListToDF(Tweets)
write.csv(TweetsDF, "Tweets_sarf.csv")

###Search with a key word

word_tweets<- searchTwitter('corona', n=100, lang="en", resultType = "recent")
TweetsDF <- twListToDF(word_tweets)
