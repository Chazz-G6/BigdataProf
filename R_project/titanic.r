#내 깃허브에 로딩 방식, 데이터 탐색, 데이터 처리, 모형 구축, 모형 검증
#에 따라서 (Example_Prediction) 분석 결과 ~~에 연관성 여부 등 결과를 

#CSV파일 읽어오기
titanic = read.csv("./titanic3.csv")
#타이타닉 데이터의 필요 없는 칼럼 제외
titanic <- titanic[, !names(titanic) %in% c("home.dest", "boat", "body")]
str(titanic)
titanic$embarked <- as.factor(titanic$embarked)
titanic$sex <- as.factor(titanic$sex)
titanic$pclass <- as.factor(titanic$pclass) # 1,2,3등석 표시 정보를 정수가 아닌 범주형으로 변경
titanic$name <- as.character(titanic$name) # 이름을 char 형식으로
titanic$ticket <- as.character(titanic$ticket) # ticket 번호를 char 형식으로
titanic$cabin <- as.character(titanic$cabin) # cabin 객실 번호를 char 형식으로
titanic$survived <- factor(titanic$survived, levels=c(0, 1), labels = 
c("dead", "survived"))
# 생존 여부를 0과 1의 범주형으로 (사망, 생존 레이블 이용)
str(titanic)
levels(titanic$embarked)
table(titanic$embarked)
levels(titanic$embarked) [1] <- NA #Null로 표시되는 ""값을 NA로
table(titanic$embarked, useNA="always") # 항상
str(titanic)
titanic$cabin <- ifelse(titanic$cabin == "", NA, titanic$cabin)
# cabin 칼럼의 빈 공간 또한 NA로 치환

str(titanic)

# 테스트 데이터의 분리   --------------------------------- 

library(caret) # 캐럿 라이브러리
set.seed(137) # 난수 생성 시드 설정
test_idx <- createDataPartition(titanic$survived, p=0.1)$Resample1
# 데이터를 Train 데이터/ Test 데이터로 분할
titanic.test <- titanic[test_idx, ] 
titanic.train <- titanic[-test_idx, ]
#test 파티션에 들어간 데이터를 인덱스에 등록 및 train용 데이터를 인덱스에서 제거
NROW(titanic.test) #Test 데이터의 수 : 131개
prop.table(table(titanic.test$survived)) # test 데이터의 사망/생존 비율
NROW(titanic.train) #Train 데이터의 수 : 1178개
prop.table(table(titanic.train$survived)) # train 데이터의 사망/생존 비율

save(titanic, titanic.test, titanic.train, file = "titanic.RData")
# 저장

createFolds(titanic.train$survived, k=10) 
# K-fold 교차검증 형식으로 k값인 10겹으로 데이터를 분할

#Fold 1 ~ 10을 포함하는 리스트를 반환하며, train과 validation의 이름으로 훈련,검증 데이터를 저장하는 함수 선언
create_ten_fold_cv <- function() {
    set.seed(137)
    lapply(createFolds(titanic.train$survived, k=10), function(idx) {
        return(list(train=titanic.train[-idx, ],
                    validation=titanic.train[idx, ]))
    })
}

# x에 fold 호출 함수 대입
x <- create_ten_fold_cv()
str(x)
# x 중 fold1의 train 데이터 head 출력
head(x$Fold01$train)

library(Hmisc)
#교차 검증의 첫 번째 분할에서의 훈련 데이터를 사용한 데이터 탐색
data <- create_ten_fold_cv()[[1]]$train
# method = "reverse"는 종속 변수 survived에 따라 독립 변수들을 분할아여 보여줌
summary(survived ~ pclass + sex + age + sibsp + parch + fare + embarked, data=data,
        method="reverse")

data <- create_ten_fold_cv()[[1]]$train
data.complete <- data[complete.cases(data), ]
#names(data.complete)가 data.complete의 칼럼명을 반환하여
#각각의 이름을 function에 넘긴 후 해당 함수에서 숫자형 데이터인지 여부를 테스트하여 반환(T/F)
featurePlot(
    data.complete[,
        sapply(names(data.complete),
            function(n) { is.numeric(data.complete [, n]) })],
    data.complete [, c("survived")],
    "ellipse")

#좌석 등급화 성별에 따른 생존 여부를 모자이크 플롯을 통해 출력
mosaicplot(survived ~ pclass + sex, data=data, color=TRUE,
            main="pclass and sex")

# 좌석 등급 및 성별별 사망률
xtabs(~ sex + pclass, data =data)
# 좌석 등급 볓 생존자 수
xtabs(survived == "survived" ~ sex + pclass, data=data)

# 생존자 / 사망률을 xtabs 끼리의 연산으로 구함 (편하다)
xtabs(survived == "survived" ~ sex + pclass, data=data) / xtabs(~ sex + pclass, data =data)

#평가 메트릭
predicted <- c(1, 0, 0, 1, 1)
actual <- c(1, 0, 0, 0, 0)
#일 때 해당 모델의 accuracy는 =
sum(predicted == actual) / NROW(predicted)


#의사결정 트리 모델 rpart 라이브러리를 이용하여 의사 결정 트리 만들기
library(rpart)
m <- rpart(
    survived ~ pclass + sex + age + sibsp + parch + fare + embarked,
    data = titanic.train)
p <- predict(m, newdata=titanic.train, type="class")
head(p)

