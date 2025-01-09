# 데이터 생성
set.seed(42)  # For reproducibility
x1 <- rnorm(50, mean = 5)
y1 <- rnorm(50, mean = 5)
x2 <- rnorm(50, mean = 10)
y2 <- rnorm(50, mean = 10)

# 기본 산점도 생성
plot(x1, y1, 
     main = "Scatter Plot with Additional Points", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue")

# 추가 점들
points(x2, y2, 
       pch = 17, 
       col = "red")

# 다른 점의 크기와 색상으로 추가 점들
points(x2 + 1, y2 + 1, 
       pch = 8, 
       col = "green", 
       cex = 1.5)

# 그래픽 옵션을 조절하여 플롯 개선
plot(x1, y1, 
     main = "Improved Scatter Plot with Additional Points", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue", 
     xlim = c(min(c(x1, x2)) - 1, max(c(x1, x2)) + 2), 
     ylim = c(min(c(y1, y2)) - 1, max(c(y1, y2)) + 2))

points(x2, y2, 
       pch = 17, 
       col = "red")

points(x2 + 1, y2 + 1, 
       pch = 8, 
       col = "green", 
       cex = 1.5)

# 범례 추가
legend("topright", 
       legend = c("Group 1", "Group 2", "Group 3"), 
       pch = c(19, 17, 8), 
       col = c("blue", "red", "green"))

