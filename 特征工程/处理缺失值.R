 library(e1071)
 iris_missing_data <- iris
 View(iris_missing_data)
 iris_missing_data[5,1] <- NA
 iris_missing_data[7,3] <- NA
 iris_missing_data[10,4] <- NA
 iris_missing_data[1:10,-5]
 irrs_repaired <- impute(iris_missing_data[, 1:4], what="mean")
 irrs_repaired <- data.frame(irrs_repaired)
 irrs_repaired[1:10, -5]

 df <- iris_missing_data
 nrow(df)
# 1. 去除缺失值
iris_trimmed <- df[complete.cases(df[,1:4]),]
# iris_trimmed <- na.omit(df) 同理
nrow(iris_trimmed)

# 2. 去除缺失值
df.has.na <- apply(df, 1, function(x){any(is.na(x))})
 sum(df.has.na)
iris_trimmed <- df[!df.has.na,]
