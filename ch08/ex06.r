# 데이터 생성
set.seed(42)  # For reproducibility
x <- 1:10
y <- rnorm(10, mean = 5, sd = 2)
y_trend <- 0.5 * x + 3

# 기본 산점도 생성
plot(x, y, 
     main = "Scatter Plot with Lines", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue", 
     xlim = c(0, 12), 
     ylim = c(min(y) - 1, max(y) + 1))

# 데이터 점들에 선 추가
lines(x, y_trend, 
      col = "red", 
      lwd = 2, 
      lty = 1)

# 선을 추가하여 데이터의 트렌드 시각화
# 다른 선 추가
y_trend2 <- 0.4 * x + 2
lines(x, y_trend2, 
      col = "green", 
      lwd = 2, 
      lty = 2)

# 추가 선 및 점의 범례 추가
legend("topright", 
       legend = c("Trend Line 1", "Trend Line 2"), 
       col = c("red", "green"), 
       lwd = 2, 
       lty = c(1, 2))

