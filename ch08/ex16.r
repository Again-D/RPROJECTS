# 밀도 그림 예제

# 데이터 생성
set.seed(123)
data1 <- rnorm(1000, mean = 50, sd = 10)
data2 <- rnorm(1000, mean = 55, sd = 15)

# 기본 밀도 그림 그리기
density_data1 <- density(data1)
plot(density_data1, main = "Basic Density Plot",
     xlab = "Values", ylab = "Density",
     col = "blue", lwd = 2)

# 밀도 그림의 다양한 옵션 사용
density_data2 <- density(data2)
plot(density_data2, main = "Density Plot with Customizations",
     xlab = "Values", ylab = "Density",
     col = "red", lwd = 3, lty = 2, # 선 색상, 굵기, 스타일 설정
     xlim = c(0, 100), ylim = c(0, 0.05)) # X축, Y축 범위 설정

# 두 데이터셋 비교 밀도 그림 그리기
plot(density_data1, main = "Comparing Two Density Distributions",
     xlab = "Values", ylab = "Density",
     col = "blue", lwd = 2, xlim = c(0, 100))
lines(density_data2, col = "red", lwd = 2, lty = 2)
legend("topright", legend = c("Data1", "Data2"),
       col = c("blue", "red"), lwd = 2, lty = 1:2)

# 데이터의 커널 밀도 추정 방식 변경 (Gaussian 커널 대신 Epanechnikov 커널 사용)
density_data1_epa <- density(data1, kernel = "epanechnikov")
plot(density_data1_epa, main = "Density Plot with Epanechnikov Kernel",
     xlab = "Values", ylab = "Density",
     col = "green", lwd = 2)

# 밀도 그림에 히스토그램 추가
hist(data1, breaks = 30, probability = TRUE, col = "gray", border = "white",
     main = "Histogram with Density Overlay",
     xlab = "Values", ylab = "Density")
lines(density_data1, col = "blue", lwd = 2)
