## 多元线性回归
## 基于多个特征变量(预测因子)和响应变量(预测的变量) 有线性关系
library(car)

data(Prestige)

summary(Prestige)


head(Prestige)


## 定义训练集，测试集， 通常 六四分

Prestige_noNa <- na.omit(Prestige)
n <- nrow(Prestige_noNa) # number for observatios
ntrain <- round(n*0.6)
set.seed(333) # set seed for reproducible results
tindex <- sample(n, ntrain)
trainPrestige <- Prestige_noNa[tindex,]
testPrestige <- Prestige_noNa[-tindex,]

# 探索性数据分析
plot(trainPrestige$prestige, trainPrestige$education) # Trend
plot(trainPrestige$prestige, trainPrestige$income) # no Trend
plot(trainPrestige$prestige, trainPrestige$women) # no trend


# lm 函数 线性回归  公式 prestige~.

lm2 <- lm(prestige~., data = trainPrestige)
summary(lm2)

# 诊断图
# 1.预测值和残差图
plot(lm2$fitted, lm2$residuals)
# 2.残差索引图
plot(lm2$residuals, pch=19) # 没有趋势

## testPrestige 预测响应变量 prestige 
predict2 <- predict(lm2, newdata = testPrestige)

cor(predict2, testPrestige$prestige)
#3. qqnrom 和 qqline 函数 诊断 
# 展示分位数和分位数，确认残差是否成正态分布

rs <- residuals(lm2)
qqnorm(rs)
qqline(rs)



# 4. 使用模型中未使用的变量生成一张图表

plot(testPrestige$prestige, predict2, pch=c(testPrestige$type))
legend('topleft', legend=c("bc", "prof", "wc"), pch=c(1,2,3), bty="o")
