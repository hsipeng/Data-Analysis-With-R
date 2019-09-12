library(kernlab)
# 垃圾邮件
data("spam")
plot(density(spam$charDollar[spam$type== "nonspam"]),lwd=0.5,
     main="", xlab="Frequency of  '$' in E-mail")
lines(density(spam$charDollar[spam$type == 'spam']), lwd=3)
abline(v=0.125, col="black")
legend(1.5, 20, legend = c("Spam", "Nonspam"),lwd=c(3,0.5), lty=1)


# 垃圾邮件分类算法

spam_classifier <- ifelse(spam$charDollar > 0.125, "spam", "nonspam")
table(spam_classifier, spam$type)/nrow(spam)