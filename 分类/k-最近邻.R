# k - 最近邻 KNN

# 用于不知道给定的预测因子下响应变量条件分布的情况

# class 包 knn

data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
head(train_iris)


library(class)

# 观察训练集的观测点

plot(train_iris$Petal.Length, train_iris$Petal.Width,pch=c(train_iris$Species))
legend('topleft', legend = c("setosa", "versicolor", "verginica"), pch=c(1,2,3), bty='o')


# 一个距离函数来定义一个数据点到另一个数据点之间的距离，通常度量标准叫欧几里得距离

# knn 参数, 
# 1. 训练集的预测因子
# 2. 测试集的预测因子
# 3. 训练集的响应值
# 4. 参数 K

train_x <- train_iris[,-5]
train_y <- train_iris[,5]
test_x <- test_iris[,-5]
test_y <- test_iris[,5]
prediction <- knn(train_x, test_x, train_y, k=5)

table(prediction, test_iris$Species)

(19+18+22)/nrow(test_iris)


# 错误总数
sum(prediction != test_y)

# 观察数
length(test_y)
