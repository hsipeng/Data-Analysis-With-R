# 测定回归性能

library(car)

data(Prestige)
Prestige_noNA <- na.omit(Prestige)
n <- nrow(Prestige_noNA)
ntrain <- round(n*0.7)
set.seed(333)
tindex <- sample(n, ntrain)
prestige_train <- Prestige_noNA[tindex,]
prestige_test <- Prestige_noNA[-tindex,]


## 计算误差率 MSE 或者 RMSE 
# y_hat 预测量, y 实际响应变量
rmse <- function(y_hat, y){
  return(sqrt(mean((y_hat-y)^2)))
}

## 拟合一个线性模型

lm1 <- lm(prestige~., data=prestige_train)

rmse_train <- rmse(predict(lm1, newdata=prestige_train),prestige_train$prestige)
rmse_train
rmse_test <- rmse(predict(lm1, newdata=prestige_test),prestige_test$prestige)
rmse_test



# RMSE 无法立刻清楚的展示一般情况下模型表现的特征
# R^2 来度量使用的模型比仅仅使用平均值要好多少倍
rsquared <- function(y_hat, y){
  mu <- mean(y)
  res <- mean((y_hat - y)^2)/ mean((mu - y)^2)
  rsquared <- (1-res)*100
  return(rsquared)
}

y_hat <- lm1$fitted.value
y <- prestige_train$prestige

rsquared(y_hat, y)

# 测试集
y_hat <- predict(lm1, newdata=prestige_test)
y <- prestige_test$prestige

rsquared(y_hat, y)