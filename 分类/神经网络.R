# 神经网络
# 典型包含三层（输入层，隐藏层，输出层）

# data
data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
head(train_iris)



library(neuralnet)
# 数据集转换
nn1_iristrain <- train_iris
nn1_iristrain <- cbind(nn1_iristrain, train_iris$Species=="setosa")
nn1_iristrain <- cbind(nn1_iristrain, train_iris$Species=="versicolor")
nn1_iristrain <- cbind(nn1_iristrain, train_iris$Species=="virginica")

names(nn1_iristrain)[6] <- "setosa"
names(nn1_iristrain)[7] <- "versicolor"
names(nn1_iristrain)[8] <- "virginica"
head(nn1_iristrain[,5:8])


# 构建神经网络模型
nn1 <- neuralnet(setosa+versicolor+virginica~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, 
                 data = nn1_iristrain, hidden = c(4))
print(nn1)
## 显示神经网络
plot(nn1)

## nn1 对象上使用commpute 函数, 给定一个训练好的神经网络
prediction <- compute(nn1, test_iris[-5])
prediction <- prediction$net.result

# 建立特征变量， 其中包含神经网络预测的响应变量值(Species)
# table 建立混合矩阵, 检查模型准确性

pred_idx <- function(x){return(which(x ==max(x)))}

idx <- apply(prediction, c(1), pred_idx)

prediction_nn <- c('setosa', 'versicolor', 'virginica')[idx]

xtab <- table(prediction_nn, test_iris$Species)

xtab
# 准确率
(19+16+22)/60
