# 100 4 vs default

library(cvTools)
library(foreach)
library(randomForest)
#라이브러리 호출
set.seed(719)
K = 10
R = 3
cv <- cvFolds(NROW(iris), K=K, R=R)

grid <- expand.grid(ntree=c(10,100,200), mtry=c(3,4))

result <- foreach(g=1:NROW(grid), .combine = rbind) %do% {
    foreach(r=1:R, .combine = rbind) %do% {
        foreach(k=1:K, .combine = rbind) %do% {
            validation_idx <- cv$subsets[which(cv$which == k), r]
            train <- iris[-validation_idx, ]
            validation <- iris[validation_idx, ]
            #모델 훈련
            m <- randomForest(Species ~.,
                            data=train,
                            ntree=grid[g, "ntree"],
                            mtry=grid[g, "mtry"])
            #예측
            predicted <- predict(m, newdata = validation)
            #성능 평가
            precision <- sum(predicted == validation$Species) / NROW(predicted)
            return(data.frame(g=g, precision=precision))
        }
    }
}

head(result)

library(plyr)

ddply(result, .(g), summarize, mean_precision=mean(precision))


