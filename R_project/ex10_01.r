d <- subset(iris, Species == "virginica" | Species == "versicolor")
#예측값 분류를 통한 회귀 모델 작성
str(d)
d$Species <- factor(d$Species)
#
str(d)

(m <- glm(Species ~ ., data = d, family = "binomial"))

d

fitted(m)[c(1:5, 51:55)]
f <- fitted(m)
plot(m)

as.numeric(d$Species)

anova(m, test="Chisq")


(z <- glm(Species ~ Sepal.Length + Petal.Length + Petal.Width, data = d, family = "binomial"))
#카이스퀘어 결과에서 유의미한 결과를 내지 못한 Sepal.Width(0.63)를 제외하고 나머지 3개를 통해 모델을 작성.
fitted(z)[c(1:5, 51:55)]
as.numeric(d$Species)
anova(z, test="Chisq")
plot(z)


library(rpart)

(m <- rpart(Species ~., data=iris))

plot(m, compress=TRUE, margin=.2)
text(m, cex=1)

library(rpart.plot)
prp(m, type=4, extra=1, digits=3)

install.packages("rpart")
install.packages("party")
library(party)
(m <- ctree(Species ~., data=iris))

plot(m)
levels(iris$Species)
