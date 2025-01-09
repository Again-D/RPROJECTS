# 데이터 생성
set.seed(42)  # For reproducibility
x <- 1:10
y <- 3 * x + rnorm(10, mean = 0, sd = 3)  # Adding some random noise

# 기본 산점도 생성
plot(x, y, 
     main = "Scatter Plot with abline() Example", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue", 
     xlim = c(0, 12), 
     ylim = c(min(y) - 5, max(y) + 5))

# 직선을 직접 지정하여 추가
abline(a = 1, b = 3,  # a = intercept, b = slope
       col = "red", 
       lwd = 2, 
       lty = 1)

# 선형 회귀 모델을 사용하여 직선 추가
model <- lm(y ~ x)
abline(model, 
       col = "green", 
       lwd = 2, 
       lty = 2)

# 범례 추가
legend("topright", 
       legend = c("Custom Line", "Fitted Line"), 
       col = c("red", "green"), 
       lwd = 2, 
       lty = c(1, 2))

