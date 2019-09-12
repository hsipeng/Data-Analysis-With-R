# 多项式回归
# 特征变量(预测因子)和响应变量(预测的变量) 有非线性关系
library(MASS)

data("Boston")
names(Boston)
fit_d1 <- lm(nox~dis, data=Boston)
summary(fit_d1)


# 一次多项式回归曲线 -- 线性拟合
plot(Boston$dis, Boston$nox)
lines(Boston$dis, fit_d1$fitted, col=2, lwd=3)

# 二次多项式回归曲线 -- 二次拟合

fit_d2 <- lm(nox~poly(dis,2, raw=TRUE), data=Boston)
summary(fit_d2)

plot(Boston$dis, Boston$nox)
lines(sort(Boston$dis), fit_d2$fitted.values[order(Boston$dis)], col=2, lwd=3)


# 三次多项式回归曲线 -- 三次拟合

fit_d3 <- lm(nox~poly(dis,3, raw=TRUE), data=Boston)
summary(fit_d3)

plot(Boston$dis, Boston$nox)
lines(sort(Boston$dis), fit_d3$fitted.values[order(Boston$dis)], col=2, lwd=3)

# anova 比较三个模型的假设校验， 方差分析用于测试模型是否有效解释数据
anova(fit_d1,fit_d2, fit_d3)
