#변수와 연산
#1 변수 선언과 할당
x <- 10  # x라는 변수선언, 10할당
y = 10   # y라는 변수선언, 10할당
# * 할당은 <-(기본), = 을 이용
z <- x + y
print(z)

#2 기본 자료형(Basic Data Type)
# 숫자형(Numeric) - 실수, 정수를 표현.(기본은 실수형)
# 실수형
num <- 3.14  # 기본형
print(num)
# 정수형(Integer) -> 정수표현하며, L접미사로 사용합니다. 명시적으로 정수형 지정.
# 정수형(표현식 : L)
int <- 42L
print(int)
# 문자형(Character) -> 문자 또는 문자열열
char <- "Hello R programing"
print(char)
# 논리형(Logical) -> 참(TRUE) 또는 거짓(FALSE)을 표현
logic <- TRUE
print(logic)
# 복소수형(Complex) -> 복소수를 표현
comp <- 1 + 2i
print(comp)
# 팩터형(Factor) -> 범주형 데이터를 표현
f <- factor(c("low", "medium", "hight"))
print(f)

# NA -> 결측치 값을 측정하지 못함을 표현(값이 없음)
one <- 100
two <- 75
three <- 80
four <- NA
is.na(four)

# NULL (할당되지 않음)
x <- NULL
is.null(x) # x가 NULL? NULL이면 TRUE, 아니면 FALSE
is.null(1)
is.null(NA)
is.na(NULL)

# 논리값
ps <- FALSE
print(ps)
is.logical(ps)

#3 기본 자료형의 연산
#3-1 할당 연산자
# varialbe <- value : 변수에 값을 대입 ,
# variable = value  : 변수에 값을 대입 ,
# value -> variable : 값을 변수에 할당,
100 -> num100
# value ->> variable  : 값을 변수에 할당(덜사용됨.)
1000 ->> num1000
print(num1000)

#3-2 산술 연산자
# +(더하기), -(빼기), *(곱하기), /(나누기), ^(제곱), %%(나머지), %/%(정수 나눗셈(몫))
num1 <- 34
num2 <- 5
num1 + num2
num1 - num2
num1 * num2
num1 / num2
num1 %% num2
num1 %/% num2
num1^3
num1 ** 3


#3-3 비교 연산자
# ==, !=, <, <=, >, >=,
a <- 100
b <- 200
a > b
a < b
a == b
a >= b
a <= b
a != b


#3-4 논리 연산자
# &(벡터의 요소별 논리곱(AND)), &&(솟컷연산 논리곱), |, || (논리합(OR)), !(부정)
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

! TRUE
! FALSE

#4.1 기본 자료형 확인
# is.numeric(), is.integer(), is.character(), is.logical(), is.complex(),
# is.factor()
# is.na(), is.null(), is.infinite(), is.finite()
a = 10
b = 20
c = 3.14
d = "word"
e = TRUE
f = 9 + 2i

is.numeric(a)
is.integer(b)  # numeric은 기본이 실수입니다.... "L"을 안붙이면 정수가 아님.
is.double(c)
is.character(d)
is.logical(e)
is.complex(f)
is.finite(b / 2)
is.infinite(b / 0)

#4.2 기본 자료형의 형변환
# as.numeric(), as.integer(), as.character(), as.logical(), as.complex(),
# as.factor(), as.array(), as.matrix(), as.data.frame()
a <- "1004"
b <- 304.12
c <- "3.14"
d <- 1004
e <- "FALSE"
f <- "10+7i"
as.numeric(a)
is.numeric(as.numeric(a))
as.integer(b)
as.double(c)
as.character(d)
as.logical(e)
as.complex(f)

# R의 제어문
#1. if - 가장 기본적인 조건문. 참인 경우 실행
x <- 5
if (x > 3) {
  print("x는 3보다 큽니다")
}

# if ~ else ~
x <- 2
if (x > 3) {
  print("x는 3보다 큽니다")
} else {
  print("x는 3보다 작습니다")
}

