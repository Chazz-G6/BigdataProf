(m <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data=iris))
m
summary(m)
head(iris)

(m <- lm(Sepal.Length ~ ., data=iris))

iris
model.matrix(m)[c(1,51,101)]

with(Orange, interaction.plot(age,Tree,circumference))
m<-lm(circumference ~ age, data=Orange)
m
with(Orange,
    plot (Tree, circumference, xlab="tree", ylab="circumference"))

anova(m)

library(car)
data(cars)
head(cars)

m<-lm(dist~speed, data=cars)
m
rstudent(m)


outlierTest(m)




data(cars)
head(cars)
(m <- lm(dist ~ speed,cars))
