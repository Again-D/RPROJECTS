# 막대 그래프(barplot) 실습 예제

# 1. 단순 막대 그래프
# 데이터 생성
counts <- c(10, 20, 15, 25)
categories <- c("A", "B", "C", "D")

# 기본 막대 그래프
barplot(counts, names.arg = categories, main = "Basic Barplot",
        xlab = "Category", ylab = "Frequency", col = "lightblue")

# 2. 막대 그래프에 색상과 축 라벨 설정
barplot(counts, names.arg = categories, main = "Colored Barplot",
        xlab = "Category", ylab = "Frequency", col = c("red", "green", "blue", "purple"))

# 3. 수평 막대 그래프
barplot(counts, names.arg = categories, main = "Horizontal Barplot",
        xlab = "Frequency", ylab = "Category", col = "lightgreen", horiz = TRUE)

# 4. 그룹화된 막대 그래프
# 데이터 생성
group_counts <- matrix(c(10, 20, 15, 25, 12, 18, 14, 22), nrow = 2, byrow = TRUE)
group_names <- c("A", "B", "C", "D")
group_labels <- c("Group1", "Group2")

# 그룹화된 막대 그래프
barplot(group_counts, beside = TRUE, names.arg = group_names, main = "Grouped Barplot",
        xlab = "Category", ylab = "Frequency", col = c("blue", "orange"))
legend("topright", legend = group_labels, fill = c("blue", "orange"))

# 5. 누적 막대 그래프
# 누적 막대 그래프
barplot(group_counts, beside = FALSE, names.arg = group_names, main = "Stacked Barplot",
        xlab = "Category", ylab = "Frequency", col = c("blue", "orange"))
legend("topright", legend = group_labels, fill = c("blue", "orange"))

# 6. 오류 막대 포함 막대 그래프
# 데이터 생성
mean_values <- c(5, 10, 15, 20)
error <- c(1, 0.5, 2, 1.5)

# 막대 그래프 생성
barplot(mean_values, names.arg = categories, main = "Barplot with Error Bars",
        xlab = "Category", ylab = "Values", col = "skyblue", ylim = c(0, max(mean_values + error)))

# 오류 막대 추가
arrows(x0 = 1:4, y0 = mean_values - error, y1 = mean_values + error, angle = 90, code = 3, length = 0.1)

# 7. 막대 그래프에 텍스트 레이블 추가
# 기본 막대 그래프 생성
bp <- barplot(counts, names.arg = categories, main = "Barplot with Labels",
              xlab = "Category", ylab = "Frequency", col = "pink")

# 텍스트 레이블 추가
text(bp, counts + 1, labels = counts, cex = 0.8, pos = 3)
