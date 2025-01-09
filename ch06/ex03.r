# 패키지 설치 및 로드
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("writexl", quietly = TRUE)) {
  install.packages("writexl")
}
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}
if (!requireNamespace("h5", quietly = TRUE)) {
  install.packages("h5")
}

library(readr)
library(readxl)
library(writexl)
library(jsonlite)
library(h5)

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
write_csv(data.frame(Name = c("John", "Jane"), Age = c(30, 25)), csv_file)

# CSV 파일 읽기
csv_data <- read_csv(csv_file)
cat("\n--- CSV File Contents ---\n")
print(csv_data)

# 3. XLSX 파일 처리
xlsx_file <- "example.xlsx"

# XLSX 파일에 데이터 쓰기
write_xlsx(data.frame(Name = c("Alice", "Bob"), Score = c(90, 85)), xlsx_file)

# XLSX 파일 읽기
xlsx_data <- read_xlsx(xlsx_file)
cat("\n--- XLSX File Contents ---\n")
print(xlsx_data)

# 4. JSON 파일 처리
json_file <- "example.json"

# JSON 파일에 데이터 쓰기
json_data <- toJSON(list(Name = "Charlie", Age = 35))
write(json_data, json_file)

# JSON 파일 읽기
json_read_data <- fromJSON(json_file)
cat("\n--- JSON File Contents ---\n")
print(json_read_data)

# 5. HDF5 파일 처리
h5_file <- "example.h5"

# HDF5 파일에 데이터 쓰기
h5createFile(h5_file)  # HDF5 파일 생성
h5write(matrix(1:9, nrow = 3), h5_file, "dataset")  # 데이터 쓰기

# HDF5 파일 읽기
h5_data <- h5read(h5_file, "dataset")
cat("\n--- HDF5 File Contents ---\n")
print(h5_data)
