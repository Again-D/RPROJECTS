# 데이터 프레임 생성
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Score = c(85, 90, 88, 92, 79),
  Age = c(23, 30, 25, 29, 22),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. with() 사용 예제
# 'with()'를 사용하여 데이터 프레임의 열에 접근
cat("\n--- Accessing Score Column with 'with()' ---\n")
with(data, {
  cat("Scores:\n")
  print(Score)
})

# 3. within() 사용 예제
# 'within()'을 사용하여 데이터 프레임 내의 열을 수정
data_modified <- within(data, {
  # Score를 10% 증가시키기
  Score <- Score * 1.1
  # Age를 그룹화하여 1년 증가시키기
  Age <- Age + 1
})
cat("\n--- Modified Data Frame with 'within()' ---\n")
print(data_modified)

# 4. attach() 및 detach() 사용 예제
# 'attach()'를 사용하여 데이터 프레임의 열을 전역 환경에 추가
attach(data)
cat("\n--- Accessing Variables with 'attach()' ---\n")
cat("Mean Score:\n")
print(mean(Score))  # Score 열의 평균 계산
cat("Mean Age:\n")
print(mean(Age))    # Age 열의 평균 계산

# 'detach()'를 사용하여 데이터 프레임의 열을 전역 환경에서 제거
detach(data)
cat("\n--- Detached Data Frame Variables ---\n")
cat("Mean Score (after detach):\n")
tryCatch(print(mean(Score)), error = function(e) print("Error: Score not found"))
cat("Mean Age (after detach):\n")
tryCatch(print(mean(Age)), error = function(e) print("Error: Age not found"))