# ifelse 함수 : ifelse는 벡터화된 조건문으로, 벡터의 각 요소에 대해 조건을 평가하여 참일 경우와 거지일 경우의 값을 반환. 이는 벡터나 데이터프레임에서 많이 사용함.
x <- c(5, 2, 9)
print(x)
result <- ifelse(x > 3, "크다", "작다")
print(result)

# if -else if - else
x <- 10
if (x > 10) {
  print("x는 10보다 큽니다.")
} else if (x == 10) {
  print("x는 10입니다.")
} else {
  print("x는 10보다 작습니다.")
}

#2. switch 문
x <- 1

result <- switch(x, "첫번째 옵션", "두번째 옵션", "세번째 옵션")
print(result)
# 문자
day <- "화요일"
result <- switch(
  day,
  "월요일" = "일주일의 시작",
  "화요일" = "올해 마지막 날",
  "수요일" = "2025년의 첫날",
  "일요일" = "쉬는 날",
  "알 수 없는 요일"
)
print(result)

#3. for문 -> R 언어에서 for문의 특징은 특정 명령어를 반복할 때
#      다양한 형태로 사용.
#3.1 기본 for문
# 1부터 5까지 반복
for (i in 1:5) {
  print(i)
}
print(1:5) <-
  is.vector(1:5)

#3.1 벡터 또는 리스트를 사용하는 for 반복문
# 벡터 반복
vec <- c("apple", "orange", "cherry")
for (fruit in vec) {
  print(fruit)
}

# 리스트 반복
lst <- list(name = "Alice", age = 30, city = "New York")
for (item in lst) {
  print(item)
}

#3.3 중첩된 for 반복문
# 2 x 3 행렬을 반복하여 출력하는 for문 작성
# 2x3 행렬
matrix_data <- matrix(1:6, nrow = 2, ncol = 3)

print(nrow(matrix_data))    # 2
print(ncol(matrix_data))    # 3

for (i in 1:nrow(matrix_data)) {
  for (j in 1:ncol(matrix_data)) {
    cat("Row:", i, "Col:", j, "Value:", matrix_data[i, j], "\n") #문자열 합치는 함수
  }
}


#3.4 for문에서 인덱스 사용
vec <- c(10, 20, 30, 40, 50)
for (i in 1:length(vec)) {
  cat("Index: ", i, "Value:", vec[i], "\n")
}

#3.5 seq_along 또는 seq_len과 함께 사용하는 for문
# 벡터나 리스트 길이를 기반으로 반복수행...
vec <- c("red", "green", "blue")
for (i in seq_along(vec)) {
  cat("Color : ", vec[i], "\n")
}
print(seq_along(vec))     # 벡터값
print(seq_len(5))         # 연속된 값 길이...

#3.6 next와 break를 사용하는 for문
for (i in 1:5) {
  if (i == 3) {
    next
  }
  print(i)
}

for (i in 1:5) {
  if (i == 3) {
    break
  }
  print(i)
}

#4 while문
#4.1 기본 while
i <- 1    # 초기값
while (i <= 5) {
  # 조건
  print(i)
  i <- i + 1   # 증감값
}

#4.2 무한 루프
i <- 1
while (TRUE) {
  print(i)
  if (i > 5) {
    break   # i가 5보다 커지는 경우
  }
  i <- i + 1
}

#4.3 next문을 사용하여 반복 건너뛰기
i <- 1
while (i <= 5) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}

#4.4 조건이 거짓일 때 까지 실행되는 while　문
x <- 10
while (x > 0) {
  print(x)
  x <- x-1
}

# txt1 <- readline("입력: ")
# print(txt1)

#4.5 while 문을 이용한 사용자 입력 처리
repeat_input <- TRUE
while(repeat_input) {
  #readline() - python의 input()과 같은 함수
  input <- readline(prompt = "Type 'stop' to end :")
  if (input == "stop") {
    repeat_input <- FALSE
  } else {
    print(paste("You typed: ", input))
  }
}

