(a <- lapply(1:3, function(x) { x*2 }))
a[2]
unlist(a)
a <- unlist(a)
a

x <- c(20, 11, 33, 50, 47, NaN)
x
sort(x,decreasing = TRUE)

order(x)

iris

with(iris, {
    print(mean(Sepal.Length))
    print(mean(Sepal.Width))
})

x <- data.frame(val = c( 1, 2, 3, 4, NA, 5, NA) )
x
x <- within(x,{
    val <- ifelse(is.na(val), median(val, na.rm=TRUE), val)
})
x
