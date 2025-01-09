# 반복문 for

for (i in 1:10) {
  print ( i )
}

# 벡터 반복
vec <- c("apple", "banana", "cherry")
for (fruit in vec) {
  print(fruit)
}

# 리스트 반복
lst <- list(name = "Alice", age = 30, city = "New York")
for (item in lst) {
  print(item)
}



# 중첩된 for 반복문

# 2x3 행렬을 반복하며 출력
matrix_data <- matrix(1:6, nrow = 2, ncol = 3)

for (i in 1:nrow(matrix_data)) {
  for (j in 1:ncol(matrix_data)) {
    cat("Row:", i, "Col:", j, "Value:", matrix_data[i, j], "\n")
  }
}


# for 문에서의 인덱스 활용

# 벡터와 인덱스 활용
vec <- c(10, 20, 30, 40, 50)
for (i in 1:length(vec)) {
  cat("Index:", i, "Value:", vec[i], "\n")
}


# seq_along 또는 seq_len과 함께 사용하는 for 반복문

# seq_along을 사용한 반복
vec <- c("red", "green", "blue")
for (i in seq_along(vec)) {
  cat("Color:", vec[i], "\n")
}

# seq_len을 사용한 반복
n <- 5
for (i in seq_len(n)) {
  print(i)
}


# next와 break를 사용하는 for 반복문

# next를 사용하여 3을 건너뛰기
for (i in 1:5) {
  if (i == 3) {
    next
  }
  print(i)
}

# break를 사용하여 반복 종료
for (i in 1:5) {
  if (i == 3) {
    break
  }
  print(i)
}

