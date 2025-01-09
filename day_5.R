# R의 참조형 자료와 형변환
#6. 데이터 프레임(Data Frame)
# R에서 데이터 프레임은 행과 열로 구성된 2차원 데이터 구조.
# 각열은 서로 다른 데이터 유형을 가질 수 있으며, 이는 데이터 분석,
# 통계 모델링, 데이터 시각화 등에서 매우 유용하게 사용됨.
# R에서 데이터 프레임은 핵심 데이터 구조 중 하나로, 데이터 분석과 처리의 기본 단위로 사용됨.

# Data Frame 특징
# 혼합 데이터 유형 : 데이터 프레임의 각 열은 서로 다른 데이터 유형을 가질 수 있다.
# 이름 지정 : 열 이름과 행이름을 지정 할 수 있다.
# 데이터 접근 : 행과 열의 인덱스 또는 이름을 사용하여 접근할 수 있다.

# 기본 데이터 프레임
df <- data.frame(
  Name = c("John", "Alice", "Bob"),
  Age = c(25, 30, 22),
  Score = c(88.5, 92.0, 79.5),
  stringsAsFactors = FALSE        # 문자형 데이터를 팩터로 변환하지 않음. FALSE 가 기본값.
)
print(df)
is.factor(df$Name)

# rownames() : row 이름 지정
rownames(df) <- c("Row1", "Row2", "Row3")
print(df)
print(df[2,]) # index 값을 이용..
# 이름을 이용해서 불러오기
print(df["Row2",])

# 새로운 열 추가..
df$Gender <- c("Male", "Female", "Male")
print(df)
# 열 삭제..
df$Gender <- NULL
print(df)

# 데이터 프레임 조작
# 특정 열에 대한 접근
# df$[컬럼명]
df$Name
df[,"Name"]

# 특정 행에 대한 접근
df["Row1",]
df[1,]

# 특정 원소 접근 ( 2행, 2열 값에 접근)
df[2,2]
df["Row2", "Age"]

# 3행(Row3) 3열(Score)
df["Row3", "Score"]
df[3,3]

# 새로운 행 추가
new_row <- data.frame(Name="Eve", Age=28, Score=85.0)
df <- rbind(df, new_row)
print(df)


# 새로운 열 추가
df$Country <- c("USA", "Canada", "UK", "France")
print(df)

# 특정 행 삭제
df <- df[-2,]
print(df)

# 특정 열 삭제
df$Country <- NULL
print(df)

# 열 순서 변경
df <- df[c("Name", "Score", "Age")]
print(df)

# 행 이름 변경
rownames(df) <- c("First", "Second", "Third")
print(df)

# 데이터 프레임의 연산
mean(df$Age)
mean(df$Score)

sum(df$Score)

# Age가 25보다 큰 행 선택
subset(df, Age>25)
# Score가 85 이상인 행 선택
df[df$Score >= 85, ]

# 열 기준으로 데이터 프레임 합치기
df1 <- data.frame(ID=1:3, Name=c("John", "Alice", "Bob"))
df2 <- data.frame(ID=1:3, Age=c(25, 30, 22))
merged_df <- merge(df1, df2, by="ID")
merged_df
# 행 기준으로 데이터 프레임 합치기
df3 <- data.frame(ID=4:5, Name=c("Eve", "Charlie"))
combined_df <- rbind(df1, df3)
combined_df

# merge는 by 기준값이 존재해야 merge가 될 수 있음
merged_df2 <- merge(merged_df, combined_df, by="ID")
merged_df2
merged_df3 <- merge(combined_df, merged_df, by="ID")
merged_df3

# 데이터프레임의 유용한 함수
# str() : 데이터 프레임 구조
# summary() : 데이터 프레임 요약 통계량을 제공
# head() : 데이터 프레임의 처음 몇 행만 출력
# tail() : 데이터 프레임의 마지막 몇 행만 출력
# nrow() 및 ncol() : 데이터 프레임의 행 수와 열 수를 반환
# as.data.frame() : 다른 데이터 구조를 데이터 프레임으로 변환

str(df)
summary(df)
head(df)
tail(df)

nrow(df)
ncol(df)

mat <- matrix(1:36, ncol = 3)
df_from_mat <- as.data.frame(mat)
df_from_mat
head(df_from_mat)
tail(df_from_mat)

# 데이터 프레임과 다른 데이터 구조
# 벡터와 데이터 프레임
vec <- c(1, 2, 3)
df_from_vec <- data.frame(Number = vec)
df_from_vec

