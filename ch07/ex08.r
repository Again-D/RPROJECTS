# 벡터 연산을 수행하는 함수 정의
vector_operations <- function(n) {
  x <- rnorm(n)
  y <- rnorm(n)
  result <- numeric(n)
  
  for (i in 1:n) {
    result[i] <- x[i] + y[i]
  }
  
  return(result)
}

# system.time()을 사용한 코드 성능 측정
cat("--- Using system.time() for Performance Measurement ---\n")
n <- 1e6
execution_time <- system.time({
  result <- vector_operations(n)
})
print(execution_time)

# Rprof()을 사용한 코드 프로파일링
cat("\n--- Using Rprof() for Profiling ---\n")
Rprof("profile_output.out")  # 프로파일링 시작
result <- vector_operations(n)
Rprof(NULL)  # 프로파일링 종료

# 프로파일링 결과 분석
library(profvis)  # profvis 패키지를 사용하여 결과 시각화
profvis({
  Rprof("profile_output.out")
  result <- vector_operations(n)
  Rprof(NULL)
})

# 프로파일링 결과 파일 읽기 및 요약
cat("\n--- Profiling Summary ---\n")
prof_data <- readLines("profile_output.out")
print(head(prof_data, 10))  # 파일의 처음 10줄 출력
