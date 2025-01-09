# 필요한 패키지 설치 및 로드
if (!require("reshape2")) install.packages("reshape2", dependencies = TRUE)
library(reshape2)

# 예제 데이터 프레임 생성
data_wide <- data.frame(
  ID = 1:4,
  Name = c("John", "Jane", "Alice", "Bob"),
  Math = c(90, 85, 78, 88),
  Science = c(92, 88, 79, 85),
  English = c(87, 90, 80, 82)
)

# 1. 데이터 긴 형식으로 변환 (melt)
cat("--- Melt Example: Convert Wide Format to Long Format ---\n")
data_long <- melt(data_wide, id.vars = c("ID", "Name"), variable.name = "Subject", value.name = "Score")
print(data_long)

# 2. 데이터 넓은 형식으로 변환 (dcast)
cat("\n--- Dcast Example: Convert Long Format Back to Wide Format ---\n")
data_wide_reconstructed <- dcast(data_long, ID + Name ~ Subject, value.var = "Score")
print(data_wide_reconstructed)

# 3. 다중 변수 집계 및 평균 계산
cat("\n--- Dcast Example: Average Scores by Subject ---\n")
average_scores <- dcast(data_long, Subject ~ ., value.var = "Score", fun.aggregate = mean)
print(average_scores)

# 4. 복합적인 변형: 학생별 과목 점수의 평균
cat("\n--- Aggregate Example: Average Scores per Student ---\n")
data_avg_per_student <- dcast(data_long, ID + Name ~ Subject, value.var = "Score", fun.aggregate = mean)
print(data_avg_per_student)

# 5. 변수 추가 및 데이터 변형
cat("\n--- Data Transformation: Add Total Score for Each Student ---\n")
data_avg_per_student$Total_Score <- rowSums(data_avg_per_student[, -c(1, 2)], na.rm = TRUE)
print(data_avg_per_student)

# Clean up
rm(data_wide, data_long, data_wide_reconstructed, average_scores, data_avg_per_student)
