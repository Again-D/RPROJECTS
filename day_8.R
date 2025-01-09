# 외부 패키지를 이용한 파일 입출력
# -> 외부 패키지 설치 여부 확인 후 미 설치시 설치 진행
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("writexl", quietly = TRUE)) {
  install.packages("writexl")
}
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}
if (!requireNamespace("h5", quietly = TRUE)) {
  install.packages("h5")
}

# -> 패키지 로딩
library(readr)
library(readxl)
library(writexl)
library(jsonlite)

# 테스트 파일 이름 지정
# TXT 파일 이름
txt_file <- "example.txt"

# TXT 파일에 데이터 쓰기(기본 패키지를 이용한 파일 쓰기)
writeLines(c("Line 1", "Line 2", "Line3"), txt_file)

# TXT 파일 읽기
txt_data <- readLines(txt_file)
txt_data
cat("\n---- TXT File contents ----\n")
print(txt_data)

#2. CSV 파일 처리
csv_file <- "example.csv"
# CSV 파일에 데이터 쓰기
write_csv(data.frame(Name=c("John", "Jane"), Age=c(30, 20)), csv_file)
# CSV 파일 읽기
csv_data <- read_csv(csv_file)
cat("\n---- CSV File contents ----\n")
print(csv_data)

#3. xlsx 파일 처리
xlsx_file <- "example.xlsx"
# XLSX 파일에 데이터 쓰기
write_xlsx(data.frame(Name=c("Alice","Bob"), Score=c(90,90)), xlsx_file)
# XLSX 파일 읽기
xlsx_data <- read_xlsx(xlsx_file)
cat("\n---- XLSX File contents ----\n")
print(xlsx_data)

#4. JSON 파일처리
json_file <- "example.json"
# JSON 파일에 데이터 쓰기
json_data <- toJSON(list(Name="Charlie", Age=35))
write(json_data, json_file)
# JSON 파일 읽기
json_read_data <- fromJSON(json_file)
cat("\n---- JSON File contents ----\n")
print(json_read_data)

#============================================================================
# 파일 내용 통합
# R에서 rbind(), cbind() 함수는 데이터 프레임이나 행렬을 결합하는데 사용. 이 두 함수는 각각 행 방향과 열 방향으로 데이터를 결합.

# rbind(..., deparse.level = 1)
# ...: 결합할 데이터 프레임, 행렬, 벡터 등
# deparse.level: 객체 이름을 행 이름으로 사용할지 여부를 제어하는 옵션

# 테스트를 위한 데이터 프레임
df1 <- data.frame(ID=1:2, Name=c("Alice", "Bob"))
df2 <- data.frame(ID=3:4, Name=c("Charlie", "David"))

# 데이터 프레임을 행 방향으로 결합
combined_df <- rbind(df1, df2, deparse.level = 1)
print(combined_df)

# 두개의 행렬
mat1 <- matrix(1:6, nrow =2, byrow = TRUE)
mat2 <- matrix(7:12, nrow = 2, byrow = TRUE)
combined_mat <- rbind(mat1, mat2)
print(combined_mat)

# 두개의 벡터
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
combined_vec <- rbind(vec1, vec2, deparse.level = 1)
print(combined_vec)


# cbind(..., deparse.level = 1)
# ...: 결합할 데이터 프레임, 행렬, 벡터 등
# deparse.level : 객체 이름을 열 이름으로 사용할지 여부를 제어하는 옵션

# 두 개의 데이터 프레임
df1 <- data.frame(ID=1:2, Name=c("Alice", "Bob"))
df2 <- data.frame(Age=c(30, 25), City=c("New York", "Los Angels"))
combined_df <- cbind(df1, df2)
print(combined_df)

# 두 개의 벡터
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
combined_vec <- cbind(vec1, vec2, deparse.level = 1)
print(combined_vec)

# 파일 읽기
csv_file <- "example.csv"
xlsx_file <- "example.xlsx"

csv_data <- read_csv(csv_file)
csv_data
xlsx_data <- read_xlsx(xlsx_file)
xlsx_data

col_bind <- cbind(csv_data, xlsx_data)
print(col_bind)

#------------------------------------------------------------------------------
# 데이터 프레임화 및 데이터 변형
# apply(), lapply(), sapply(), tapply(), mapply()
# 데이터 처리를 위해 사용되는 함수들로, 각기 다른 데이터 구조와 요구 사항에 맞춰 데이터를 변경하거나 집계하는데 유용합니다.

