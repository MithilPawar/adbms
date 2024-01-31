rm(list = ls())

install.packages("caret")
install.packages("class")
install.packages("ggplot2")

library(class)
library(caret)
library(ggplot2)

diabetes = read.csv('pima-indians-diabetes.csv')
class(diabetes$mass)

str(diabetes)

diabetes[, 'class']=factor(diabetes[,'class'])
str(diabetes)

mean(diabetes$age)

summary(diabetes)

train = diabetes[1:500,]

test = diabetes[501:768,]

pred_test = knn(train[,-9], test[,-9], train$class, k=2)
pred_test

confusion = table(pred_test, test$class)
confusion

sum(diag(confusion))/nrow(test)

confusionMatrix(pred_test, test$class)