# 행렬과 데이터 프레임
mat <- matrix(1:9, nrow = 3)
df_from_mat <- data.frame(mat)
df_from_mat

# 데이터 프레임과 리스트
l <- list(Name=c("John", "Alice", "Bob"), Age=c(25, 30, 22))
l
df_from_list <- data.frame(l)
df_from_list

# 배열과 데이터 프레임
arr <- array(1:12, dim=c(3,4))
df_from_arr <- data.frame(arr)
df_from_arr

#===============================================================
# 1단계
# x(컬럼명) = 1, 2, 3, 4, 5
# y(컬럼명) = 6, 7, 8, 9, 10인 데이터 프레임 생성
d1 <- data.frame(x=c(1,2,3,4,5), y=c(6,7,8,9,10))
d1

# 2단계
# z = 11,12,13,14,15 인 데이터 프레임을 추가
d1$z <- c(11,12,13,14,15)
d1

# View() - 데이터프레임을 Table 형식으로 보여줌
View(d1)

d2 <- data.frame(data.frame(x=c(1,2,3,4,5), y=c(6,7,8,9,10)), z=c("M", "F", "M", "F", "M"))
View(d2)

d2$v <- c(3,6,9,12,15)
d2

# 데이터 접근...
d2

# y열 출력,
d2$y
d2[,"y"]

# v열 6 만 출력
d2[2,4]

# 행 (1,3) 출력
d2[c(1,3),]
# 행 (2,4) 의 z열 출력
d2[c(2,4),"z"]

d2[-1, -c(2,3)] # 1 행, 2,3열 제외

d2[,c("x", "y")]

d2[, c("x"), drop=TRUE]    # 기본값
d2[, c("x"), drop=FALSE]
str(d2)

# 행/열 이름 붙이기
d3 <- data.frame(x=1:120)
head(d3)
tail(d3)

# 컬럼 이름 변경
colnames(d3) <- c("val")
head(d3)
names(d3) <- c("element")
head(d3)

d4 <- data.frame(1:3)
d4
colnames(d4) <- c("value")
rownames(d4) <- c("One", "Two", "Three")
d4

d5 <- data.frame(a=1:3, b=4:6, c=7:9)
d5
d6 <- d5[, names(d5) %in% c("b", "c")]
d6 <- d5[, !names(d5) %in% c("a")]
d5
d6

class(c(1,2,3))
class(matrix(c(1,2,3)))
class(array(c(1,2,3)))
class(list(c(1,2,3)))
class(data.frame(x=c(1,2,3)))

# 타입 변환

# vector()
# matrix()
# array()
# list()
# data.frame()

d <- data.frame(matrix(c(1,2,3,4,5,6), ncol=2))
colnames(d) <- c("X","Y")
d

v <- c(1,2,3,4,5,6)


# 벡터(Vector)를 행렬(matrix)로 변환
m1 <- matrix(v, ncol=2)
m1
is.matrix(m1)

# 벡터(Vector)를 배열(array)로 변환
a1 <- array(v, dim = c(2, 3))
a1
is.array(a1)

# 벡터(Vector)를 리스트(list)로 변환
l1 <- list(v)
l1
is.list(l1)

# 벡터(Vector)를 데이터 프레임으로 변환
d1 <- data.frame(matrix(v, nrow=3, ncol=2))
d1
is.data.frame(d1)


m <- matrix(1:12, nrow=4, ncol=3)
m
# 행렬(matrix)를 벡터(Vector)로 변환
v2 <- c(m)
v2
is.vector(v2)

# 행렬(matrix)를 배열(array)로 변환
a2 <- array(m, dim=c(3,4))
a2
is.array(a2)

# 행렬(matrix)를 리스트(list)로 변환
l2 <- list(a=m[,1], b=m[,2], c=m[,3])
l2
is.list(l2)

# 행렬(matrix)를 데이터 프레임으로 변환
d2 <- data.frame(m)
d2
is.data.frame(d2)


a <- array(1:24, dim=c(2,3,4))
a
# Array(배열)을 벡터(Vector)로 변환
v3 <- c(a)
v3
is.vector(v3)

# Array(배열)을 행렬(matrix)로 변환
m3 <- matrix(a, nrow=4, ncol=6)
m3
is.matrix(m3)

# Array(배열)을 리스트(list)로 변환
l3 <- list(a, nrow=6)
l3
is.list(l3)

