# 필요한 패키지 로드
install.packages("stack")
install.packages("queue")
install.packages("deque")

library(stack)
library(queue)
library(deque)

# 스택 예제
stack_example <- function() {
  cat("\n--- Stack Example ---\n")
  
  # 스택 생성
  s <- stack()
  
  # 값 추가
  push(s, 1)
  push(s, 2)
  push(s, 3)
  
  # 값 확인
  cat("Stack top:", peek(s), "\n") # 3
  
  # 값 제거
  cat("Popped value:", pop(s), "\n") # 3
  cat("Stack top after pop:", peek(s), "\n") # 2
}

# 큐 예제
queue_example <- function() {
  cat("\n--- Queue Example ---\n")
  
  # 큐 생성
  q <- queue()
  
  # 값 추가
  enqueue(q, 1)
  enqueue(q, 2)
  enqueue(q, 3)
  
  # 값 확인
  cat("Queue front:", peek(q), "\n") # 1
  
  # 값 제거
  cat("Dequeued value:", dequeue(q), "\n") # 1
  cat("Queue front after dequeue:", peek(q), "\n") # 2
}

# 데크 예제
deque_example <- function() {
  cat("\n--- Deque Example ---\n")
  
  # 데크 생성
  d <- deque()
  
  # 값 추가
  push_front(d, 1)
  push_back(d, 2)
  push_front(d, 0)
  push_back(d, 3)
  
  # 값 확인
  cat("Deque front:", peek_front(d), "\n") # 0
  cat("Deque back:", peek_back(d), "\n") # 3
  
  # 값 제거
  cat("Popped front value:", pop_front(d), "\n") # 0
  cat("Popped back value:", pop_back(d), "\n") # 3
}

# 예제 실행
stack_example()
queue_example()
deque_example()
