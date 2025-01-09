# 스택 생성
stack <- list()

# 스택에 요소 추가
push <- function(stack, value) {
  stack <- c(list(value), stack)
  return(stack)
}

# 스택에서 요소 제거
pop <- function(stack) {
  value <- stack[[1]]
  stack <- stack[-1]
  return(list(value=value, stack=stack))
}

# 사용 예시
stack <- push(stack, 1)
stack <- push(stack, 2)
stack <- push(stack, 3)
stack <- push(stack, 4)
print(stack)

result <- pop(stack)
print(result)
print(result$value)
print(result$stack)
stack <- result$stack
stack

#--------------------------------------------------------------------

# 큐 생성
queue <- list()

# 큐에 요소 추가
enqueue <- function(queue, value) {
  queue <- c(queue, list(value))
  return(queue)
}

# 큐에서 요소 제거
dequeue <- function(queue) {
  value <- queue[[1]]
  queue <- queue[-1]
  return(list(value = value, queue = queue))
}

# 사용 예시
queue <- enqueue(queue, 1)
queue <- enqueue(queue, 2)
queue <- enqueue(queue, 3)

print(queue)  # 출력: list(1, 2, 3)

result <- dequeue(queue)
print(result$value)  # 출력: 1
print(result$queue)  # 출력: list(2, 3)
queue <- result$queue
queue

#--------------------------------------------------------
## 데크(Double-Ended Queue, deque) : 양쪽 끝에서 삽입과 삭제가 가능한 Queue.
# 데크 생성
deque <- list()

# 앞에 요소 추가
push_front <- function(deque, value) {
  deque <- c(list(value), deque)
  return(deque)
}

# 뒤에 요소 추가
push_back <- function(deque, value) {
  deque <- c(deque, list(value))
  return(deque)
}

# 앞에서 요소 제거
pop_front <- function(deque) {
  value <- deque[[1]]
  deque <- deque[-1]
  return(list(value = value, deque = deque))
}

# 뒤에서 요소 제거
pop_back <- function(deque) {
  value <- deque[[length(deque)]]
  deque <- deque[-length(deque)]
  return(list(value = value, deque = deque))
}

# 사용 예시
deque <- push_back(deque, 1)
deque <- push_back(deque, 2)
deque <- push_front(deque, 0)
deque <- push_back(deque, 3)

print(deque)  # 출력: list(0, 1, 2, 3)

result <- pop_front(deque)
print(result$value)  # 출력: 0
print(result$deque)  # 출력: list(1, 2, 3)

result <- pop_back(result$deque)
print(result$value)  # 출력: 3
print(result$deque)  # 출력: list(1, 2)

#-------------------------------------------------
# 스택 구현
create_stack <- function() {
  stack <- list()
  
  push <- function(value) {
    stack <<- c(stack, value)
  }
  
  pop <- function() {
    if (length(stack) == 0) {
      stop("Error: Stack is empty.")
    }
    value <- stack[[length(stack)]]
    stack <<- stack[-length(stack)]
    return(value)
  }
  
  peek <- function() {
    if (length(stack) == 0) {
      stop("Error: Stack is empty.")
    }
    return(stack[[length(stack)]])
  }
  
  return(list(push = push, pop = pop, peek = peek))
}

# 큐 구현
create_queue <- function() {
  queue <- list()
  
  enqueue <- function(value) {
    queue <<- c(queue, value)
  }
  
  dequeue <- function() {
    if (length(queue) == 0) {
      stop("Error: Queue is empty.")
    }
    value <- queue[[1]]
    queue <<- queue[-1]
    return(value)
  }
  
  peek <- function() {
    if (length(queue) == 0) {
      stop("Error: Queue is empty.")
    }
    return(queue[[1]])
  }
  
  return(list(enqueue = enqueue, dequeue = dequeue, peek = peek))
}