# Array(배열)을 데이터 프레임으로 변환
d3 <- data.frame(matrix(a, ncol=4))
d3
is.data.frame(d3)


l = list(x=c(1,2,3),y=c(4,5,6),z=c(7,8,9))
l
# 리스트(list)를 벡터(Vector)로 변환
v4 <- unlist(l)
v4
is.vector(v4)

# 리스트(list)를 행렬(matrix)로 변환
m4 <- do.call(cbind, l)
m4
is.matrix(m4)

# 리스트(list)를 Array(배열)로 변환
a4 <- list(l)
a4
is.list(a4)

# 리스트(list)를 데이터 프레임으로 변환
d4 <- data.frame(l)
d4
is.data.frame(d4)


matrix_data <- matrix(1:20, nrow = 4, ncol = 5)
df <- data.frame(matrix_data, row.names = c("kim", "lee", "park", "choi"))
df
# 데이터 프레임을 벡터(Vector)로 변환
v5 <- unlist(df)
v5
is.vector(v5)

# 데이터 프레임을 행렬(matrix)로 변환
m5 <- as.matrix(df, nrow=4, ncol=5)
m5
is.matrix(m5)

# 데이터 프레임을 Array(배열)로 변환
a5 <- as.array(as.matrix(df))
a5
is.array(a5)

# 데이터 프레임을 리스트(list)로 변환
l5 <- list(df)
l5
is.list(l5)

# ==============================================================

### R의 사용자 정의 함수(Function)와 순서형 자료 구조 및 
# 패키지 관리

# 함수 정의 : function
add <- function(a,b) {
  return(a+b)   # return 함수 ...
}

# 함수 호출
result <- add(10, 20)
print(result)  # 출력 30

# 함수의 기본 인자(기본값 설정)
greet <- function(name = "Guest") {
  paste("hello, ", name) # paste() - 문자열 합치는 함수
}

# 인자를 제공하는 경우
print(greet("Alice"))      # hello, Alice
# 인자 제공하지 않는 경우
print(greet())             # hello, Guest

# 여러 값을 반환하는 함수
compute_stats <- function(numbers) {
  mean_val <- mean(numbers)
  sd_val <- sd(numbers)   # Standard Deviation(표준 편차)
  return(list(mean = mean_val, sd = sd_val))
}

# 함수 호출
stats <- compute_stats(c(1,2,3,4,5))
print(stats$mean)
print(stats$sd)


# R에서 기본적으로 함수는 값에 의한 전달...
#  인자 값을 변경하더라도 원래의 데이터는 영향x
modify_value <- function(x) {
  x <- x + 10
  return(x)
}

original_value <- 5
new_value <- modify_value(original_value)
print(original_value)    # 인자로 넘긴 original_value 변경 X
print(new_value)         # 15로 대입이 일어남.

# 실습 - 종합 실습...
# 데이터 프레임 처리 함수를 정의하고, 테스트
# 데이터 프레임 처리함수는 기능
#  df를 받아서 다음과 같은 기능을 구현...
#  1. 열이 데이터프레임에 존재하는 지 확인
#  2. 매개 변수로 필터링 조건을 받아서 필터링 처리
#  3. 새로운 열 추가 및 값 계산 기능을 넣으세요..

# 데이터 프레임 처리 함수 정의
process_dataframe <- function(df, column_name, filter_value,
                              new_column_name, calculation_function) {
  # 1. 열이 데이터프레임에 존재하는지 여부 확인
  if(!(column_name %in% colnames(df))) {
    # df에 컬럼이 존재하지 않으면 -> stop
    stop("Error: Specified column does not exists in the data frame.")
  }
  
  # 주어진 열의 값에 따라 필터링
  filtered_df <- df[df[[column_name]] > filter_value,]
  
  # 새로운 열 추가 및 값 계산
  filtered_df[[new_column_name]] <- calculation_function(filtered_df[[column_name]])
  
  return(filtered_df)
}

# 예제로 사용할 데이터 프레임 생성
example_df <- data.frame(
  A = 1:10,
  B = 11:20
)


# 함수 호출 예시
result_df <- process_dataframe(
  df = example_df,
  column_name = "B",
  filter_value = 2,
  new_column_name = "C",
  calculation_function = function(x) x+2
  )

# 결과 출력
print(result_df)

# 사용자 정의 함수는 데이터를 처리하기 위한 반복적인 단계별 기능을 정의함으로써 반복 작업을
# 간소화 할 수 있다.