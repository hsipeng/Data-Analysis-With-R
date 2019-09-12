airquality$Ozone[1:10]
# 计算范围
ozonRanges <- cut(airquality$Ozone, seq(0, 200, by=25))

ozonRanges[1:10]
class(ozonRanges)
table(ozonRanges, useNA = 'ifany')
airquality$ozoneRanges <- ozoneRanges
head(airquality)
