install.packages("nearZeroVar")
library(FSelector)
library(mlbench)
data(Ozone)
head(Ozone)

(v <- linear.correlation(V4 ~ ., data=subset(Ozone, select=-c(V1,V2,V3))))

cutoff.k(v,3)



library(caret)
library(mlbench)
data(Soybean)
nearZeroVar(Soybean, saveMetrics = TRUE)


library(mlbench)
library(rpart)
library(caret)
data(BreastCancer)
m <- rpart(Class ~., data=BreastCancer)
varImp(m)



predicted <- c(1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1)
actual <- c(1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1)

xtabs( ~ predicted + actual)
x <- sum( predicted == actual) / NROW(actual)
library(caret)
predicted <- as.factor(c(1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1))
actual <- as.factor(c(1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1))
confusionMatrix(predicted,actual)




library(caret)

lvs <- c("normal", "abnormal")
truth <- factor(rep(lvs, times = c(86, 258)), levels = rev(lvs))
pred <- factor(
    c(rep(lvs, times = c(54, 32)), rep(lvs, times = c(27,231))),
    levels = rev(lvs))

xtab <- table(pred, truth)
confusionMatrix(xtab)


library(caret)
t <- as.table(rbind(c(231, 32), c(27, 54)))
dimnames(t) <- list(pred = c("abnormal", "normal"), truth = c("abnormal", "normal"))
cm <- confusionMatrix(t)
cm$overall["Accuracy"]
cm$byClass["Sensitivity"]
cm$byClass["Specificity"]
cm$byClass["Specificity"]
cm$byClass["Precision"]
cm$byClass["Recall"]


x <- set.seed(137)
x
probs <- runif(100)
probs

labels <- as.factor(ifelse(probs > .5 & runif(100) < .4, "A", "B"))

library(ROCR)

pred <- prediction(prob, labels)
pred
str(pred)

install.packages("cvTools")
library(cvTools)

cvFolds(10, K=5, type="consecutive")

cvFolds(10, K=5, type="interleaved")

set.seed(719)

(cv <- cvFolds(NROW(iris), K=10, R=3))

library(caret)
(parts <- createDataPartition(iris$Species, p=0.8))

table((iris[parts$Resample1, "Species"]))

