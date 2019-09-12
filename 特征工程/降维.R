cor(iris[,-5])

iris_pca <- prcomp(iris[, -5], scale=T)

summary(iris_pca)

plot(iris_pca)

iris_pca$rotation

predict(iris_pca)[1:2,]

biplot(iris_pca)
