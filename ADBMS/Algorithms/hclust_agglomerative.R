install.packages("hclust")
install.packages("dplyr")

library(dplyr)

df <- USArrests
df

df <- na.omit(df)
d <- scale(df)

head(d)
d <- dist(d, method = "euclidean")
hc <- hclust(d, method = "complete")
plot(hc, cex=0.1, hang = -1)