install.packages("kernlab")
library(kernlab)
library(svm)
help(kernlab::dots)
library(nnet)
m <- nnet(Species ~., data=iris, size=3) # 은닉층의 노드 3

#weights : 27

predict(m, newdata=iris)

predict(m, newdata=iris, type="class")


class.ind(iris$Species)
m2 <- nnet(iris[, 1:4], class.ind(iris$Species), size=3,
            softmax=TRUE)

predict(m2, newdata=iris[, 1:4], type="class")


(m <- ksvm(Species ~ ., data=iris))

m
head(predict(m, newdata=iris))


ksvm(Species ~., data=iris, kernel="vanilladot")


install.packages("e1071")
library(e1071)
tune(svm, Species ~., data=iris, gamma=2^(-1:1), cost=2^(2:4))
