# 벡터(Vector)
# 배열의 개념으로, 다음과 같이 c() 안에 원하는 인자들을 나열하여 정의하며, 1차원 배열과 같은 단일 차원만 가능


x1 <- c(1 , 2 , 3 , 4 , 5)
x1

x2 <- c("kim", "lee", "park", "choi", "kwon")
x2

# 2차원 처럼 선언하여도 1차원으로 저장
x3 <- c(90, 70, 90, 80, c(50, 70, 40, 80))
x3


# start:end 형태로 지정하는 경우
x4 <- 21:40
x4

# from, to, by 형태로 지정하는 경우
x5 <- seq(5, 30, 3)
x5

# 저장된 요소의 수 만큼 1~N 요소 발생
x6 <- seq_along(c("shilla","gaya","baikjae","goguryoe"))
x6

# 지정한 수 만큼 1~N 요소 발생
x7 <- seq_len(4)
x7

# 벡터에 이름을 지정
x8 <- c(95,100,85,90)
names(x8) <- c("park","kim","lee","choi")
x8

# 벡터에서 특정 요소의 접근
x8[2]
x8[-2]
x8[c(1,2)]
x8[c(1:3)]
x8["kim"]
x8[c("kim","choi")]

# 벡터에서 요소의 수 출력
length(x8)
nrow(x8)      # 행렬만 가능
NROW(x8)


# 벡터 연산
# %in% 연산자 : 특정 값이 벡터에 존재하는 확인
90 %in% x8
"lee" %in% x8


st1 <- c("a" , "b" , "c")
st2 <- c("d" , "a" , "f" )
st3 <- c("a" , "b" , "c", "b", "a")

# 합집합 연산
union(st1, st2)

# 교집합 연산
intersect(st1, st2)

# 차집합 연산
setdiff(st1, st2)

# 집합간 비교
setequal(st1, st2)
setequal(st1, st3)


# 요소의 반복
x9 <- rep(12:15, 3)
x9

x10 <- rep(12:15, each=3)
x10

