# 데이터 생성
set.seed(42)  # For reproducibility
x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100, mean = 5)
w <- rnorm(100, mean = 10)

# 그래픽 디바이스 설정
# mfrow를 사용하여 2x2 배열로 플롯을 배치
par(mfrow = c(2, 2))  # 2 rows, 2 columns

# 첫 번째 플롯
plot(x, y, 
     main = "Scatter Plot of x and y", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue")

# 두 번째 플롯
hist(x, 
     main = "Histogram of x", 
     xlab = "X Values", 
     col = "lightgreen", 
     border = "black")

# 세 번째 플롯
boxplot(y ~ cut(x, breaks = 4), 
        main = "Boxplot of y by x bins", 
        xlab = "X Bins", 
        ylab = "Y Values", 
        col = "lightblue")

# 네 번째 플롯
plot(z, w, 
     main = "Scatter Plot of z and w", 
     xlab = "Z Axis", 
     ylab = "W Axis", 
     pch = 17, 
     col = "red")

# 그래픽 디바이스 원상복구
# mfrow 설정을 원래대로 복구 (옵션에 따라 다를 수 있음)
par(mfrow = c(1, 1))

