x <- 1:10
x

y <- x +runif(10, min=-.5, max =.5)
z <- x + y + runif(10, min=-10, max=.10)
(data <- data.frame(x,y,z))

pr <- princomp(data)
summary(pr)

data(iris)
p <- princomp(iris[,1:4], cor=TRUE)
summary(p)

plot(p, type= '1')


(x <- data.frame(lvl=factor(c("A","B","A","A","C")),
                value=c(1,3,2,4,5)))

model.matrix(~ lvl, data=x)[, -1]

iris_na <- iris
iris_na[c(10,20,25,40,32), 3] <- NA
iris_na
iris_na[!complete.cases(iris_na), ]

iris_na[is.na(iris_na$Petal.Length), ]
mapply(median, iris_na[1:4], na.rm=TRUE)

install.packages("ROCR")
install.packages("http://cran.nexr.com/src/contrib/DMwR_0.4.1.tar.gz", repos = NULL, type="source")


install.packages(c("zoo","xts","quantmod"))
install.packages("FSelector")



install.packages("http://cran.nexr.com/src/contrib/DMwR_0.4.1.tar.gz", repos = NULL, type="source")


library(mlbench)
library(caret)
data(Vehicle)
head(Vehicle)

findCorrelation(cor(subset(Vehicle, select=-c(Class))))

cor(subset(Vehicle, select= -c(Class)))[c(3, 8, 11, 7, 9, 2), c(3, 8, 11, 7, 9, 2)]
