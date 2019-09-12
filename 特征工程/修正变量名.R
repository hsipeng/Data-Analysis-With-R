setwd("~/Documents/Workspace/R")

# 修正变量名
df <- data.frame("Address 1"=character(0), direction=character(0),street=character(0),CrossStreet=character(0),intersection=character(0), Location.1=character(0))

names(df)

names(df) <- tolower(names(df))# convert to all lower case
names(df)

# 根据句点把字符串拆分成子列表
splitnames <- strsplit(names(df), "\\.")

class(splitnames)

splitnames[[6]][1]

# 从每一个元素中都提取子列表的第一个元素
firstelement <- function(x){x[1]}

# sapply 函数
names(df) <- sapply(splitnames, firstelement)

names(df)