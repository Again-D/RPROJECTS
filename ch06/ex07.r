# 데이터 벡터 생성
numeric_vector <- c(23, 5, 87, 14, 56, 29, 44)

# 1. sort() 사용 예제
# 오름차순 정렬
sorted_vector_asc <- sort(numeric_vector)
cat("--- Sorted Vector (Ascending) ---\n")
print(sorted_vector_asc)

# 내림차순 정렬
sorted_vector_desc <- sort(numeric_vector, decreasing = TRUE)
cat("\n--- Sorted Vector (Descending) ---\n")
print(sorted_vector_desc)

# 데이터 프레임 생성
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Score = c(85, 90, 88, 92, 79),
  stringsAsFactors = FALSE
)

# 2. order() 사용 예제
# Score 열을 기준으로 오름차순 정렬
ordered_data_asc <- data[order(data$Score), ]
cat("\n--- Data Ordered by Score (Ascending) ---\n")
print(ordered_data_asc)

# Score 열을 기준으로 내림차순 정렬
ordered_data_desc <- data[order(data$Score, decreasing = TRUE), ]
cat("\n--- Data Ordered by Score (Descending) ---\n")
print(ordered_data_desc)

# 3. 여러 열을 기준으로 정렬
# 먼저 Name을 기준으로 오름차순, 그 다음 Score를 기준으로 내림차순 정렬
ordered_data_multi <- data[order(data$Name, -data$Score), ]
cat("\n--- Data Ordered by Name (Ascending) and Score (Descending) ---\n")
print(ordered_data_multi)

# 4. 정렬된 데이터로 특정 값 찾기
# 가장 높은 Score 찾기
max_score <- data$Score[which.max(data$Score)]
cat("\n--- Maximum Score ---\n")
print(max_score)

# 가장 낮은 Score 찾기
min_score <- data$Score[which.min(data$Score)]
cat("\n--- Minimum Score ---\n")
print(min_score)
