# 데이터 분할 및 합치기
# split(), subset(), merge()

#1. split() - 데이터를 주어진 분리 기주넹 따라서 여러 그룹으로 나누는데 사용됨.
# 일반적으로 데이터 프레임을 특정 변수에 따라 나누거나, 벡터를 기준으로 분할하는데 사용됨

#split(x, f, drop = FALSE, ...)
# x: 분할할 데이터 (벡터, 데이터 프레임 등)
# f: 분할 기준 (벡터, 팩터 등)
# drop: 불필요한 수준을 제거할지 여부
# ...: 추가 인수

# 벡터 기준으로 분할
values <- c(1,2,3,4,5,6)
groups <- factor(c("A","A","B","B","C","C"))

# 기준에 따라 벡터를 분할
split_value <- split(values, groups)
print(split_value)
class(split_value)

# 데이터 프레임의 경우...
df <- data.frame(
  Group = rep(c("A","B","C"), each =2),
  Values = c(10, 20, 30, 40, 50, 60)
)
df
# Group 변수에 따라 데이터 프레임을 분할
split_df <- split(df, df$Group)
print(split_df)

# subset() - 데이터 프레임의 하위 집합을 조건에 따라 추출하는데 사용합니다. 이 함수는 특정 조건을 만족하는 데이터만 선택하여 새로운 데이터 프레임으로 생성됩니다.

# subset(x, subset, select, drop = FALSE, ...)
# x: 데이터 프레임 또는 벡터
# subset: 조건식 (행을 선택하는 조건)
# select: 선택할 열 (열을 선택하는 조건)
# drop: 선택된 열이 하나일 때 벡터로 반환할지 여부
# ...: 추가 인수

# 조건에 맞는 행으로 데이터 프레임 생성
df <- data.frame(
  ID = 1:6,
  Value = c(10, 20, 30, 40, 50, 60)
)
df
# Value 값이 30 이상인 행을 선택
subset_df <- subset(df, Value >= 30)
print(subset_df)

# 조건에 맞는 열을 기준으로 데이터 프레임 생성
df <- data.frame(
  ID = 1:6,
  Value = c(10, 20, 30, 40, 50, 60),
  Category = rep(c("X", "Y"), 3)
)
df
subset_df <- subset(df, Value >= 30 & Category == "X", select = c(ID, Value))
print(subset_df)

# merge() -> 두 데이터 프레임을 공통된 변수(열)를 기준으로 결합
# 데이터 프레임의 조인(Join) 연산을 수행

# merge(x, y, by = NULL, by.x = NULL, by.y = NULL, all = FALSE, all.x = FALSE, all.y = FALSE, sort = TRUE, ...)
# x, y: 결합할 데이터 프레임
# by: 결합 기준이 될 공통 열
# by.x, by.y: 각각 데이터 프레임 x와 y의 결합 기준 열
# all, all.x, all.y: 결합 방식 (전체 결합, 왼쪽 결합, 오른쪽 결합)
# sort: 결합된 결과를 정렬할지 여부

# 기본 결합 (교집합)
df1 <- data.frame(
  ID = 1:3,
  Name = c("Alice", "Bob", "Charlie")
  
)
df2 <- data.frame(
  ID = 2:4,
  Score = c(85, 90, 95)
)

# 결합 기준을 ID
merged_df <- merge(df1, df2, by = "ID")
print(merged_df)

# 왼쪽 결합(left join) - df1 기준
left_merged_df <- merge(df1, df2, by = "ID", all.x = TRUE)
print(left_merged_df)

# 오른쪽 결합(right join) -> df2
right_merged_df <- merge(df1, df2, by = "ID", all.y = TRUE)
print(right_merged_df)

# 전체 결합(all join)
all_merged_df <- merge(df1, df2, by = "ID", all = TRUE)
print(all_merged_df)


