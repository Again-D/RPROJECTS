# 기본 while 반복문

i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1  # 루프를 빠져나오기 위해 i 값을 증가시킴
}


# 무한 루프 (조건이 항상 참인 경우)

i <- 1
while (TRUE) {
  print(i)
  i <- i + 1
  if (i > 5) {
    break  # i가 5보다 클 때 루프를 종료
  }
}


# next 문을 사용하여 반복 건너뛰기

i <- 1
while (i <= 5) {
  i <- i + 1
  if (i == 3) {
    next  # i가 3일 때 아래 코드를 실행하지 않고 다음 반복으로 넘어감
  }
  print(i)
}


# 조건이 거짓일 때까지 실행되는 while 반복문

x <- 10
while (x > 0) {
  print(x)
  x <- x - 1
}


# while 문을 이용한 사용자 입력 처리

repeat_input <- TRUE
while (repeat_input) {
  input <- readline(prompt="Type 'stop' to end: ")
  if (input == "stop") {
    repeat_input <- FALSE
  } else {
    print(paste("You typed:", input))
  }
}


# 중첩 while 문

# 행렬 초기화
matrix_data <- matrix(1:6, nrow = 2, ncol = 3)

# 행렬의 크기 구하기
num_rows <- nrow(matrix_data)
num_cols <- ncol(matrix_data)

# 외부 루프: 행을 반복
row <- 1
while (row <= num_rows) {
  # 내부 루프: 열을 반복
  col <- 1
  while (col <= num_cols) {
    # 각 요소 출력
    cat("Row:", row, "Col:", col, "Value:", matrix_data[row, col], "\n")
    col <- col + 1
  }
  row <- row + 1
}


# next와 break를 사용한 중첩 while 문

row <- 1
while (row <= 3) {
  col <- 1
  while (col <= 3) {
    if (row == col) {
      col <- col + 1
      next  # row와 col이 같은 경우 출력 건너뜀
    }
    cat("Row:", row, "Col:", col, "\n")
    if (row == 2 && col == 2) {
      break  # row와 col이 모두 2일 때 내부 루프 종료
    }
    col <- col + 1
  }
  row <- row + 1
}


# 중첩 while 문 - 특정 조건에서 루프 중단하기

row <- 1
while (row <= 3) {
  col <- 1
  while (col <= 3) {
    cat("Row:", row, "Col:", col, "\n")
    if (row == 2 && col == 2) {
      cat("Breaking out of both loops.\n")
      row <- 4  # 외부 루프 조건을 벗어나도록 설정하여 전체 종료
      break
    }
    col <- col + 1
  }
  row <- row + 1
}


