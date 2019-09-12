# 随机森林 -- 集成工具

# 随机森林时最常用、最广泛使用的套袋法工具之一

# 除了在树的每个决策节点傻姑娘从训练集中选取训练数据之外，
# 算法还会随机选择一些特征变量，用他们学习得到一棵决策树
# 最后， 森林中的每一棵树投票以选出最热门的类型。

# 实际上，随机森林是一种递归工具，特别适合解决含有少量观测和大量特征变量的问题
# 此外，已经证明分类树集合的结果比单独一棵分类树的预测结果要好的多。

# 随机森林每次运行的模型结果都不尽相同，因此证明森林的稳定性十分重要，可
# 以从至少一个不同的种子值开始，增加森林的大小，直至一个足够大的数目。
# randomForest 包

# data
data("iris")

n <- nrow(iris)
ntrain <- round(n*0.6)
set.seed(333)
tindex <- sample(n, ntrain)
train_iris <- iris[tindex,]
test_iris <- iris[-tindex,]
head(train_iris)

library(randomForest)

# Species~. 用数据集中的四个预测因子对Species进行分类
# data=train_iris 指定数据框
# ntree = 500 �指定生成树的数目
# mtry=2 指定随机抽样变量的树木 分类的默认值时变量数目的平方根
# importance=TRUE 让算法评估预测因子的重要性
rf <- randomForest(Species~., data = train_iris, ntree=500, mtry=2,importance=TRUE)


# 对测试集分类
prediction <- predict(rf, newdata = test_iris, type = "class")
table(prediction, test_iris$Species)

## 查看算法中预测因子的重要性
importance(rf)# rf$importance

# print 函数提供概括分析
print(rf)

# varImpPlot 提供随机森林测量得出的变量重要性点阵图
varImpPlot(rf)

# varUsed 提供重要性计数
varUsed(rf, by.tree = FALSE,count = TRUE)
