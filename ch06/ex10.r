# 데이터 프레임 생성
data <- data.frame(
  ID = 1:10,
  Name = c("John", "Jane", "Doe", "Alice", "Bob", "Carol", "David", "Eva", "Frank", "Grace"),
  Score = c(85, 90, 78, 88, 92, 79, 95, 87, 84, 91),
  Age = c(23, 30, 25, 29, 22, 31, 28, 24, 27, 26),
  Group = c("A", "A", "B", "B", "A", "B", "A", "B", "A", "B"),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. aggregate() 함수 기본 사용 예제
# Group별로 Score의 평균을 계산
aggregate_score <- aggregate(Score ~ Group, data = data, FUN = mean)
cat("\n--- Average Score by Group (aggregate()) ---\n")
print(aggregate_score)

# 3. aggregate() 함수와 여러 변수 사용 예제
# Group별로 Score의 평균과 Age의 평균을 계산
aggregate_score_age <- aggregate(cbind(Score, Age) ~ Group, data = data, FUN = mean)
cat("\n--- Average Score and Age by Group (aggregate()) ---\n")
print(aggregate_score_age)

# 4. aggregate() 함수와 사용자 정의 함수 사용 예제
# Group별로 Score의 합계를 계산
aggregate_score_sum <- aggregate(Score ~ Group, data = data, FUN = sum)
cat("\n--- Total Score by Group (aggregate()) ---\n")
print(aggregate_score_sum)

# Group별로 Score의 중앙값을 계산
aggregate_score_median <- aggregate(Score ~ Group, data = data, FUN = median)
cat("\n--- Median Score by Group (aggregate()) ---\n")
print(aggregate_score_median)

# 5. 더 복잡한 집계 예제
# Group별로 Score의 평균과 Age의 최대값을 계산
aggregate_complex <- aggregate(cbind(Score = Score, MaxAge = Age) ~ Group, data = data, FUN = function(x) c(mean = mean(x), max = max(x)))
cat("\n--- Average Score and Max Age by Group (complex aggregation) ---\n")
print(aggregate_complex)

# 6. 결과 데이터 프레임의 열 이름을 정리
# 'aggregate_complex'에서 결과를 데이터 프레임으로 변환하고 열 이름을 정리
aggregate_complex_df <- data.frame(
  Group = aggregate_complex$Group,
  AvgScore = aggregate_complex$Score[, "mean"],
  MaxAge = aggregate_complex$MaxAge
)
cat("\n--- Cleaned Data Frame with Average Score and Max Age ---\n")
print(aggregate_complex_df)
