# data.table 패키지 로드
library(data.table)

# 데이터 테이블 생성
dt <- data.table(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 35, 40, 45),
  Score = c(85, 90, 95, 80, 88)
)
print("Original data table:")
print(dt)

# 데이터 접근
print("Access specific columns:")
print(dt[, .(Name, Score)])
print("Access specific rows:")
print(dt[Age > 30])
print("Access specific columns and rows:")
print(dt[Age > 30, .(Name, Score)])

# 그룹 연산
print("Average Score by Age:")
print(dt[, .(AverageScore = mean(Score)), by = Age])

# 키 설정 및 탐색
setkey(dt, ID)
print("Search by key (ID = 3):")
print(dt[J(3)])

# 두 데이터 테이블 생성 및 병합
dt1 <- data.table(ID = 1:3, Value1 = c("A", "B", "C"))
dt2 <- data.table(ID = 2:4, Value2 = c("X", "Y", "Z"))
setkey(dt1, ID)
setkey(dt2, ID)
merged_dt <- dt1[dt2]
print("Merged data table:")
print(merged_dt)

# 데이터 수정
dt[Age > 30, Score := Score + 5]
print("Modified data table:")
print(dt)

# 데이터 테이블 결합
dt1 <- data.table(ID = 1:3, Value = c("A", "B", "C"))
dt2 <- data.table(ID = 4:6, Value = c("D", "E", "F"))
combined_dt <- rbindlist(list(dt1, dt2))
print("Combined data table:")
print(combined_dt)