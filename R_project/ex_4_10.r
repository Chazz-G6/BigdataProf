library(RMySQL)
con <- dbConnect( MySQL(), user = "root"
    ,password = "root2022", dbname = "sqldb"
    ,host = "127.0.0.1")

x<-dbGetQuery(con, "select userID, name, addr from usertbl");
x
class(x)
dbListTables(con)

library('data.table')
iris_table <- as.data.table((iris))
iris_table

class(data.table())

iris_table[1, Sepal.Length]
iris_table[1, list(Sepal.Length, Species)]

dt <- as.data.table(iris)

dt[1,1]

(x <- data.table(x=c(1,2,3), y=c("a","b","c")))
(y <- data.frame(x=c(1,2,3), y=c("a","b","c")))


foreach (i=1:5, .combine=c ) %do% {
    return(i)
}

foreach (i=1:5, .combine=rbind ) %do% {
    data.frame(val=i)
}

foreach (i=1:5, .combine=cbind ) %do% {
    data.frame(val=i)
}

install.packages('doParallel')
library("doParallel")

registerDoParallel(cores=4)

big_data <- data.frame(
    value = runif(NROW(LETTERS) * 2000000)
    , group = rep(LETTERS,2000000) )

head(big_data)

library(plyr)

big_list <- dlply(big_data,
    .(group), function(x){
        mean(x$value)
    }
    , .parallel=TRUE)

head(big_list)



library(testthat)

fib <- function(n) {
    if (n == 0) {
        return(1)
    }

    if (n > 0) {
        return( fib(n-1) + fib(n-2) )
    }
}

expect_equal(1, fib(0))

expect_equal(1, fib(1))

expect_equal(1, fib(2))


paste('a', 1, 2, 'b', 'c')


paste("A", 1:6)


library(mlbench)

data(Ozone)

Ozone

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temperature", 
ylab="El Monte Temperature", main="Ozone", cex=.5 ,col="#FF0000")


x <- seq(0, 2*pi, 0.1)
y <- sin(x)
plot(x,y,cex=.5,col="red")
lines(x,y)


data(cars)

str(cars)

head(cars)

plot(cars, type="l")
plot(cars, type="b")
plot(cars, type="o")


with(iris, {
    plot(NULL, xlim=c(0, 5), ylim=c(0,10),
        xlab="width", ylab="length", main="iris", type="n")
    points(Sepal.Width, Sepal.Length, cex=.5, pch=20)
    points(Petal.Width, Petal.Length, cex=.5, pch="+", col="#FF0000")
})



hist(iris$Sepal.Width, freq=FALSE)


boxplot(iris$Sepal.Width)