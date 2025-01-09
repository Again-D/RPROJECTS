# 데이터 생성
set.seed(123)
data1 <- rnorm(100, mean = 50, sd = 10)
data2 <- rnorm(100, mean = 55, sd = 15)
data3 <- rnorm(100, mean = 60, sd = 20)

# 데이터 프레임으로 정리
df <- data.frame(Group = rep(c("Group 1", "Group 2", "Group 3"), each = 100),
                 Values = c(data1, data2, data3))

# 기본 상자 그림 그리기
boxplot(Values ~ Group, data = df, main = "Basic Boxplot",
        xlab = "Group", ylab = "Values",
        col = c("skyblue", "lightgreen", "lightcoral"))

# 이상치 표시하지 않은 상자 그림
boxplot(Values ~ Group, data = df, main = "Boxplot without Outliers",
        xlab = "Group", ylab = "Values", col = c("skyblue", "lightgreen", "lightcoral"),
        outline = FALSE)

# 수직이 아닌 수평 상자 그림
boxplot(Values ~ Group, data = df, main = "Horizontal Boxplot",
        xlab = "Values", ylab = "Group", col = c("skyblue", "lightgreen", "lightcoral"),
        horizontal = TRUE)

# 개별 그룹별로 상자 그림 그리기
boxplot(data1, data2, data3, main = "Multiple Boxplots",
        names = c("Group 1", "Group 2", "Group 3"),
        col = c("skyblue", "lightgreen", "lightcoral"),
        notch = TRUE)

# 범례 추가
legend("topright", legend = c("Group 1", "Group 2", "Group 3"),
       fill = c("skyblue", "lightgreen", "lightcoral"))
