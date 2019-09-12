## 回归

# 一元线性回归

# 基于特征变量(预测因子)和响应变量(预测的变量) 有线性关系

library(MASS)

data(Boston)
names(Boston)

lml <- lm(medv~rm, data=Boston)
lml

summary(lml)


names(lml)

coef(lml)

# attach 将 Boston 数据集放入R 的搜索路径中

attach(Boston)
# rm medv 数值对
plot(rm, medv, pch=20, xlab="AVG. # Rooms", ylab="Median Value")
# 最佳拟合回归线
lines(rm, lml$fitted, lwd=3)
## 预测 基于平均数6,预测房屋价值中位数
## 方法 1
coef(lml)[1] + coef(lml)[2]*6
## 方法2

newdata <- data.frame(rm=6)
predict(lml, newdata)


## 诊断图

par(mfrow=c(2,2))
plot(lml)

## Cook 距离
# 拟合残差应该在0 线附近跳动，形成一个水平带，没有残差是突出的
par(mfrow=c(1,1))
plot(cooks.distance(lml))


## 残差图

par(mfrow=c(1,1))
plot(predict(lml), residuals(lml))