# apply(X, MARGIN, FUN, ...)
# apply() 함수는 행렬 또는 배열의 행 또는 열에 함수를 적용할 때 사용됩니다. 데이터의 특정 차원에 함수를 적용하여 결과를 얻습니다.
# X : 행렬 또는 배열
# MARGIN : 함수를 적용할 차원 (1 = 행, 2 = 열)
# FUN : 적용할 함수
# ... : 함수에 추가로 전달할 인수

# 행렬 생성
mat <- matrix(1:9, nrow = 3)
print(mat)

# 각 행의 합을 계산 
row_sums <- apply(mat, 1, sum)
print(row_sums)

# 각 열의 평균 계산 
col_means <- apply(mat, 2, mean)
print(col_means)


# lapply(X, FUN, ...)
# lapply() 함수는 리스트나 벡터의 각 요소에 함수를 적용하고, 결과를 리스트로 반환합니다
# X : 리스트 또는 벡터
# FUN : 적용할 함수
# ... : 함수에 추가로 전달할 인수

# 리스트 생성
my_list <- list(a=1:5, b=6:10, c=11:15)
# 각 리스트 요소의 평균 계산
list_means <- lapply(my_list, mean)
print(list_means)


# sapply(X, FUN, ...)
# sapply() 함수는 lapply()와 유사하지만, 결과를 가능한 경우 벡터 또는 행렬로 반환합니다. 결과를 벡터나 행렬로 간단하게 변환할 수 있습니다.
# X : 리스트 또는 벡터
# FUN : 적용할 함수
# ... : 함수에 추가로 전달할 인수

my_list <- list(a=1:5, b=6:10, c=11:15)
# 각 리스트 요소의 평균 계산
list_means <- sapply(my_list, mean)
class(list_means)
print(list_means)

# tapply(X, INDEX, FUN, ...)
# tapply() 함수는 벡터와 함께 그룹화 변수를 사용하여 데이터를 집계합니다. 그룹별로 함수를 적용하고 결과를 반환합니다.
# X : 집계할 데이터 벡터
# INDEX : 그룹화 변수 (리스트, 팩터 등)
# FUN : 적용할 함수
# ... : 함수에 추가로 전달할 인수

# 데이터 생성
values <- c(10, 20, 30, 40, 50, 60)
groups <- factor(c("A", "B", "A", "B", "A", "B"))

# 그룹별 평균 계산
group_means <- tapply(values, groups, mean)
print(group_means)


# mapply(FUN, ..., MoreArgs = NULL)
# mapply() 함수는 여러 리스트나 벡터를 동시에 처리하며, 각 요소에 함수를 적용합니다. apply() 함수의 멀티-버전으로 생각할 수 있습니다.
# FUN: 적용할 함수
# ...: 함수의 인수로 사용할 벡터 또는 리스트
# MoreArgs: 함수에 추가로 전달할 인수

# 벡터 생성
vec1 <- 1:4
vec2 <- 5:8

# 각 요소의 합을 계산
result <- mapply(sum, vec1, vec2)
print(result)

# 리스트 생성
list1 <- list(a = 10, b = 20)
list2 <- list(a = 30, b = 40)
list_result <- mapply(sum, list1, list2)
print(list_result)

#===============================================================================
# 데이터 프레임화 및 변형 실습

# 데이터 프레임 생성
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Score1 = c(85, 90, 88, 92, 79),
  Score2 = c(78, 85, 87, 91, 80),
  stringsAsFactors = FALSE
)

# 1. 데이터 프레임 출력
cat("\n ---- Original Data Frame ---- \n")
print(data)

# 2. apply() 사용 예제
# 행 별로 평균 계산
data[,c("Score1", "Score2")]
data[,c(3,4)]
row_means <- apply(data[,c(3,4)], 1, mean)
cat("\n ---- Row Means (apply()) ---- \n")
print(row_means)
# 데이터 프레임에 변형... column 추가
# means <- row_means
# cbind(data, means)
# 적용X

# 3. lapply() 열 평균
column_means <- lapply(data[,3:4], mean)
cat("\n ---- Column Means (lapply()) ---- \n")
print(column_means)

# 4. tapply()
tapply_result <- tapply(data$Score2, data$ID, mean)
print(tapply_result)

