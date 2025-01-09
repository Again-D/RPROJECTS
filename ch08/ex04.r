# 데이터 생성
set.seed(42)  # For reproducibility
x <- c(rep(1, 30), rep(2, 30), rep(3, 30))
y <- c(rnorm(30, mean = 5), rnorm(30, mean = 10), rnorm(30, mean = 15))

# 데이터 프레임 생성
data <- data.frame(x = factor(x), y = y)

# 기본 산점도 (지터 적용 전)
cat("--- Basic Scatter Plot without Jitter ---\n")
plot(data$x, data$y, 
     main = "Basic Scatter Plot Without Jitter", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue")

# 지터를 적용한 산점도
cat("\n--- Scatter Plot with Jitter ---\n")
plot(jitter(data$x), data$y, 
     main = "Scatter Plot with Jitter", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "red")

# 지터 크기 조절
cat("\n--- Scatter Plot with Custom Jitter Amount ---\n")
plot(jitter(data$x, amount = 0.5), data$y, 
     main = "Scatter Plot with Custom Jitter Amount", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "green")

# ggplot2를 사용한 지터 적용
cat("\n--- Scatter Plot with Jitter Using ggplot2 ---\n")
library(ggplot2)
ggplot(data, aes(x = x, y = y)) +
  geom_jitter(color = "blue", width = 0.2, height = 0.2) +
  labs(title = "Scatter Plot with Jitter (ggplot2)", x = "X Axis", y = "Y Axis")

