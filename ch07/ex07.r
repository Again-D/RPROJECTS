# 필요한 패키지 설치 및 로드
if (!require("testthat")) install.packages("testthat", dependencies = TRUE)
library(testthat)

# 함수 정의
add_numbers <- function(a, b) {
  return(a + b)
}

multiply_numbers <- function(a, b) {
  return(a * b)
}

# 테스트 함수 정의
test_that("add_numbers works correctly", {
  expect_equal(add_numbers(1, 2), 3)          # 1 + 2 = 3
  expect_equal(add_numbers(-1, 1), 0)         # -1 + 1 = 0
  expect_equal(add_numbers(0, 0), 0)          # 0 + 0 = 0
  expect_error(add_numbers("a", 2), "non-numeric argument") # 에러 테스트
})

test_that("multiply_numbers works correctly", {
  expect_equal(multiply_numbers(2, 3), 6)     # 2 * 3 = 6
  expect_equal(multiply_numbers(-1, 5), -5)   # -1 * 5 = -5
  expect_equal(multiply_numbers(0, 10), 0)    # 0 * 10 = 0
  expect_error(multiply_numbers("a", 2), "non-numeric argument") # 에러 테스트
})

# 테스트 실행
cat("--- Running Tests ---\n")
test_results <- test_file("test_script.R")
print(test_results)

