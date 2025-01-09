# R의 참조형 자료와 형 변환
#3. 리스트
# 다양한 유형의 데이터 구조를 담을 수 있는 강력하고 유연한 데이터 구조
# 여러 타입의 데이터(벡터, 행렬, 데이터 프레임 등)를 혼합하여 저장할 수 있다.

# 리스트의 특징
# 유연성 : 리스트는 벡터, 행렬, 데이터 프레임등 다양한 데이터 유형을 하나의 객체에 저장할 수 있음.
# 인덱싱 : 리스트의 원소는 인덱스나 이름을 이용하여 접근할 수 있음.

# 리스트 생성 및 조작
my_list <- list(name = 'John', age = 30, scores=c(80, 90, 88))
print(my_list)

# 리스트 원소에 접근
# 이름으로 접근
my_list$name
my_list$age

# 숫자 인덱스로 접근
my_list[2]      # [$age, 30]
my_list[[2]]    # 30

# 리스트 원소에 대한 수정
my_list$name <- "Tom"
my_list$name

my_list[[2]] <- 40
my_list[[2]]

# 리스트 원소 추가
my_list$address <- "New York"
my_list

# 리스트 원소 삭제
my_list$address <- NULL
my_list

# 리스트의 결합
list1 <- list(a=1, b=2)
list2 <- list(c=3, d=4)
combine_list <- c(list1, list2)
combine_list

# 리스트의 유용한 함수
# str() : 리스트 구조를 확인
# length() : 리스트의 원소의 개수를 반환
# names() : 리스트의 원소 이름을 반환하거나 설정
# lapply : 리스트의 각 원소에 함수를 적용, 반환 값 리스트 >> lapply(list, function)
# sapply : 리스트의 각 원소에 함수를 적용, 결과는 벡터나 행렬로 반환 >> sapply(list, function)
# unlist() : 리스트를 단일 벡터로 변환
# as.list() : 다른 데이터 구조를 리스트로 변환
str(my_list)
length(my_list)
names(my_list)
names(my_list) <- c("Name", "Age", "Scores")
lapply(my_list, length) # 반환값이 list
sapply(my_list, length) # 반환값이 벡터 or 행렬
unlist(my_list)
vec <- c(1, 2, 3)
list_from_vec <- as.list(vec)
list_from_vec

# 리스트와 다른 데이터 구조
# 리스트와 벡터 - 벡터는 동일구조, 리스트는 다양한 데이터 유형
# 리스트와 행렬 - 리스트를 행렬로 변환할 때 do.call(rbind, list) 또는 do.call(cbiind, list)를 사용할 수 있음.
print(list1)
print(list2)
mat <- do.call(rbind, list(list1,list2))
mat
mat2 <- do.call(cbind, list(list1, list2))
mat2
# 리스트와 데이터프레임
df <- data.frame(my_list)
df
# 리스트는 중첩 처리가 가능...
nested_list <- list(list1 = list(a=1, b=2), list2 = list(c=3, d=4))
nested_list
length(nested_list$list1)
for (item in nested_list) {
  print("==============")
  print(item)
  print("==============")
  for (subitem in item) {
    print("-------------")
    print(subitem)
    print("-------------")
  }
}

# 연습
# 단순 리스트
x1 <- list(name="kim", height=180, weight=90)

# 중첩 리스트
x2 <- list(a = list(val=c(1,2,32)),b = list(val=c(1,2,3,4)))

# 왜 ? category로 데이터를 구분할 수 있다.
# 데이터를 효율적으로 관리할 수 있다.

#-------------------------------------------------------------#
#4. 행렬(Matrix)
# 데이터를 2차원 배열로 표현하는 기본적인 데이터 구조.
# 행렬은 행(row), 열(column)으로 구성되며, 모든 원소는 동일한 데이터 유형이어야 한다.
# 수치 계산(*), 데이터 분석, 통계 모델링 등에 널리 사용된다.

# 행렬의 특징
# 동일 데이터 유형 : 모든 원소가 동일한 데이터 타입, 보통은 숫자
# 행과 열 : 행과 열로 구성되며, 각 우너소는 이 두 차원 접근가능,
# 인덱싱 : 행렬의 원소는 행과 열의 인덱스를 사용하여 접근


# 행렬의 생성
mat <- matrix(1:6, nrow = 2, ncol = 3)
print(mat)

# 행과 열 이름 지정하여 행렬 생성
mat <- matrix(1:6,nrow = 2, ncol = 3, byrow = TRUE)
print(mat)
# 행과 열에 이름을 지정하는 함수 dimnames()
dimnames(mat) <- list(c("Row1", "Row2"), c("Col1", "Col2", "Col3"))
print(mat)

