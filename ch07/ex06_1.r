# doMC 및 기타 필요한 패키지 설치 및 로드
install.packages("doMC")
install.packages("foreach")
install.packages("plyr")
library(doMC)
library(foreach)
library(plyr)

# 사용할 프로세스의 수 설정 (예: 4개의 코어 사용)
registerDoMC(cores = 4)

# foreach를 사용한 병렬 작업 예시
result_foreach <- foreach(i = 1:5, .combine = c) %dopar% {
  Sys.sleep(1)  # 병렬 처리 효과를 보기 위한 지연
  i^2
}
print("Result of foreach with %dopar%:")
print(result_foreach)

# plyr의 ddply를 사용한 병렬 작업 예시
data <- data.frame(
  Group = rep(letters[1:2], each = 5),
  Value = rnorm(10)
)
result_plyr <- ddply(data, .(Group), summarise, Mean = mean(Value), .parallel = TRUE)
print("Result of ddply with .parallel = TRUE:")
print(result_plyr)