# 필요한 패키지 설치 및 로드
if (!requireNamespace("doBy", quietly = TRUE)) {
  install.packages("doBy")
}
library(doBy)

# 데이터 프레임 생성
data <- data.frame(
  Group = rep(c("A", "B", "C"), each = 5),
  Score1 = c(85, 90, 88, 92, 79, 81, 95, 89, 91, 84, 78, 82, 87, 93, 88),
  Score2 = c(78, 85, 87, 91, 80, 75, 90, 88, 84, 83, 77, 79, 85, 91, 82),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. summaryBy() 사용 예제
# 그룹별 Score1과 Score2의 평균 및 표준편차 계산
summary_result <- summaryBy(Score1 + Score2 ~ Group, data = data, 
                            FUN = c(mean, sd))
cat("\n--- Summary by Group (summaryBy()) ---\n")
print(summary_result)

# 3. orderBy() 사용 예제
# Score1의 내림차순 정렬
ordered_data <- orderBy(~ -Score1, data)
cat("\n--- Data Ordered by Score1 Descending (orderBy()) ---\n")
print(ordered_data)

# 4. splitBy() 사용 예제
# Group별 데이터 분할
split_data <- splitBy(Group ~ ., data)
cat("\n--- Split Data by Group (splitBy()) ---\n")
print(split_data)

# 각 그룹별로 분할된 데이터 출력
cat("\n--- Data for Group A ---\n")
print(split_data$A)

cat("\n--- Data for Group B ---\n")
print(split_data$B)

cat("\n--- Data for Group C ---\n")
print(split_data$C)