# 행렬을 특정 값으로 초기화:
# 모두 0으로 초기화된 행렬 생성
mat_zeros <- matrix(0, nrow = 3, ncol = 3)
mat_zeros
# 행렬의 특정 값으로 초기화(사용자 정의) ** byrow : 행을 기준으로 값을 채워넣을지 여부
# byrow = FALSE가 기본값.
mat_custom <- matrix(c(10, 20, 30, 40, 50, 60), nrow = 2, ncol = 3, byrow = TRUE)
mat_custom

# 행렬 조작
# 원소 접근 :
# 특정 원소 접근 (2행 3열)
mat_custom[2,3]
# 1행에 접근
mat_custom[1,]
# 2열에 접근
mat_custom[,2]

# 행렬 원소 값 수정 :
# 2행 3열의 값을 200으로 수정
mat_custom[2,3] <- 200
mat_custom
mat_custom[1,] <- c(20,40,60)

# 행렬에 행과 열을 추가..
# 행 추가.. rbind()
new_row <- c(70, 80, 90)
mat_custom <- rbind(mat_custom, new_row)
mat_custom
# 열 추가.. cbind()
new_col <- c(100, 110,120)
mat_custom <- cbind(mat_custom, new_col)
mat_custom

# 행렬의 차원을 확인
dim(mat_custom)
# 행렬의 구조 확인
str(mat_custom)

#------------------------------------------#
# 행렬의 연산
# 행렬 덧셈과 뺄셈
mat1 <- matrix(1:6, nrow = 2)
mat1
mat2 <- matrix(6:1, nrow = 2)
mat2
sum_mat <- mat1 + mat2
sum_mat
diff_mat <- mat1 - mat2
diff_mat

# 행렬 곱셈
mat1 <- matrix(1:4, nrow = 2)
mat1
mat2 <- matrix(4:1, nrow = 2)
mat2
product_mat <- mat1 * mat2
product_mat

# 행렬 전치
mat
t(mat)
# 행렬의 역행렬
# 역행렬 계산 (정방 행렬이어야 함)

mat <- matrix(c(1,2,3,4), nrow = 2)
mat
inv_mat = solve(mat)
inv_mat
mat %*% inv_mat

# 행렬의 특성값과 고유 벡터:
eigen(mat)


# 행렬의 합계, 평균, 분산 :
# 행렬 모든 원소 합계
sum(mat)
# 행렬 모든 원소 평균
mean(mat)
# 행렬 모든 원소의 분산
var(mat)

#-----------------------------------------------------#
# 행렬의 데이터 구조
# 행렬과 벡터 - 동일한 데이터 타입
# 행렬과 데이터프레임 - data.frame()을 사용해 matrix-> dataframe
df <- data.frame(mat)
df
# 행렬과 리스트 - as.list()
list_from_mat <- as.list(mat)
list_from_mat

# 행렬의 특수 함수
# matrix()
# t()
# solve()
# eigen()
# apply() 행 또는 열에 함수를 적용.
mat
apply(mat, 2, sum)  # margin = 2(col)
apply(mat, 1, sum)  # margin = 1(row)
str(mat)

# 행렬(Matrix)
# 벡터와 마찬가지로 행렬에는 한 가지 유형의 스칼라만 저장
# 모든 요소가 숫자인 행렬은 가능하지만, ‘1열은 숫자, 2열은 문자열’과 같은 형태는 불가능

# 행 개수를 지정, 열은 자동
m1 = matrix(c(1,2,3,4,5,6,7,8,9), nrow=4)
m1

# 열 개수를 지정, 행은 자동
m2 = matrix(c(1,2,3,4,5,6,7,8,9), ncol=4)
m2

# 행 부터 채우기
m3 = matrix(c(1,2,3,4,5,6,7,8,9), nrow=2, byrow=T)
m3

# 행과 열에 이름을 부여
m4 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, dimnames=list(c("item1","item2","item3"), c("feature1","feature2","feature3")))
m4

# 행렬 내 요소의 접근
m4[1]
m4[1,]
m4[,1]
m4[-1]
m4[1,2]
m4[1:2,2]
m4[1:2,1:2]
m4["item2",]
m4[,"feature2"]
m4["item2",1]
m4[3,"feature2"]


# 행렬의 연산
m5 <- matrix(1:9, ncol=3, nrow=3)
m5
m5*2
m5/2
m5+m5
m5-m5
m5%*%m5             # 행렬곱


