data(cars)
head(cars)

m <- lm( dist ~ speed, cars)

plot( cars$speed, cars$dist, cex=2, pch=20)
abline(coef(m))
