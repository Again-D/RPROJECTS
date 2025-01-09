# R의 참조형 자료와 형 변환
#1. 요인(Factor)형 자료
# 범주형 데이터를 처리하는데 유용한 데이터 구조
# 요인은 가능한 값의 집합(레벨)과 그 값을 나타내는 수준(범주)을 가지고 있습니다.
# 통계 분석과 모델링에서 범주형 변수(예: 성별, 지역, 만족도 등)를 효과적으로 다룰수 있게 돕습니다.

#1-1 특징
# 레벨(level) : 요인 변수는 명목형 또는 순서형 값의 집합을 가짐. 각 값은 '레벨'이라고 부름.
# 예로 c('Low','Medium','High')는 세 가지 레벨을 가진 요인이다

#1-2 요인의 생성 및 변환
# [요인생성]
levels <- c("Low", "Medium", "High")
is.vector(levels)
x <- c("Low", "Medium", "High", "Medium", "High")
print(x)
factor_x <- factor(x,levels=levels)
print(factor_x)
factor_x2 <- factor(x)  # 레벨 값을 지정하지 않으면 순서는? 알 수 없음
print(factor_x2)
# [요인의 레벨 값 출력]
levels(factor_x)
# 레벨 값 변경(재정의)
levels(factor_x) <- c("Low","Medium", "High","Very High")
print(factor_x)
# 순서형 요인(Ordered Factor)
# factor()의 매개값인 ordered = TRUE 인 경우, 순서를 결정
ordered_x <- factor(x, levels=levels, ordered = TRUE)
print(ordered_x)

# Factor 활용
# 요인은 회귀 분석, 분산 분석(ANOVA)등의 통계 분석에서 중요한 역할을 함
# 예제 데이터 프레임
df <- data.frame(
  Group = factor(c('A', 'B', 'A', 'C', 'B')),
  Score = c(85, 90, 78, 92, 88)
)
# 그룹 별 평균 점수 계산
aggregate(Score ~ Group, data=df, mean)    # mean 은 평균

# [ 요인의 수준 정렬 및 재정렬]
ordered_x <- factor(x, levels=c('Low', 'Medium', 'High'), ordered = TRUE)
print(ordered_x)
sorted_x <- ordered_x[order(ordered_x)]
print(sorted_x)

# 요인의 변환과 관련된 함수
# factor() : 범주형 데이터를 요인으로 변환
# levels() : 요인의 레벨을 확인하거나 설정
# as.factor() : 데이터를 요인으로 변환
# as.charactor() : 요인을 문자형 데이터로 변환
# as.numeric() : 요인을 숫자형 데이터로 변환

# 요인을 사용할 때 주의사항
# 레벨의 순서 - 순서형 요인의 경우 레벨의 순서는 중요하게 생각
# 통계 분석 및 모델링에서 의미있는 결과를 얻기 위해서 꼭 필요함
# 레벨의 인덱스 - 요인을 숫자형으로 변환할 때는 레벨의 인덱스가 사용된다. 요인 변환 후 인덱스와 값 사이의 관계를 이해해야 한다

# 예제)
# 요인은 범주형 변수를 위한 데이터 타입
# 기본적으로 데이터에 순서가 없는 명목형 변수
sex <- factor('m',c('m','f'),c("남성","여성"))
# sex <- factor("m", levels=c("m","f"), labels=c("남성","여성"))
sex

# 요소의 수
nlevels(sex)
# 요소의 값
levels(sex)[1]
levels(sex)[2]

# 요소의 값(levels) 변경
levels(sex) <- c("male","female")
sex

# 범주형(categorical) 변수를 위한 데이터 타입
# 순서가 있는 값일 경우 순서형(Ordinal) 변수
ordered(c("b", "a", "d", "c"))
factor(c("b","a","d","c"), ordered = TRUE)

is.factor(ordered(c("b", "a", "d", "c")))

# 벡터(Vector)
# R에서 가장 기본적인 데이터구조. 동일한 데이터 유형의 값들을 1차원적으로 나열한 것.
# R분석에 핵심적인 역할을 함.
# 벡터는 숫자, 문자, 논리값 등 다양할 유형의 데이터를 포함할 수 있다.
# 기본적으로 연속적이며 단일 차원의 데이터를 표현한다. 

# 벡터의 특징
# 동일 데이터 유형 - 벡터의 모든 원소는 동일한 데이터 유형
#   숫자 벡터, 문자 벡터, 논리 벡터 등으로 동일 타입이다.
# 값에 접근은 인덱스를 통해서 접근.

# 벡터의 생성
# 숫자형 벡터
num_vec <- c(1,2,3,4,5,6)
is.double(num_vec[1])    # TRUE
# 문자형 벡터
char_vec <- c("apple","orange", "banana")
# 논리형 벡터
log_vec <- c(TRUE, FALSE, TRUE, TRUE)
# 정수형 벡터
int_vec <- c(1L,2L,3L,4L,5L,6L)
is.integer(int_vec[1])    # TRUE
# 특정 범위의 벡터
seq_vec <- 1:10
# 반복적인 패턴의 벡터
rep_vec <- rep(c(1,2), times = 3) # rep() : 반복함수, times : 반복횟수