m5 <- matrix(c(3,2,3,2,4,6,4,6,9), nrow=3, ncol=3)
m5



# 행렬식 계산
det_m5 <- det(m5)
det_m5

# 행렬식이 0인지(특이행렬) 확인
if (det_m5 == 0) {
  print("이 행렬은 특이행렬입니다. 역행렬이 존재하지 않습니다.") 
  }else {
    inverse_m5 <- solve(m5)
    print("역행렬:")
    print(inverse_m5)
  }

library(MASS)

# 일반화 역행렬 계산
pseudo_inverse_m5 <- ginv(m5)
print("일반화 역행렬:")
print(pseudo_inverse_m5)



# 전치 행렬 : t()
t_m5 <- t(m5)
t_m5


# 행렬의 요소의 수
length(m5)
ncol(m5)
nrow(m5)

#----------------------------------------------------#
# 배열(Array)
# 다차원 데이터 구조. 배열은 행렬보다 더 높은 차원의 데이터 구조를 제공. 데이터의 다차원적 표현과 연산에 유용합니다.

# 특징
# 동일한 데이터 유형
# 3차원 이상의 차원을 가질 수 있어요.
# 인덱싱을 이용해서 데이터 접근한다.

# 배열의 생성
# 2차원 배열
mat <- matrix(1:6, nrow = 2, ncol = 3)
mat
# 배열로 전환
arr <- array(mat, dim = c(2,3))
print(arr)
is.array(arr)
is.array(mat)

# 다차원 배열 생성
# 3차원 배열 생성 (행 x 열 x 깊이)
arr_3d <- array(1:24, dim = c(2, 3, 4))
arr_3d

# 차원 이름을 지정해서 배열 생성
arr_named <- array(1:24, dim = c(2, 3, 4),
                   dimnames = list(c("R1", "R2"),
                                   c("C1", "C2", "C3"),
                                   c("L1", "L2", "L3", "L4")))
print(arr_named)

# 배열 조작
# 특정 원소 접근
arr_named[1,2,3]

# 슬라이싱
# 특정 행과 열을 선택 (깊이 포함)
arr_named[1,,]

arr_named[,,2]

# 차원 변경
# 배열의 차원을 변경
arr_2d <- array(arr_3d, dim=c(4,6))
arr_2d

arr_4d <- array(1:48, dim = c(2, 3, 4, 2))
arr_4d
# 배열의 차원 확인
dim(arr_2d)
dim(arr_3d)
dim(arr_4d)

# 배열의 구조 확인
str(arr_2d)
str(arr_3d)
str(arr_4d)

# 배열의 연산
arr1 <- array(1:8, dim = c(2, 2, 2))
arr2 <- array(9:16, dim = c(2, 2, 2))

# 배열의 덧셈
sum_arr <- arr1 + arr2
sum_arr

# 배열의 뺄셈
diff_arr <- arr1 - arr2
diff_arr

# 배열의 곱셈
product_arr <- arr1 * arr2
product_arr

# 배열의 전치
# 2차원 배열은 가능, 3차원 이상 불가.
mat <- matrix(1:6, nrow = 2)
transposed_mat <- t(mat)
mat
transposed_mat

# 배열의 합계, 평균, 분산
# 합계
sum_arr <- sum(arr_3d)
sum_arr
# 평균
mean_arr <- mean(arr_3d)
mean_arr

# 분산
var_arr <- var(arr_3d)
var_arr

# 배열과 다른 데이터 구조
# 벡터와 배열
vec <- 1:12
arr <- array(vec, dim = c(3,4))
arr

# 배열과 행렬 - array() 2차원이 아닌 다른 차원의 배열로 전환
mat <- matrix(1:6, nrow = 2, ncol = 3)
arr <- array(mat, dim = c(2, 3, 1))
mat
arr

# 배열과 데이터 프레임
# 배열을 데이터프레임으로 변환할 때는 as.data.frame() 함수를 사용한다. 일반적으로 배열을 2차원 데이터로 변환할때 유용하다.
df <- as.data.frame(matrix(arr_3d, nrow=dim(arr_3d)[1]))
df

# 배열과 리스트
list_from_arr <- as.list(arr_3d)
list_from_arr

# 배열과 특수 함수
# array()
# dim()
# apply() : 배열의 특정차원에 함수 적용
apply(arr_3d, 3, sum)
# sweep() : 배열의 특정 차원에 대해 함수 적용
# 각 차원에 대해 평균을 빼는 표준화
standized_arr <- sweep(arr_3d, 1, rowMeans(arr_3d))
standized_arr