# 데크(덱) 구현
create_deck <- function() {
  deck <- list()
  
  push_front <- function(value) {
    deck <<- c(value, deck)
  }
  
  push_back <- function(value) {
    deck <<- c(deck, value)
  }
  
  pop_front <- function() {
    if (length(deck) == 0) {
      stop("Error: Deck is empty.")
    }
    value <- deck[[1]]
    deck <<- deck[-1]
    return(value)
  }
  
  pop_back <- function() {
    if (length(deck) == 0) {
      stop("Error: Deck is empty.")
    }
    value <- deck[[length(deck)]]
    deck <<- deck[-length(deck)]
    return(value)
  }
  
  peek_front <- function() {
    if (length(deck) == 0) {
      stop("Error: Deck is empty.")
    }
    return(deck[[1]])
  }
  
  peek_back <- function() {
    if (length(deck) == 0) {
      stop("Error: Deck is empty.")
    }
    return(deck[[length(deck)]])
  }
  
  return(list(push_front = push_front, push_back = push_back, 
              pop_front = pop_front, pop_back = pop_back, 
              peek_front = peek_front, peek_back = peek_back))
}

# 결과확인
stack <- create_stack()
stack$push(1)
stack$push(2)
stack$push(3)
print(stack$peek())
stack$pop()
print(stack$peek())
queue <- create_queue()
queue$enqueue(1)
queue$enqueue(2)
queue$enqueue(3)
print(queue$peek())

# 스택, 큐, 데크 사용 예제
run_examples <- function() {
  # 스택 사용 예제
  stack <- create_stack()
  stack$push(1)
  stack$push(2)
  stack$push(3)
  print(paste("Stack peek:", stack$peek())) # 3
  print(paste("Stack pop:", stack$pop()))   # 3
  print(paste("Stack peek after pop:", stack$peek())) # 2
  
  # 큐 사용 예제
  queue <- create_queue()
  queue$enqueue(1)
  queue$enqueue(2)
  queue$enqueue(3)
  print(paste("Queue peek:", queue$peek())) # 1
  print(paste("Queue dequeue:", queue$dequeue())) # 1
  print(paste("Queue peek after dequeue:", queue$peek())) # 2
  
  # 데크 사용 예제
  deck <- create_deck()
  deck$push_front(1)
  deck$push_back(2)
  deck$push_front(0)
  deck$push_back(3)
  print(paste("Deck peek front:", deck$peek_front())) # 0
  print(paste("Deck pop front:", deck$pop_front())) # 0
  print(paste("Deck peek back:", deck$peek_back())) # 3
  print(paste("Deck pop back:", deck$pop_back())) # 3
}

# 예제 실행
run_examples()

#--------------------------------------------------------------------
#3. 오픈 소스 자료 구조 라이브러리
# 부) 패키지 활용

# 패키지 관리 명령어..
# 패키지 설치 및 업데이트
# install.packages() - 패키지 설치
# CRAN에서 패키지 설치...
# update.packages() - 패키지 업데이트
# install.packages(repos) - repos 값은 저장소를 가리킴.. CRAN 기본 저장소...
# install.packages("package_name", repos="NULL")
install.packages("ggplot2", repos = "http://cran.us.r-project.org")
install.packages("collections")
install.packages("Rfast")
library(Rfast)

# 패키지 로드 및 언로드
# library() - 패키지를 메모리에 로드
library(ggplot2)
library(collections)

# require() - 패키지를 로드하고 성공여부를 반환
result <- require(ggplot2)
result
result2 <- require(collections)
result2
# detach() - 패키지를 언로드
detach(package:ggplot2, unload = TRUE)


# 패키지 제거 및 재설치
# remove.packages() - 설치된 패키지를 제거
#remove.packages("stacks")

#4. 패키지 검색 및 정보 확인
# installed.packages() - 설치된 패키지 목록을 확인
installed.packages()

# search() - 현재 로드된 패키지 및 객체의 목록 확인
search()
# sessionInfo() - 현재 세션의 R버전, 로그된 패키지 정보 등을 확인
sessionInfo()
# help() - 패키지의 도움말 페이지를 확인 
help(package="ggplot2")
# ?패키지명 -  도움말 확인
?ggplot2
# available.packages() - 사용가능한 패키지 목록 확인
available.packages()

