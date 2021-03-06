install.packages("caret")
install.packages("rpart")
install.packages("tree")
install.packages("randomForest")
install.packages("e1071")
install.packages("ggplot2")
library(e1071)
library(caret)
library(rpart)
library(randomForest)

training <- read.csv("assignment5/seaflow_21min.csv")
training.index <- sample(1:72343, size=36171, replace=FALSE)  
trainI <- training[training.index,]
testI <- training[-training.index,]
# removing the header
testI <- head(testI, -1)
fol <- pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small
model <- svm(fol, data=trainI)
prediction <- predict(model, testI)
importance(model)
length(prediction)
length(testI$pop)
a <- prediction
b <-c(testI$pop)
b = replace(b, b==1, 'crytpo')
b = replace(b, b==2, 'nano')
b= replace(b, b==3, 'pico')
b = replace(b, b==4, 'synecho')
b = replace(b, b==5, 'ultra')
str(a)
str(b)
length(a)
length(b)
c <- a==b
summary(c)
33225/(33225 + 2946)
table(pred = prediction, true = testI$pop)
