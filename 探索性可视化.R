# 探索性可视化

# 1.直方图

hist(iris$Sepal.Length)

hist(iris$Sepal.Length, probability = TRUE, breaks = 10)
lines(density(iris$Sepal.Length))
# 2. 箱型图
boxplot(airquality$Ozone, col = "blue")

boxplot(ToothGrowth$len ~ as.factor(ToothGrowth$supp), col="blue")

# 统一标准下比较中位数
boxplot(ToothGrowth$len ~ as.factor(ToothGrowth$supp), col=c("blue", "orange"), varwidth=TRUE)


# 3. 条形图

barplot(table(airquality$Temp), col="blue")


# 4. 密度图

temp_dens <- density(airquality$Temp)

plot(temp_dens, lwd=3, col="blue")

# 5. 散点图

plot(ToothGrowth$len, ToothGrowth$dose,pch=19, col="blue")


plot(ToothGrowth$len, ToothGrowth$dose,pch=ifelse(ToothGrowth$supp == "VC", 0, 1), col="blue")

# scatterplot3d 包
library("scatterplot3d")
scatterplot3d(airquality$Solar.R, airquality$Wind, airquality$Temp, highlight.3d = TRUE, col.axis = "blue", 
              col.grid = "lightblue", main = "Air Quality Data Set", pch=20, xlab = "Solar Radiation", 
              ylab = "Wind", zlab = "Temp")

# cor 相关矩阵 method 默认 pearson ，还有 kendall, spearman 算法

cor(iris[, c(1,2,3,4)], method = "pearson")

# 散点图可视化
pairs(iris[, c(1,2,3,4)])



# 仿真数据集 例子
x <- rnorm(1e5)
y <- rnorm(1e5)
plot(x, y, pch=16)

# 技巧1, sample 抽样

sampledSubset <- sample(1: 1e5, size = 1000, replace = FALSE)
plot(x[sampledSubset], y[sampledSubset], pch=16)


# 技巧2 smoothScatter 核密度估计散点图彩色平滑密度

smoothScatter(x, y)

# 六边形箱 工具
library(hexbin)
hbins <- hexbin(x,y)
plot(hbins)


# 6. QQ 图 (分位数 - 分位数图)

x <- rnorm(50)
y <- rnorm(50)

# qq 图
qqplot(x, y)
# 预测线
abline(c(0,1))

# 7. 热图
# image()
image(1:150, 1:4, as.matrix(iris[1:150, 1:4]))

# 转置钜阵
transMatrix <- as.matrix(iris[1:150, 1:4])
transMatrix <- t(transMatrix)[,nrow(transMatrix):1]
image(1:4, 1:150,transMatrix)


# 8. 解释性图表

# par(mfrow=c(1,2)) 堆积面板
par(mfrow=c(1,2))
hist(airquality$Ozone, xlab = "Ozone (ppb)", col = "blue", main="Ozone Frequencies")

plot(airquality$Ozone, airquality$Temp, pch=16, col="blue", cex=1.25, xlab="Ozone (ppb)", 
     ylab="Temperature (degrees F)", main="Air Quality - Ozone vs. Temp", cex.axis=1.5)

legend(125, 60, legend = "May-Sep 1973", col = "blue", pch = 16, cex=1.0)
