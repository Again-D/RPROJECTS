# 데이터 프레임 생성
data_wide <- data.frame(
  ID = 1:4,
  Treatment1 = c(5, 6, 7, 8),
  Treatment2 = c(9, 10, 11, 12),
  Treatment3 = c(13, 14, 15, 16)
)

# 1. 데이터 프레임 출력
cat("--- Original Wide Data Frame ---\n")
print(data_wide)

# 2. stack() 사용 예제
# wide format 데이터를 long format으로 변환
data_long <- stack(data_wide[ , -1])  # ID 열 제외하고 stack 적용
data_long$ID <- rep(data_wide$ID, times = ncol(data_wide) - 1)  # ID 열 추가
colnames(data_long) <- c("Value", "Treatment", "ID")

cat("\n--- Long Data Frame with stack() ---\n")
print(data_long)

# 3. unstack() 사용 예제
# long format 데이터를 wide format으로 변환
data_wide_reconstructed <- unstack(data_long, Value ~ Treatment + ID)
data_wide_reconstructed <- as.data.frame(data_wide_reconstructed)

cat("\n--- Reconstructed Wide Data Frame with unstack() ---\n")
print(data_wide_reconstructed)

# 4. unstack()와 stack()을 결합한 예제
# ID와 Treatment를 기준으로 데이터를 그룹화하고 평균을 계산
library(dplyr)

# 데이터 프레임을 long format으로 변환
data_long_grouped <- data_long %>%
  group_by(Treatment) %>%
  summarize(Average_Value = mean(Value))

cat("\n--- Average Values by Treatment with dplyr ---\n")
print(data_long_grouped)

# Long format 데이터로 변환 후 다시 wide format으로 변환하여 평균 값 표시
data_long_with_avg <- data_long %>%
  group_by(Treatment, ID) %>%
  summarize(Average_Value = mean(Value))

# unstack을 사용하여 평균 값 표시
data_wide_avg_reconstructed <- unstack(data_long_with_avg, Average_Value ~ Treatment)
data_wide_avg_reconstructed <- as.data.frame(data_wide_avg_reconstructed)

cat("\n--- Wide Data Frame with Average Values by Treatment ---\n")
print(data_wide_avg_reconstructed)
