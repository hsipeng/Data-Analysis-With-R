 library(lubridate)
 data("lakers")
 data("lakers")
 df <- lakers
 str(df$date)
 playdate <- df$date[1]
 playtime <- df$time[1]
 playdatetime <- paste(playdate, playtime)
 playdatetime <- parse_date_time(playdatetime, "%y-%m-%d %H.%M")
 playdatetime
 class(playdatetime)
 
 # ymd 时间转换函数
 df$date <- ymd(df$date)
 str(df$date)
 class(df$date)
 
 
 df$PlayDateTime <- parse_date_time(paste(df$date, df$time), "%y-%m-%d %H.%M")
 str(df$PlayDateTime)