# [ 벡터 조작]
# 인덱싱 및 슬라이싱
vec <- c(10, 20, 30, 40, 50)
vec[2]
vec[1:3]

# 원소 접근 및 변경
vec[2] <- 25
vec[2]

# 벡터의 길이
length(vec)

# 벡터값 합치기(병합)
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
combined_vec <- c(vec1,vec2)
combined_vec

# 벡터값 필터링
vec <- c(1, 2, 3, 4, 5, 6)
filtered_vec <- vec[vec > 3]
filtered_vec

# 벡터의 연산
# 산술 연산
vec <- c(1, 2, 3)
vec + 2    # 3 4 5
vec - 1    # 0 1 2
# 논리 연산
vec <- c(TRUE, FALSE, TRUE)
!vec
# 함수 적용
vec <- c(10, 20, 30, 40, 50)
sum(vec)
mean(vec)
max(vec)

vec1 <- c(10, 20, 30)
vec2 <- c(40, 50, 60)
vec3 <- c(70, 80)
vec4 <- c(90, 100, 110, 120, 130, 140)
vec_sum <- vec1 + vec2
vec_sum
vec_sum <- vec_sum + vec4   # 벡터는 두 객체의 길이가  배수 관계에 있어야 한다
vec_sum

# 벡터와 다른 데이터 구조와 비교
# 벡터와 행렬
# vec <- c(10, 20, 30, 40, 50) 일때 경고메시지(들):matrix(vec, nrow = 3)에서: data length [5] is not a sub-multiple or multiple of the number of rows [3] 배수관계를 이루어야 함.
vec <- c(10, 20, 30, 40, 50, 60)
mat <- matrix(vec, nrow=3)
mat

# 벡터와 데이터 프레임
df <- data.frame(column1 = vec)  # 벡터를 데이터 프레임의 열로 사용
df

# 벡터의 특수 함수
# c() : 벡터를 생성하거나 원소를 결합
# seq() : 연속된 숫자의 벡터를 생성
# rep() : 벡터의 반복을 생성
# which() : 조건의 맞는 인덱스 값을 반환
c(1, 2, 3)
seq(from = 1, to = 10, by = 2)
rep(c(1,2), times = 3)
vec
which( vec > 30)    # 반환값은 인덱스 값

# 종합 실습
# 벡터
# 배열의 개념으로, c() 안에 원하는 인자들을 나열하여 정의
# 1차원 배열과 같은 단일 차원만 기능

x1 <- c(1, 2, 3, 4, 5)
x1

x2 <- c('kim', 'lee', 'park', 'choi', 'kwon')
x2

x3 <- c(90, 70, 90, 80, c(50, 60, 40, 80))
x3

x4 <- 21:40
x4

x5 <- seq(5,30,3)
x5

# 저장된 요소의 수 만큼 1 ~ N 요소 발생
x6 <- seq_along(c("shilla","gaya",'baikjae','goguryoe'))
x6

# 지정한 수 만큼 1 ~ N 요소 발생
x7 <- seq_len(4)
x7

# 벡터에 이름 지정
x8 <- c(95, 100, 85, 90)
names(x8) <- c('park', 'kim', 'lee', 'choi')
x8


# 벡터에서 특정 요소에 접근
x8[2]
x8['kim']
x8[-1]      # index 1 제외
x8[-2]      # index 2 제외
x8[c(1,3)]  # 1, 3 인덱스에 있는 값 출력
x8[c(1:3)]  # 1 ~ 3 인덱스에 있는 값 출력
x8[c('choi', 'kim')]

length(x8)
nrow(x8)    # 행렬인 경우에 사용 가능...
NROW(x8)    # nrow와 NROW는 다른 함수

# 벡터의 연산
90 %in% x8      # TRUE
"lee" %in% x8   # FALSE >> name은 값이 아닌 index

st1 <- c('a', 'b', 'c')
st2 <- c('d', 'a', 'f')
st3 <- c('a', 'b', 'c', 'b', 'a')

# 합집합 연산
union(st1, st2)

# 교집합 연산
intersect(st1, st2)

# 차집합 연산
setdiff(st1, st2);setdiff(st2,st1)

# 집합간 비교
setequal(st1, st2)   # FALSE
setequal(st1, st3)   # TRUE  st3를 set으로 보면, 결과가 "a", "b", "c" 이므로 st1과 같다

# 요소 반복
x9 <- rep(12:13, 3)        # 벡터 전체를 묶음으로 반복
x9

x10 <- rep(12:15, each=3)  # 벡터의 각 요소를 반복
x10

