# 데이터 프레임 생성
data <- data.frame(
  ID = 1:10,
  Name = c("John", "Jane", "Doe", "Alice", "Bob", "Carol", "David", "Eva", "Frank", "Grace"),
  Score = c(85, 90, 78, 88, 92, 79, 95, 87, 84, 91),
  Age = c(23, 30, 25, 29, 22, 31, 28, 24, 27, 26),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. which() 사용 예제
# Score가 90보다 큰 행의 인덱스 찾기
indices_greater_than_90 <- which(data$Score > 90)
cat("\n--- Indices with Score > 90 (which()) ---\n")
print(indices_greater_than_90)

# 해당 인덱스의 데이터 출력
cat("\n--- Data for Scores > 90 ---\n")
print(data[indices_greater_than_90, ])

# 3. which.max() 사용 예제
# Score에서 최대값의 인덱스 찾기
max_score_index <- which.max(data$Score)
cat("\n--- Index of Maximum Score (which.max()) ---\n")
print(max_score_index)

# 최대값을 가진 행의 데이터 출력
cat("\n--- Data with Maximum Score ---\n")
print(data[max_score_index, ])

# 4. which.min() 사용 예제
# Score에서 최소값의 인덱스 찾기
min_score_index <- which.min(data$Score)
cat("\n--- Index of Minimum Score (which.min()) ---\n")
print(min_score_index)

# 최소값을 가진 행의 데이터 출력
cat("\n--- Data with Minimum Score ---\n")
print(data[min_score_index, ])

# 5. 여러 조건을 사용하는 which() 예제
# Score가 80보다 크고 Age가 25보다 작은 행의 인덱스 찾기
indices_custom_condition <- which(data$Score > 80 & data$Age < 30)
cat("\n--- Indices with Score > 80 and Age < 30 (which()) ---\n")
print(indices_custom_condition)

# 해당 인덱스의 데이터 출력
cat("\n--- Data for Score > 80 and Age < 30 ---\n")
print(data[indices_custom_condition, ])
