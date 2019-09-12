# 分类树
# 考虑所有预测因子
data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
head(train_iris)

str(train_iris)
## 导入 tree 包
library(tree)
ct1 <- tree(Species~., data=train_iris)

plot(ct1)
text(ct1)

ct1

summary(ct1)

# 检验

prediction <- predict(ct1, newdata=test_iris, type="class")
prediction

table(prediction, test_iris$Species)

(20+19+17)/60 # test_iris总数60