# 5. mapply()
# Score1, Score2의 합계
sum_scores <- mapply(sum, data$Score1, data$Score2)
print(sum_scores)

# 데이터 변형... : Score1의 값을 10% 증가
data$Score1 <- data$Score1 * 1.1
data$Score1

# 데이터 변형 : Name의 길이 추가 -> 열로 추가
data$Name_Length <- nchar(data$Name)
data$Name_Length
data
# 데이터 변형 : Score2의 모든 값에 +5 처리
data$Score2 <- data$Score2 + 5
data

#==============================================================================
# doBy 패키지
# R에서 데이터 프레임을 그룹화하고 집계하는 데 유용한 다양한 함수들을 제공합니다.
# summaryBy(), orderBy(), splitBy(), sampleBy()

if(!requireNamespace("doBy")) {
  install.packages("doBy")
}

library(doBy)
# summaryBy(formula, data, FUN, ...)
#  데이터 프레임의 그룹별 요약 통계량을 계산하는 데 사용됩니다. 이 함수는 데이터를 그룹화하고, 각 그룹에 대해 요약 통계량을 계산합니다.
# formula: 그룹화 변수와 요약할 통계량을 지정하는 공식 (~ 기호 사용)
# data: 데이터 프레임
# FUN: 적용할 함수 (예: mean, sum, sd 등)
# ...: 추가 인수

# 데이터 프레임 생성
data <- data.frame(
  Group = rep(c("A", "B"), each = 5),
  Value1 = c(10, 20, 30, 40, 50, 15, 25, 35, 45, 55),
  Value2 = c(5, 10, 15, 20, 25, 7, 12, 17, 22, 27)
)

# 그룹별 Value1과 Value2의 평균 계산
result <- summaryBy(Value1 + Value2 ~ Group, data = data, FUN = mean)
print(result)

# orderBy(order, data, ...)
# 데이터 프레임을 하나 이상의 변수에 따라 정렬하는 데 사용됩니다. 여러 열을 기준으로 오름차순 또는 내림차순 정렬할 수 있습니다.
# order: 정렬 기준을 지정하는 공식 (~ 기호 사용)
# data: 데이터 프레임
# ...: 추가 인수

data <- data.frame(
  ID = c(3, 1, 4, 5, 2),
  Score = c(90, 85, 95, 70, 80)
)
# Score를 기준으로 내림차순 정렬
sorted_data <- orderBy(~ Score, data = data)
print(sorted_data)
sorted_data <- orderBy(~ -Score, data = data)
print(sorted_data)
sorted_data <- orderBy(~ ID, data = data)
print(sorted_data)

# splitBy(formula, data, drop = FALSE)
# 데이터 프레임을 그룹화 변수에 따라 분할합니다. 이 함수는 데이터 프레임을 여러 개의 데이터 프레임 리스트로 나누어 반환합니다.
# formula: 그룹화 변수 (~ 기호 사용)
# data: 데이터 프레임
# drop: 빈 그룹을 제거할지 여부 (기본값: FALSE)

data <- data.frame(
  Group = rep(c("A", "B"),each = 5),
  Value = c(10, 20, 30, 40, 50, 15, 25, 35, 45, 55)
)
# Group 변수에 따라 데이터 프레임을 분할
split_data <- splitBy(d~Group, data = data)
split_data <- split_by(data, Group ~ ., drop = FALSE)
split_data <- splitBy(~ Group, data = data, drop = FALSE)
print(split_data)
class(split_data)
class(split_data$A)
class(split_data$B)


# sampleBy(formula, data, frac = NULL, size = NULL, ...)
# 데이터 프레임을 그룹별로 샘플링하는 데 사용됩니다. 그룹별로 샘플을 추출하여 데이터 프레임의 하위 집합을 생성합니다.
# formula: 그룹화 변수 (~ 기호 사용)
# data: 데이터 프레임
# frac: 각 그룹에서 추출할 샘플의 비율 (전체 데이터의 비율)
# size: 각 그룹에서 추출할 샘플의 크기 (정확한 수)
# ...: 추가 인수

# 데이터 프레임 생성
data <- data.frame(
  Group = rep(c("A", "B"), each = 10),
  Value = 1:20
)
data
# Group 변수에 따라서 데이터 프레임을 분할하고, 각 그룹에서 50% 샘플링
sampled_data <- sampleBy(~ Group, data = data, frac = 0.5)
print(sampled_data)

?formula
sample(data, 2, replace = TRUE)
