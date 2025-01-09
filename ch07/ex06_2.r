# 필요한 패키지 설치 및 로드
if (!require("foreach")) install.packages("foreach", dependencies = TRUE)
if (!require("doMC")) install.packages("doMC", dependencies = TRUE)
library(foreach)
library(doMC)

# 사용 가능한 코어 수 설정
numCores <- detectCores() - 1 # 사용 가능한 코어 수 설정 (1개 코어는 예약)
registerDoMC(numCores) # doMC를 사용하여 병렬 처리 설정

# 벡터의 각 요소에 대해 병렬로 계산
cat("--- Foreach Example: Parallel Computation with doMC ---\n")
input_vector <- 1:10
result <- foreach(i = input_vector, .combine = c) %dopar% {
  Sys.sleep(1) # 시뮬레이션을 위한 지연
  i^2 # 각 요소의 제곱을 계산
}
print(result)

# 데이터 프레임을 활용한 예제
cat("\n--- Foreach Example with Data Frame and doMC ---\n")
data <- data.frame(
  ID = 1:5,
  Value = c(10, 20, 30, 40, 50)
)

# 각 행의 Value 열에 대해 병렬로 처리
result_df <- foreach(row = 1:nrow(data), .combine = rbind) %dopar% {
  row_data <- data[row, ]
  # 각 행의 Value에 대해 10을 더하는 작업
  new_value <- row_data$Value + 10
  data.frame(ID = row_data$ID, NewValue = new_value)
}
print(result_df)

# Clean up
stopImplicitCluster() # doMC 클러스터 종료
