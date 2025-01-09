# 외부 패키지를 이용한 파일 입출력
# -> 외부 패키지 설치 여부 확인 후 미 설치시 설치 진행
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

# -> 패키지 로딩
library(readr)
library(readxl)
library(writexl)
library(jsonlite)

# 테스트 파일 이름 지정
# TXT 파일 이름
txt_file <- "example.txt"

# TXT 파일에 데이터 쓰기(기본 패키지를 이용한 파일 쓰기)
writeLines(c("Line 1", "Line 2", "Line3"), txt_file)

# TXT 파일 읽기
txt_data <- readLines(txt_file)
txt_data
cat("\n---- TXT File contents ----\n")
print(txt_data)

#2. CSV 파일 처리
csv_file <- "example.csv"
# CSV 파일에 데이터 쓰기
write_csv(data.frame(Name=c("John", "Jane"), Age=c(30, 20)), csv_file)
# CSV 파일 읽기
csv_data <- read_csv(csv_file)
cat("\n---- CSV File contents ----\n")
print(csv_data)

#3. xlsx 파일 처리
xlsx_file <- "example.xlsx"
# XLSX 파일에 데이터 쓰기