# 데이터 프레임 생성
data <- data.frame(
  ID = 1:10,
  Group = rep(c("A", "B"), each = 5),
  Score1 = c(85, 90, 88, 92, 79, 81, 95, 89, 91, 84),
  Score2 = c(78, 85, 87, 91, 80, 75, 90, 88, 84, 83),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. split() 사용 예제
# 'Group' 별로 데이터를 분할
split_data <- split(data, data$Group)
cat("\n--- Data Split by Group (split()) ---\n")
print(split_data)

# 각 그룹별로 분할된 데이터 출력
cat("\n--- Data for Group A ---\n")
print(split_data$A)

cat("\n--- Data for Group B ---\n")
print(split_data$B)

# 3. subset() 사용 예제
# 'Score1'이 85보다 큰 데이터 서브셋 추출
subset_data <- subset(data, Score1 > 85)
cat("\n--- Subset with Score1 > 85 (subset()) ---\n")
print(subset_data)

# 4. 데이터 프레임 생성 (병합 예제)
data2 <- data.frame(
  ID = c(6, 7, 8, 9, 10),
  Group = c("B", "B", "A", "A", "B"),
  Additional_Score = c(100, 95, 89, 90, 80),
  stringsAsFactors = FALSE
)

# 5. merge() 사용 예제
# 'data'와 'data2'를 'ID'와 'Group'으로 병합
merged_data <- merge(data, data2, by = c("ID", "Group"), all = TRUE)
cat("\n--- Merged Data (merge()) ---\n")
print(merged_data)

# 6. 병합된 데이터의 NA 값 처리 (옵션)
# NA 값을 0으로 변경
merged_data[is.na(merged_data)] <- 0
cat("\n--- Merged Data with NA values replaced by 0 ---\n")
print(merged_data)

# 데이터 프레임의 데이터 관리 및 접근
# with(), within(), attach(), detach()
# with() - 주어진 데이터 프레임 내에서 식을 평가할 때, 데이터 프레임의 열을 직접 참조할 수 있게 해줍니다. 데이터 프레임의 열에 대한 참조를 간단하게 할 수 있도록 도와줍니다.

# with(data, expr, ...)
# data: 데이터 프레임
# expr: 평가할 식 (expression)
# ...: 추가 인수

df <- data.frame(
  x = 1:5,
  y = c(5, 4, 3, 2, 1)
)
df
# with()를 사용하여 데이터 프레임의 열을 참조하여 계산
result <- with(df, x + y)
print(result)

# within() - 주어진 데이터 프레임 내에서 여러 변수를 수정하거나 새로운 변수를 추가할 때 사용됩니다.
# 데이터 프레임을 수정한 후, 수정된 데이터 프레임을 반환합니다.

# within(data, expr, ...)
# data: 데이터 프레임
# expr: 평가할 식 (expression)
# ...: 추가 인수

df <- data.frame(
  x = 1:5,
  y = c(5, 4, 3, 2, 1)
)

# within()을 사용하여, 새로운 열을 추가하고, 기존 열을 수정
df_new <- within(df, {
  z <- x * y
  x <- x + 10
})
print(df_new)


# attach() - 데이터 프레임을 검색할 때, 데이터 프레임의 열을 직접 참조할 수 있도록 환경을 설정합니다
# attach()를 사용하면 데이터 프레임의 열에 대한 이름을 직접 사용할 수 있습니다. 단,  데이터의 원래 위치가 혼동될 수 있으므로, 사용 후 detach()로 원상복구하는 것이 좋습니다.

# attach(data)
# data: 데이터 프레임

df <- data.frame(
  o = 1:5,
  p = c(5,4,3,2,1)
)

# attach()를 사용해서 열을 직접 참조
# attach() 동작시에 기존에 사용된 변수가 있는 경우에
# The following objects are masked _by_ .GlobalEnv:
#
# x, y
# 와 같이 나옴. 그럼 attach() 의도대로 동작 안함..
# 다른이름으로 변수 변경 해야함
attach(df)
# 직접 참조..
print(o)
print(p)

result <- o + p
print(result)

# detach(data, ...)
# data: 데이터 프레임
# ...: 추가 인수

# 작업 완료후 detach()를 통해 데이터 프레임 환경에서 분리
detach(df)
print(o) # 객체 못찾음
print(p) # 객체 못찾음

# 데이터 프레임 데이터 관리 및 접근 실습
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
# tryCatch() 예외 처리 함수...
tryCatch(print(mean(Score)), error = function(e) print("Error: Score not found"))
cat("Mean Age (after detach):\n")
tryCatch(print(mean(Age)), error = function(e) print("Error: Age not found"))

# 데이터 프레임의 데이터 검색
# which(), which.max(), which.min()
# 특정 조건을 만족하는 인덱스나 최댓값, 최솟값을 찾는 데 사용

# which() - 조건을 만족하는 값의 인덱스를 반환. 논리 벡터를 받아서 TRUE인 위치의 인덱스를 받환

# which(x, arr.ind = FALSE, useNames = TRUE)
# x: 논리 벡터 또는 조건을 만족하는 벡터
# arr.ind: 다차원 배열에서 인덱스를 반환할지 여부 (기본값: FALSE)
# useNames: 결과에 이름을 사용할지 여부 (기본값: TRUE)

vec <- c(10, 20, 30, 40, 50)

# 값이 30 이상인 인덱스 찾기
indexes <- which(vec >= 30)
print(indexes)

logical_vec <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
true_indexes <- which(logical_vec)
print(true_indexes)
df
df[true_indexes,]
df[which(logical_vec),]

# which.max() -> 주어진베거트이 최대값 인덱스 반환
# 벡터에서  최대 값이 여러개 있는 경우, 첫번째 최대값 인덱스 반환
# which.max(x)
# x: 벡터

# 벡터 생성
vec <- c(10, 20, 30, 40, 50)

# 최댓값의 인덱스 찾기
max_index <- which.max(vec)
print(max_index)

# which.min() -> 주어진 벡터에서 최솟값의 인덱스를 반환합니다
# 여러 개 있을 경우, 첫 번째 최솟값의 인덱스를 반환합니다.

vec <- c(50 ,40, 20, 10, 30)
# 최소값  인덱스
min_index <- which.min(vec)
print(min_index)

#===================== 실습 ==============================================
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
# Score가 80보다 크고 Age가 30보다 작은 행의 인덱스 찾기
indices_custom_condition <- which(data$Score > 80 & data$Age < 30)
cat("\n--- Indices with Score > 80 and Age < 30 (which()) ---\n")
print(indices_custom_condition)

# 해당 인덱스의 데이터 출력
cat("\n--- Data for Score > 80 and Age < 30 ---\n")
print(data[indices_custom_condition, ])

# 데이터 프레임의 연산
# aggregate() 함수 -> 에서 데이터 프레임의 그룹별 요약 통계량을 계산할 때 유용합니다. 데이터 프레임의 특정 변수들에 대해 그룹화하여 합계, 평균, 최대값 등 다양한 요약 통계량을 계산할 수 있음.

# aggregate(x, by, FUN, ..., simplify = TRUE)
# x: 요약할 데이터 (벡터, 데이터 프레임 등)
# by: 그룹화할 변수 (리스트 형태로 입력)
# FUN: 적용할 함수 (예: mean, sum, max 등)
# ...: 추가 인수
# simplify: 반환값을 단순화할지 여부 (기본값: TRUE)

# 기본 사용법
df <- data.frame(
  group = rep(c("A","B","C"),  4),
  value = c(10, 20, 15, 25, 30, 35, 40, 45, 50, 55, 60,65)
)
df
# 그룹별 평균 계산
result_mean <- aggregate(value ~ group, data = df, FUN = mean)
print(result_mean)

# 여러 변수와 여러 함수 적용
df <- data.frame(
  group = rep(c("A","B","C"),4),
  value1 = c(10, 20, 15, 25, 30, 35, 40, 45, 50, 55, 60, 65),
  value2 = c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
)
df
print(cbind(df$value1, df$value2))
# 그룹별 평균과 합계 계산
result_agg <- aggregate(cbind(value1, value2) ~ group,
                        data = df, FUN = function(x) c(mean=mean(x), sum = sum(x)))
print (result_agg)

# 다양한 통게량 계산 연습
df <- data.frame(
  group = rep(c("A", "B"),6),
  age = c(21, 22, 23, 24, 25, 26, 27, 29, 30, 35, 37, 45),
  height = c(150, 160, 170, 175, 180, 190, 168, 170, 175, 168, 182, 159)
)
df
# 그룹별 최소값, 최대값 및 평균 계산
result_stats <- aggregate(cbind(age, height) ~ group, data=df,
          FUN = function(x) c(min = min(x), max = max(x), mean = mean(x)))
print(result_agg)

# 데이터 프레임의 연산 실습
# 데이터 프레임 생성
data <- data.frame(
  ID = 1:10,
  Name = c("John", "Jane", "Doe", "Alice", "Bob", "Carol", "David", "Eva", "Frank", "Grace"),
  Score = c(85, 90, 78, 88, 92, 79, 95, 87, 84, 91),
  Age = c(23, 30, 25, 29, 22, 31, 28, 24, 27, 26),
  Group = c("A", "A", "B", "B", "A", "B", "A", "B", "A", "B"),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("--- Original Data Frame ---\n")
print(data)

# 2. aggregate() 함수 기본 사용 예제
# Group별로 Score의 평균을 계산
aggregate_score <- aggregate(Score ~ Group, data = data, FUN = mean)
cat("\n--- Average Score by Group (aggregate()) ---\n")
print(aggregate_score)

# 3. aggregate() 함수와 여러 변수 사용 예제
# Group별로 Score의 평균과 Age의 평균을 계산
aggregate_score_age <- aggregate(cbind(Score, Age) ~ Group, data = data, FUN = mean)
cat("\n--- Average Score and Age by Group (aggregate()) ---\n")
print(aggregate_score_age)

# 4. aggregate() 함수와 사용자 정의 함수 사용 예제
# Group별로 Score의 합계를 계산
aggregate_score_sum <- aggregate(Score ~ Group, data = data, FUN = sum)
cat("\n--- Total Score by Group (aggregate()) ---\n")
print(aggregate_score_sum)

# Group별로 Score의 중앙값을 계산
aggregate_score_median <- aggregate(Score ~ Group, data = data, FUN = median)
cat("\n--- Median Score by Group (aggregate()) ---\n")
print(aggregate_score_median)

# 5. 더 복잡한 집계 예제
# Group별로 Score의 평균과 Age의 최대값을 계산
aggregate_complex <- aggregate(cbind(Score = Score, MaxAge = Age) ~ Group, data = data, FUN = function(x) c(mean = mean(x), max = max(x)))
cat("\n--- Average Score and Max Age by Group (complex aggregation) ---\n")
print(aggregate_complex)

# 6. 결과 데이터 프레임의 열 이름을 정리
# 'aggregate_complex'에서 결과를 데이터 프레임으로 변환하고 열 이름을 정리
aggregate_complex_df <- data.frame(
  Group = aggregate_complex$Group,
  AvgScore = aggregate_complex$Score[, "mean"],
  MaxAge = aggregate_complex$MaxAge
)
cat("\n--- Cleaned Data Frame with Average Score and Max Age ---\n")
print(aggregate_complex_df)

# 데이터 프레임의 순차 자료 구조화
# stack(), unstack()

# stack() -  데이터 프레임의 여러 열을 단일 열로 변환하고, 원래 열의 이름을 새로운 열로 추가하여 긴 형식의 데이터로 변환

# stack(x, select = NULL, ...)
# x: 데이터 프레임
# select: 변환할 열을 선택하는 정수형 벡터 또는 열 이름 벡터 (기본값: NULL은 모든 열)
# ...: 추가 인수

df <- data.frame(
  A = c(1, 2, 3),
  B = c(4, 5, 6),
  C = c(7, 8, 9)
)
df
# stack()을  사용하여 데이터를 긴 형식으로 변환
stacked_df <- stack(df)
print(stacked_df)
# 원래 A, B, C 열을 하나의 values 열로 변환하고, 열의 이름은 ind열로 변환.

# 특정 열 선택후 스택
stacked_df <- stack(df, select = c(A,B))
print(stacked_df)

# unstack() - stack() 함수로 변환된 긴 형식의 데이터를 원래의 형태로 되돌리는 데 사용

# unstack(x, ...)
# x: 긴 형식의 데이터 프레임
# ...: 추가 인수
?stack
?rep
stacked_df <- data.frame(
  values = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  ind = rep(c("A","B","C"), each = 3)
)
stacked_df
unstack_df <- unstack(stacked_df)
print(unstack_df)

# 데이터 프레임의 순차 자료 구조화 실습
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
data_wide_reconstructed <- unstack(data_long, Value ~ Treatment)
ID <- c(1,2,3,4)
data_wide_reconstructed <- cbind(data_wide_reconstructed, ID)
data_wide_reconstructed <- as.data.frame(data_wide_reconstructed)


cat("\n--- Reconstructed Wide Data Frame with unstack() ---\n")
print(data_wide_reconstructed)

# 4. unstack()와 stack()을 결합한 예제
# ID와 Treatment를 기준으로 데이터를 그룹화하고 평균을 계산
library(dplyr)

# 데이터 프레임을 long format으로 변환
data_long %>%  group_by(Treatment) %>% summarize(Average_Value = mean(Value))
?summarize

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

