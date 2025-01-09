# 데이터 프레임 생성
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Score1 = c(85, 90, 88, 92, 79),
  Score2 = c(78, 85, 87, 91, 80),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. apply() 사용 예제
# 행 별로 평균 계산
row_means <- apply(data[, 3:4], 1, mean)
cat("\n--- Row Means (apply()) ---\n")
print(row_means)

# 3. lapply() 사용 예제
# 각 열의 평균 계산
column_means <- lapply(data[, 3:4], mean)
cat("\n--- Column Means (lapply()) ---\n")
print(column_means)

# 4. tapply() 사용 예제
# Score1에 대한 평균 Score2 계산 (ID에 따라 그룹화)
tapply_result <- tapply(data$Score2, data$ID, mean)
cat("\n--- tapply() Result ---\n")
print(tapply_result)

# 5. mapply() 사용 예제
# Score1과 Score2의 합계 계산
sum_scores <- mapply(sum, data$Score1, data$Score2)
cat("\n--- Sum of Scores (mapply()) ---\n")
print(sum_scores)

# 데이터 변형: Score1의 10% 증가
data$Score1 <- data$Score1 * 1.1

# 데이터 변형: Name의 길이 추가 열로 추가
data$Name_Length <- nchar(data$Name)

# 데이터 변형: Score2의 5점 추가
data$Score2 <- data$Score2 + 5

# 6. 변형된 데이터 프레임 출력
cat("\n--- Modified Data Frame ---\n")
print(data)