#=====================================================================
# 패키지 관리 실습
# 1. 패키지 설치 - ggplot2, dplyr
install.packages("ggplot2")
install.packages("dplyr")

# 2. 패키지 로드
library(ggplot2)
library(dplyr)

# 로드된 패키지 확인
search()

#3. 패키지 업데이트
update.packages() # 페키지를 최신 버전으로 업데이트

#4. 패키지 제거
remove.packages("dplyr")
remove.packages("ggplot2")

#5. 설치된 패키지 목록 확인
installed.packages()

#6. 패키지 언로드
detach("package:dplyr", unload=TRUE)
detach("package:ggplot2")
#=====================================================================


install.packages("collections")
# 필요한 패키지 로드

library(collections)

# 스택 예제
stack_example <- function() {
  cat("\n--- Stack Example ---\n")
  
  # 스택 생성
  s <- stack()
  
  # 값 추가
  s$push(1)
  s$push(2)
  s$push(3)
  
  # 값 확인
  cat("Stack top:", s$peek(), "\n") # 3
  
  # 값 제거
  cat("Popped value:", s$pop(), "\n") # 3
  cat("Stack top after pop:", s$peek(), "\n") # 2
}

# 큐 예제
queue_example <- function() {
  cat("\n--- Queue Example ---\n")
  
  # 큐 생성
  q <- queue()
  
  # 값 추가
  q$push(1)
  q$push(2)
  q$push(3)
  
  # 값 확인
  cat("Queue front:", q$peek(), "\n") # 1
  
  # 값 제거
  cat("Dequeued value:", q$pop(), "\n") # 1
  cat("Queue front after dequeue:", q$peek(), "\n") # 2
}

# 데크 예제
deque_example <- function() {
  cat("\n--- Deque Example ---\n")
  
  # 데크 생성
  d <- deque()
  
  # 값 추가
  d$pushleft(1)
  d$push(2)
  d$pushleft(0)
  d$push(3)
  
  print(d$as_list())
  # 값 확인
  cat("Deque front:", d$peekleft(), "\n") # 0
  cat("Deque back:", d$peek(), "\n") # 3
  
  # 값 제거
  cat("Popped front value:", d$popleft(), "\n") # 0
  cat("Popped back value:", d$pop(), "\n") # 3
}

# 예제 실행
stack_example()
queue_example()
deque_example()


#==========================================================================
# R의 데이터 조작
# R에서 기본 제공 데이터 셋 : data() 명령어로 로딩...

# mtcars 데이터 셋을 이용한 조작 연습
# 1974 미국 자동차 잡지(Motor Trend)에 실린 여러 자동차의 성능 테스트 데이터

#1. 데이터셋 로드
data("mtcars")
# 데이터셋 요약
summary(mtcars)

print(mtcars)

# airquaility
# 1973년 뉴욕의 대기 질 측정 데이터
data("airquality")
airquality
na.omit(airquality)  # NA가 있다면, 생략 처리. 결측치 작업.
airquality <- na.omit(airquality)
class(airquality)

# 온도와 오존 농도 간의 관계 시각화
plot(airquality$Temp, airquality$Ozone, main = "Temp : Ozone", xlab = "Temperature(℉)", ylab = "Ozone")

plot

# 월별 대기 질 요약
aggregate(. ~ Month, data=airquality, summary)

# cars
# 1920년대 자동차의 속도와 제동 거리 데이터
data("cars")
summary(cars)

# PlantGrowth
data("PlantGrowth")
summary(PlantGrowth)
print(PlantGrowth)

# 그룹별 평균 계산
aggregate(weight ~ group, data = PlantGrowth, mean)
aggregate(weight ~ group, data = PlantGrowth, sum)

data("InsectSprays")
print(InsectSprays)
aggregate(count ~ spray, data = InsectSprays, sum)
data("islands")
print(islands)
