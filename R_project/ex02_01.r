install.packages("ggplot2")
library(ggplot2)
str(traffic)
traffic <- read.csv(file="./visual/Report.csv")
traffic <- traffic[,c(1,2,3,5,7)]
traffic$발생건수<-gsub("[,]","",traffic$발생건수 )
traffic$부상자수<-gsub("[,]","",traffic$부상자수 )
traffic$발생건수<-as.numeric( traffic$발생건수 )
traffic$부상자수<-as.numeric( traffic$부상자수 )
str(traffic)

head(traffic)

junggu <- subset(traffic, 자치구명=='중구' )

str(junggu)

junggu


p1 <- ggplot(data=junggu, aes(x=연도, y=발생건수))
p1 <- p1 + geom_point(aes(x=연도, y=발생건수))
p1 <- p1 + xlim(2010,2020) + ylim(0, 1800)
p1 <- p1 + ggtitle("중구지역의 월별 교통사고 발생건수")
print(p1)


p2 <- ggplot(data=junggu, aes(x=연도))
p2 <- p2 + geom_line(aes(y=발생건수))
p2 <- p2 + coord_cartesian(xlim=c(2010, 2020), ylim=c(0,1800))
p2 <- p2 + ggtitle(" 중구지역의 월별 교통사고 발생 건수")
print(p2)

p3 <- ggplot(data=junggu, aes(x=연도))
p3 <- p3 + geom_point(aes(x=연도, y=발생건수))
p3 <- p3 + geom_line(aes(y=발생건수))
p3 <- p3 + ggtitle("중구지역의 월별 교통사고 발생건수")
p3 <- p3 + coord_cartesian(xlim=c(2010, 2020), ylim=c(0,1800))
print(p3)


p4 <- ggplot(data=junggu, aes(x=연도, y=발생건수))
p4 <- p4 + geom_bar(stat="identity", colour="gray", fill="blue")
p4 <- p4 + coord_cartesian(xlim=c(2010, 2020), ylim=c(0,1800))
p4 <- p4 + ggtitle("중구지역의 월별 교통사고 발생건수")
print(p4)

traffic2015 <- subset(traffic, 연도==2015 &자치구명!="합계")
traffic2015

p5 <- ggplot(data=traffic2015, aes(x=자치구명, y=발생건수))
p5 <- p5 + geom_bar(stat="identity", colour="gray", fill="blue")
p5 <- p5 + ggtitle("서울시 교통사고 발생건수")
print(p5)

p6 <- ggplot(data=traffic2015, aes(x=자치구명, y=부상자수))
p6 <- p6 + geom_bar(stat="identity", colour="gray", fill="cyan")
p6 <- p6 + ggtitle("2015년 서울시 교통사고 부상자수")
print(p6)

p7 <- ggplot(data=traffic2015, aes(x=자치구명, y=사망자수))
p7 <- p7 + geom_bar(stat="identity", colour="gray", fill="red")
p7 <- p7 + ggtitle("2015년 서울시 교통사고 사망자수")
print(p7)


row.names(traffic2015) <- traffic2015_12$자치구명
traffic2015 <- traffic2015[,c(3:5)]
traffic2015_matrix <- data.matrix(traffic2015)
traffic2015_matrix

heatmap(traffic2015_matrix, Rowv=NA, Colv=NA, col=cm.colors(256),
scale="column", margin=c(5,5), cexCol=1)
