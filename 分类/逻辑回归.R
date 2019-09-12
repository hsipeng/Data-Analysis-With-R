# 逻辑回归

# 逻辑回归适用于响应变量是二元的， 预测变量是定量的，并与响应变量概率有联系

data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
newcol <- data.frame(isVersicolor=(train_iris$Species=="versicolor"))
train_iris <- cbind(train_iris, newcol)
head(train_iris)

# 广义线性模型
# isVersicolor 建模为一个医院定量预测Sepal.Width 的函数
glm1 <- glm(isVersicolor~Sepal.Width, data=train_iris, family=binomial)
summary(glm1)
plot(train_iris$Sepal.Width, train_iris$isVersicolor)
curve(predict(glm1, data.frame(Sepal.Width=x), type="response"), add=TRUE)

# predict 决定一个新的观测分类
newdata <- data.frame(Sepal.Width=2.4)
predict(glm1, newdata, type="response")



# 多元预测因子， 4个定量变量

formula <- isVersicolor~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
glm2 <- glm(formula,data = train_iris, family = "binomial")
summary(glm2)
coef(glm2)
summary(glm2)$coef

## 预测
prob <- predict(glm2, newdata=test_iris, type="response")
round(prob, 3)