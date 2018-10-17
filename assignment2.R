library("tm")
library("NLP")
reviews.neg.descriptive1 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/deceptive_from_MTurk/fold1", encoding="UTF-8"))
reviews.neg.descriptive2 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/deceptive_from_MTurk/fold2", encoding="UTF-8"))
reviews.neg.descriptive3 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/deceptive_from_MTurk/fold3", encoding="UTF-8"))
reviews.neg.descriptive4 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/deceptive_from_MTurk/fold4", encoding="UTF-8"))
reviews.neg.descriptive5<- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/deceptive_from_MTurk/fold5", encoding="UTF-8"))


reviews.neg.truthful1 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/truthful_from_Web/fold1", encoding="UTF-8"))
reviews.neg.truthful2 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/truthful_from_Web/fold2", encoding="UTF-8"))
reviews.neg.truthful3 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/truthful_from_Web/fold3", encoding="UTF-8"))
reviews.neg.truthful4 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/truthful_from_Web/fold4", encoding="UTF-8"))
reviews.neg.truthful5 <- VCorpus(DirSource("C:/Users/Iro Sfoungari/Desktop/op_spam_v1.4/negative_polarity/truthful_from_Web/fold5", encoding="UTF-8"))


reviews.all <- c(reviews.neg.descriptive1,reviews.neg.descriptive2,reviews.neg.descriptive3,reviews.neg.descriptive4,reviews.neg.descriptive5,reviews.neg.truthful1,reviews.neg.truthful2,reviews.neg.truthful3,reviews.neg.truthful4,reviews.neg.truthful5)
labels <- c(rep(0,400),rep(1,400))
reviews.all
as.character(reviews.all[[1]])
reviews.all <- tm_map(reviews.all,removePunctuation)
reviews.all <- tm_map(reviews.all,content_transformer(tolower))
reviews.all <- tm_map(reviews.all, removeWords,
                      stopwords("english"))
reviews.all <- tm_map(reviews.all,removeNumbers)
reviews.all <- tm_map(reviews.all,stripWhitespace)
as.character(reviews.all[[1]])

#index.train <- sample(800,640,replace = FALSE)
#train.dtm <- DocumentTermMatrix(reviews.all[index.train])
#dim(train.dtm)

trainingsetface<-sample(400,320,replace = FALSE)
trainingsetnegreal<-400+sample(400,320,replace = FALSE)
#indexes of training set
index.train <- c(trainingsetface,trainingsetnegreal)
train.dtm <- DocumentTermMatrix(reviews.all[index.train])
dim(train.dtm)
train.dtm <- removeSparseTerms(train.dtm,0.95)
dim(train.dtm)