#rpart 교차 검증
library(rpart)
library(foreach)
folds <- create_ten_fold_cv()
rpart_result <- foreach(f=folds) %do% {
#foreach가 list의 Fold01,02 등을 f 변수로 받아서
    model_rpart <- rpart(
        survived ~ pclass + sex + age + sibsp + parch + fare + embarked,
        data=f$train)
    predicted <- predict(model_rpart, newdata=f$validation,
                        type="class")
#f$train,validation을 통해 rpart,predict를 수행.
    return(list(actual=f$validation$survived, predicted=predicted))
#결과는 actual에 생존 여부값, predicted 에 예측값을 저장한 리스트로 반환되며
    head(rpart_result)
}
#foreach는 folds 전체에 대한 결과를 또 다시 리스트로 묶는다.

#정확도 평가

evaluation <- function(lst) { 
    accuracy <- sapply(lst, function(one_result) {
        #rpart_result의 리스트 형식인 one_result를 입력받아 sapply를 수행하는 함수인 evaluation
        return(sum(one_result$predicted == one_result$actual) 
        / NROW(one_result$actual)) #predicted data와 actual data를 통해 구해진 결과를 반환
        })
    print(sprintf("MEAN +/- SD: %.3f +/- %.3f",
                    mean(accuracy), sd(accuracy)))
    #정확도 계산 결과 rpart 모델의 accuracy는 0.801
    return(accuracy)
}
(rpart_accuracy <- evaluation(rpart_result))
#이후 rpart_result를 입력받은 evaluation 함수로 계산된 accuracy를 rpart_accuracy에 반환..

# 조건부 추론 나무
str(titanic.train)
library(party)
ctree_result <- foreach(f=folds) %do% {
    model_ctree <- ctree(
        survived ~ pclass + sex + age + sibsp + parch + fare + embarked,
        data=f$train)
    predicted <- predict(model_ctree, newdata = f$validation,
                        type="response")
    return(list(actual=f$validation$survived, predicted=predicted))
}
(ctree_accuracy <- evaluation(ctree_result))

plot(density(rpart_accuracy), main="rpart VS ctree")
lines(density(ctree_accuracy), col="red", lty="dashed")


View(titanic.train[order(titanic.train$ticket),
    c("ticket", "parch", "name", "cabin", "embarked")])

sum(is.na(titanic.train$ticket))

sum(is.na(titanic.train$embarked))

sum(is.na(titanic.train$cabin))

library(plyr)

family_result <- foreach(f=folds) %do% {
    f$train$type <- "T"
    f$validation$type <- "V"
    all <- rbind(f$train, f$validation)
    ctree_model <- ctree(
        survived ~ pclass + sex + age + sibsp + parch + fare + embarked,
        data=f$train)
    all$prob <- sapply(
        predict(ctree_model, type="prob", newdata=all),
        function(result) { result[1] })

    family_idx <- 0
    ticket_based_family_id <- ddply(all, .(ticket), function(rows) {
        family_idx <<- family_idx + 1
        return(data.frame(family_id=paste0("TICKET_", family_idx)))
    })

}
all <- adply(all,
        1,
        function(row) {
            family_id <- NA
            if (!is.na(row$ticket)) {
                family_id <- subset(ticket_based_family_id,
                                    ticket == row$ticket)$family_id
            }
            return(data.frame(family_id=family_id, stringsAsFactors = TRUE))
        })

str(ticket_based_family_id)

head(ticket_based_family_id)

str(all)

all <- ddply(all,
            .(family_id),
            function(rows) {
                rows$avg_prob <- mean(rows$prob)
                return(rows)
            })


all <- ddply(all, .(family_id), function(rows) {
    rows$maybe_parent <- FALSE
    rows$maybe_child <- FALSE
    if (NROW(rows) == 1 ||
        sum(rows$parch) == 0 ||
        NROW(rows) == sum(is.na(rows$age))) {
        return(rows)
    }
    max_age <- max(rows$age, na.rm=TRUE)
    min_age <- min(rows$age, na.rm=TRUE)
    return(adply(rows, 1, function(row) {
        if (!is.na(row$age) && !is.na(row$sex)) {
            row$maybe_parent <- (max_age - row$age) < 10
            row$maybe_child <- (row$age - min_age) < 10
        }
        return(row)
    }))
})

all <- ddply(all, .(family_id), function(rows) {
    rows$avg_parent_prob <- rows$avg_prob
    rows$avg_child_prob <- rows$avg_prob
    if (NROW(rows) == 1 || sum(rows$parch) == 0) {
        return(rows)
    }
    parent_prob <- subset(rows, maybe_parent == TRUE) [, "prob"]
    if (NROW(parent_prob) > 0) {
        rows$avg_parent_prob <- mean(parent_prob)
    }
    child_prob <- subset(rows, maybe_child == TRUE) [, "prob"]
    if (NROW(child_prob) > 0) {
        rows$avg_child_prob <- mean(child_prob)
    }
    return(rows)
})

str(all)

f$train <- subset(all, type == "T")
f$validation <- subset(all, type == "V")

(m <- ctree(survived ~ pclass + sex + age + sibsp + parch + fare + embarked + 
maybe_parent + maybe_child + age + sex + avg_prob + avg_parent_prob + avg_child_prob,
            data=f$train))



print(m)

predicted <- predict(m, newdata=f$validation)

print(m)
