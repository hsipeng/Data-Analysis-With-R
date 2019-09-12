# 支持向量机(SVM)

# 数据恰好有两种类别时，你可以使用SVM




data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
head(train_iris)


library(e1071)

svm1 <- svm(Species~., data=train_iris, method="C-classification",
            kernal="radial", gamma=0.1, cost=10)

summary(svm1)


svm1$SV  # 支持向量

# svm 图展示模型的支持向量、判定边界和间隔
plot(svm1, train_iris, Petal.Width ~ Petal.Length, slice=list(Sepal.Width=3,Sepal.Length=4))


## 预测

prediction <- predict(svm1, test_iris)

xtab <- table(test_iris$Species, prediction)

xtab


# 概率

(19+17+22)/nrow(test_iris)

# Number of misclassifications
train_x <- train_iris[,-5]
train_y <- train_iris[,5]
test_x <- test_iris[,-5]
test_y <- test_iris[,5]

sum(prediction!= test_y)

