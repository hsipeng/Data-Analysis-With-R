# 朴素贝叶斯
# 通过已知的其他东西，来推断一件事情的发生可能性
# 假定特征之间相互独立

data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
head(train_iris)


library(e1071)

nb1 <- naiveBayes(Species~.,data=train_iris)

nb1

prediction <- predict(nb1, test_iris[,-5])
xtab <- table(prediction, test_iris$Species)
xtab
nb1$apriori # 类的先验概率
nb1$tables$Petal.Length # 高斯分布的平均值和标准差

# 三个类的分布图
# 基于物种的花瓣长度分布
plot(function(x) dnorm(x,1.493548,0.1547805),0,8,lty=1, main="Petal length distribution by species")
curve(dnorm(x,4.306452,0.3855174), add=TRUE, lty=2)
curve(dnorm(x,5.578571,0.5244801), add=TRUE, lty=5)
legend('topright', legend = c("setosa","versicolor","verginica"), lty=c(1,2,5), bty='o')




