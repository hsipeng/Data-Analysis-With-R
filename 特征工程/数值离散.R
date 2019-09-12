data("iris")
buckets <- 10
maxSepLen <- max(iris$Sepal.Length)
minSepLen <- min(iris$Sepal.Length)
cutPoints <- seq(minSepLen, maxSepLen, by=(maxSepLen - minSepLen)/buckets)
cutPoints
cutSepLen <- cut(iris$Sepal.Length, breaks = cutPoints, include.lowest = TRUE)
newiris <- data.frame(contSepLen=iris$Sepal.Length, discSepLen=cutSepLen)
head(newiris)