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