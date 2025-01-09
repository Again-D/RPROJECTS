# 데이터 생성
set.seed(42)  # For reproducibility
x <- seq(1, 10)
y <- c(1, 3, 4, 8, 5, 7, 10, 9, 6, 4)

# 기본 산점도 생성
plot(x, y, 
     main = "Scatter Plot with Polygon Example", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue", 
     xlim = c(0, 12), 
     ylim = c(0, 12))

# 다각형 추가: 원본 데이터에 기반한 다각형
polygon(x, y, 
        col = rgb(1, 0, 0, 0.3),  # Semi-transparent red
        border = "red")

# 추가적인 다각형: 수정된 좌표에 기반
x2 <- c(3, 5, 7, 10, 8, 6)
y2 <- c(2, 6, 8, 7, 4, 3)

polygon(x2, y2, 
        col = rgb(0, 1, 0, 0.3),  # Semi-transparent green
        border = "green")

# 범례 추가
legend("topright", 
       legend = c("Original Polygon", "Additional Polygon"), 
       fill = c(rgb(1, 0, 0, 0.3), rgb(0, 1, 0, 0.3)), 
       border = c("red", "green"))

