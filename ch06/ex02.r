# 필요한 패키지 로드
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("writexl", quietly = TRUE)) {
  install.packages("writexl")
}
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}

library(readxl)
library(writexl)
library(jsonlite)

# 1. TXT 파일 처리
txt_file <- "example.txt"

# TXT 파일에 데이터 쓰기
writeLines(c("Line 1", "Line 2", "Line 3"), txt_file)

# TXT 파일 읽기
txt_data <- readLines(txt_file)
cat("\n--- TXT File Contents ---\n")
print(txt_data)

# 2. CSV 파일 처리
csv_file <- "example.csv"

# CSV 파일에 데이터 쓰기
write.csv(data.frame(Name = c("John", "Jane"), Age = c(30, 25)), csv_file, row.names = FALSE)

# CSV 파일 읽기
csv_data <- read.csv(csv_file)
cat("\n--- CSV File Contents ---\n")
print(csv_data)

# 3. XLS 파일 처리
xls_file <- "example.xlsx"

# XLS 파일에 데이터 쓰기
write_xlsx(data.frame(Name = c("Alice", "Bob"), Score = c(90, 85)), xls_file)

# XLS 파일 읽기
xls_data <- read_xlsx(xls_file)
cat("\n--- XLS File Contents ---\n")
print(xls_data)

# 4. JSON 파일 처리
json_file <- "example.json"

# JSON 파일에 데이터 쓰기
json_data <- toJSON(list(Name = "Charlie", Age = 35))
write(json_data, json_file)

# JSON 파일 읽기
json_read_data <- fromJSON(json_file)
cat("\n--- JSON File Contents ---\n")
print(json_read_data