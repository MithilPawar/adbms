install.packages("e1071")
library(e1071)

rm(list = ls())
NBdataset <- read.table("new_dataset.csv", header = TRUE, sep = ",")

classifier <- naiveBayes(NBdataset[,1:4], NBdataset[,5])

table(predict(classifier, NBdataset[,5]), NBdataset[,5], dnn = list('predicted', 'actual'))
classifier$tables

NBdataset[15,-5] <- as.factor(c(Outlook = "Sunny", Temperature = "Cool",
                                Humidity = "High", wind = "Strong"))

print(NBdataset[15,-5])
result <- predict(classifier, NBdataset[15,-5])
print(result)