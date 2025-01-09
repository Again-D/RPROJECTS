# foreach 패키지 및 doParallel 패키지 로드
library(foreach)
library(doParallel)

# 병렬 클러스터 생성
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)

# 1부터 5까지의 숫자의 제곱을 계산하는 예시 (순차 실행)
result_seq <- foreach(i = 1:5, .combine = c) %do% {
  Sys.sleep(1)  # 시간 지연
  i^2
}
print("Sequential result:")
print(result_seq)

# 1부터 5까지의 숫자의 제곱을 계산하는 예시 (병렬 실행)
result_par <- foreach(i = 1:5, .combine = c) %dopar% {
  Sys.sleep(1)  # 시간 지연
  i^2
}
print("Parallel result:")
print(result_par)

# 데이터프레임을 만드는 예시
result_df <- foreach(i = 1:5, .combine = rbind) %do% {
  data.frame(ID = i, Square = i^2)
}
print("Data frame result:")
print(result_df)

# 클러스터 종료
stopCluster(cl)