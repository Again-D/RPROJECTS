# 데이터 생성
set.seed(42)  # For reproducibility
x <- seq(-10, 10, length.out = 100)
y <- x^2 + rnorm(100, mean = 0, sd = 10)

# 기본 산점도 생성
plot(x, y, 
     main = "Scatter Plot with Curve Example", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue", 
     xlim = c(-12, 12), 
     ylim = c(min(y) - 20, max(y) + 20))

# 수식으로 곡선 추가
curve(x^2, 
      from = -12, 
      to = 12, 
      add = TRUE, 
      col = "red", 
      lwd = 2, 
      lty = 1)

# 다른 수식으로 곡선 추가
curve(3 * x^2 + 5 * x + 2, 
      from = -12, 
      to = 12, 
      add = TRUE, 
      col = "green", 
      lwd = 2, 
      lty = 2)

# 범례 추가
legend("topright", 
       legend = c("Data Points", "x^2 Curve", "3x^2 + 5x + 2 Curve"), 
       col = c("blue", "red", "green"), 
       pch = c(19, NA, NA), 
       lwd = 2, 
       lty = c(NA, 1, 2))

