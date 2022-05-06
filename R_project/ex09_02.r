df <- data.frame(iris)

df_n <- scale(iris[1])
df_n
df_sl_min <- min(df$Sepal.Length)
df_sl_max <- max(df$Sepal.Length)


scale(iris[1:2], center = df_sl_min, scale=df_sl_max-df_sl_min)
