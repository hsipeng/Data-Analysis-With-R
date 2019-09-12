# 测定分类性能

library(randomForest)
# 下载文件
#download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv", "wine.csv")
# curl http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv -o wine.csv

df <- read.csv("wine.csv", sep = ";", header = TRUE)

df$quality <- factor(df$quality)

n <- nrow(df)
ntrain <- round(n*0.7)
set.seed(333)
tindex <- sample(n ,ntrain)
wine_train <- df[tindex,]
wine_test <- df[-tindex,]

# randomForest 训练拟合模型

rf <- randomForest(quality~., data = wine_train, ntree=20, nodesize=5, mtry=9)

table(wine_test$quality, predict(rf, wine_test))

sum(wine_test$quality != predict(rf, wine_test))/nrow(wine_test)
