# 데이터 생성
set.seed(123)
data1 <- rnorm(1000, mean = 50, sd = 10)
data2 <- rnorm(1000, mean = 55, sd = 15)

# 기본 히스토그램 그리기
hist(data1, main = "Basic Histogram",
     xlab = "Values", ylab = "Frequency",
     col = "skyblue", border = "black")

# 특정 막대(bin) 수로 히스토그램 그리기
hist(data1, breaks = 20, main = "Histogram with 20 Bins",
     xlab = "Values", ylab = "Frequency",
     col = "lightgreen", border = "black")

# 밀도 곡선 추가한 히스토그램
hist(data1, breaks = 30, probability = TRUE, main = "Histogram with Density Curve",
     xlab = "Values", ylab = "Density",
     col = "lightcoral", border = "black")
lines(density(data1), col = "blue", lwd = 2)

# 두 데이터셋 비교하는 히스토그램
hist(data1, breaks = 30, probability = TRUE, main = "Comparing Two Distributions",
     xlab = "Values", ylab = "Density",
     col = rgb(1, 0, 0, 0.5), border = "black")
hist(data2, breaks = 30, probability = TRUE, col = rgb(0, 0, 1, 0.5), border = "black", add = TRUE)
legend("topright", legend = c("Data1", "Data2"),
       fill = c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5)))

# 사용자 정의 X축, Y축 범위의 히스토그램
hist(data1, breaks = 30, main = "Histogram with Custom Axes",
     xlab = "Values", ylab = "Frequency",
     xlim = c(20, 80), ylim = c(0, 100),
     col = "yellow", border = "black")
