dt <- read.csv("./drinking_water.csv")
head(dt)

hist(dt$친밀도)

# 공분산
cov(dt$친밀도, dt$적절성 )

# 상관계수 : Correlation

# 피어슨

# 친밀도, 적절성의 상관계수

cor(dt$친밀도, dt$적절성 )

# 적절성 + 만족도 상관계수

cor(dt$친밀도, dt$만족도 )

# 적절성 + 친밀도 , 만족도 상관계수

cor(dt$친밀도+dt$적절성, dt$만족도, method = "pearson" )

# 피어슨 상관계수
symnum(cor(dt, method="pearson"))
cor(dt, method="pearson")

y<-cor(dt,method="pearson")
y
symnum(y)


# corrgram으로 그래프 그리기

corrgram(dt)
corrgram(dt, upper.panel = panel.conf)
corrgram(dt, lower.panel = panel.conf)
