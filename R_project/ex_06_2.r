library(sampling)
strata(c("Species"), size=c(3, 1, 1), method="srswr", data=iris)
install.packages("MASS")


(x <- strata(c("Species"), size = c(3,3,3), method = "srswor", data = iris))

library(doBy)

(x <- data.frame(x=1:10))

sampleBy(~1, frac=.3, data=x, systematic = TRUE)


x<-data.frame(x=1:10)
x
library(doBy)


sampleBy(~1, frac=.3, data=x, systematic = TRUE)


d <- data.frame(x=c("1","2","2","1"),
                y=c("A","B","A","B"),
                num=c(3,5,8,7))
(xtabs(num ~ x + y, data=d))


library(MASS)
data(survey)
str(survey)
head(survey[c("Sex", "Exer")])

xtabs(~ Sex + Exer, data=survey)

chisq.test(xtabs(~ Sex + Exer, data=survey))

x <- seq(1, 10 ,1)
plot(x, dchisq(x,6), type="l")


xtabs(~ W.Hnd + Clap, data=survey)

fisher.test(xtabs(~ W.Hnd + Clap, data=survey))


cor(iris$Sepal.Width, iris$Sepal.Length)
plot(iris$Sepal.Width, iris$Sepal.Length)
cor(iris[,1:4])

symnum(cor(iris[,1:4]))


install.packages("Kendall")

library(corrgram)
corrgram(iris, upper.panel = panel.conf)
#cor = 상관계수
cor(1:10, 1:10)
cor(1:10, 1:10*2)

x=1:10
y=x^3
y
cor(x,y)


x <- c(3,4,5,3,2,1,7,5)
rank(x)
rank(sort(x))
sort(x)

(m <- matrix(c(1:10, (1:10)^2), ncol=2))

cor(m, method ="spearman")

cor(m, method = "pearson")



