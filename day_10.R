# RMySQL 패키지를 이용한 관계형 데이터베이스 다루기

# 패키지 설치
install.packages("RMySQL")
# 로드
library(RMySQL)

# dbConnect() 함수를 이용한 DB연결
#dbConnect(MySQL(), 
#          dbname = "database_name",
#          host = "hostname",
#          port = 3306,
#          user = "username",
#          password = "password")
# dbname: 데이터베이스 이름
# host: 데이터베이스 서버의 호스트 이름 (예: "localhost")
# port: MySQL 포트 번호 (기본값은 3306)
# user: MySQL 사용자 이름
# password: MySQL 비밀번호

con <- dbConnect(MySQL(),
          dbname = "rdbtest",
          host = "localhost",
          port = 3306,
          user = "root",
          password = "root1234")

# 쿼리 실행
# dbSendQuery(dbConnect, query)
# dbConnect 연결 객체 정보
# query SQL쿼리문

# 쿼리 결과
# dbFetch([dbSendQuery result])
query <- "select database()"
result <- dbSendQuery(con, query)
data <- dbFetch(result)
data

# 쿼리 실행 후 dbClearResult()를 사용하여 결과를 정리..
dbClearResult(result)

# 데이터베이스 연결 종료 dbDisconnect(con)
dbDisconnect(con)

#===================================================================
# 1. 테이블 목록 확인
cat("---- List of Table ----")
tables <- dbListTables(con) # "show tables;"
print(tables)

# 2. 테이블 구조 확인
cat("\n--- Structure of 'employee' Table ---\n")
employee_structure <- dbGetQuery(con, "describe employee")
print(employee_structure)

# 3. 테이블 조회 :
cat("\n--- Data from 'employee' Table ---\n")
employee_data <- dbGetQuery(con, "SELECT * FROM employee")
print(employee_data)

# 4. 데이터 삽입: 'employee' 테이블에 새로운 행 추가
cat("\n--- Inserting Data into 'employee' Table ---\n")
dbSendQuery(con, "insert into employee (name, position, salary) values ('Sam', 'Analyst', 55000)")
# 확인 
employee_data_add <- dbGetQuery(con, "select * from employee")
employee_data_add

# 5. 데이터 수정: 'employee' 테이블에서 특정 데이터 수정
cat("\n--- Updating Data in 'employee' Table ---\n")
dbSendQuery(con, "update employee set salary = 60000 where id = 10")
employee_data_updated <- dbGetQuery(con, "select * from employee")
employee_data_updated

# 데이터 삭제
dbSendQuery(con, " delete from employee where id = 10")
employee_data_delete <- dbGetQuery(con, "select * from employee")
employee_data_delete

# db 연결 종료
dbDisconnect(con)

# R의 데이터 처리...
# 1. sqldf 패키지...
#  R에서 SQL 쿼리를 사용하여 데이터프레임을 조작할 수 있게 해주는 패키지
# 패키지 설치
if (!requireNamespace("sqldf")) {
  install.packages("sqldf")
}
# 패키지 로드
library(sqldf)

# RMySQL과 연결되는 경우...
search()
detach(package:RMySQL, unload = TRUE) # 앞서 작업한 실습 unload
detach(package:sqldf, unload = TRUE)  # unload
# sqldf 패키지 로드
library(sqldf)

# 예제 데이터 프레임 생성
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30 , 35, 40, 45),
  Score = c(85, 90, 95, 80, 88)
)
result <- sqldf("select * from data")
result

# data 데이터 프레임에 나이가 30인 값들을 출력..
result <- sqldf("select * from data where Age >= 30")
print(result)

# Age를 기준으로 오름차순 정렬
result <- sqldf("SELECT * FROM data ORDER BY Age ASC")
print(result)

# 평균 Score 계산
result <- sqldf("SELECT AVG(Score) AS AverageScore FROM data")
print(result)

# Age 범위에 따른 평균 Score 계산 (예를 들어, Age를 30을 기준으로 그룹화)
result <- sqldf("SELECT CASE WHEN Age < 30 THEN 'Under 30' ELSE '30 and above' END AS AgeGroup,
                         AVG(Score) AS AverageScore
                  FROM data
                  GROUP BY AgeGroup")
print(result)

# 데이터 프레임 생성
employee <- data.frame(
  ID = 1:5,
  Name = c("John", "Jane", "Alice", "Bob", "Carol"),
  Position = c("Manager", "Developer", "Analyst", "Designer", "HR Specialist"),
  Salary = c(75000, 68000, 62000, 58000, 54000)
)

payment <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Month = c("January", "February", "March", "April", "May"),
  Amount = c(7500, 6800, 6200, 5800, 5400)
)

# 1. SQL 쿼리로 데이터 조회
cat("--- Query 1: Select all from employee ---\n")
result1 <- sqldf("SELECT * FROM employee")
print(result1)

# 2. SQL 쿼리로 특정 열과 조건으로 데이터 조회
cat("\n--- Query 2: Select Name and Salary from employee where Salary > 60000 ---\n")
result2 <- sqldf("SELECT Name, Salary FROM employee WHERE Salary > 60000")
print(result2)


# 3. SQL 쿼리로 JOIN 연산 수행
cat("\n--- Query 3: Join employee and payment tables on ID ---\n")
result3 <- sqldf("SELECT e.ID, e.Name, e.Position, e.Salary, p.Month, p.Amount 
                   FROM employee e
                   JOIN payment p
                   ON e.ID = p.ID")
print(result3)

# 4. SQL 쿼리로 GROUP BY 및 집계 함수 사용
cat("\n--- Query 4: Aggregate Salary by Position ---\n")
result4 <- sqldf("SELECT Position, AVG(Salary) AS Average_Salary 
                   FROM employee 
                   GROUP BY Position")
print(result4)

# 5. SQL 쿼리로 데이터 삽입
cat("\n--- Insert New Data into Employee Table ---\n")
# Note: sqldf does not support direct INSERT operations. Instead, you can modify the data frame and re-run queries.
# Here, we will demonstrate how to add a new row manually.
new_employee <- data.frame(ID = 6, Name = "David", Position = "Developer", Salary = 70000)
employee_updated <- rbind(employee, new_employee)

# Re-run a query to show updated data
cat("\n--- Updated Employee Data ---\n")
result5 <- sqldf("SELECT * FROM employee_updated")
print(result5)

# Clean up
rm(employee, payment, employee_updated, new_employee)

#2. plyr 패키지
# R에서 데이터를 그룹화하고 집계하는데 유용한 기능을 제공하는 패키지
# 주요 함수 : adply(), ddply(), transform(), summarise(), subset() 

if(!require(plyr)) {
  install.packages("plyr")
}
library(plyr)

# 예제 데이터 프레임 생성
data <- data.frame(
  ID = 1:6,
  Group = c("A","B","A","B","A","B"),
  Value = c(10, 20, 30, 40, 50, 60)
)

# adply() : 배열(또는 행렬)에 대해 함수를 적용하여 데이터 프레임으로 변환
result <- adply(data, 1, function(x) mean(x$Value))
print(result)
# 1은 행 방향(행별 작업 진행), 2를 사용하면 열 방향

# ddply() : 데이터 프레임을 그룹화하고, 각 그룹에 대해 함수를 적용하여 결과 반환
# Group별로 Value의 평균을 계산하는 예
result <- ddply(data, .(Group), summarise, AveargeValue = mean(Value))
# .(Group)은 데이터 프레임을 Group 열로 그룹화 하겠다는 의미
# summarise 는 집계함수 적용
print(result)

# transform() - 데이터 프레임의 열을 변환할 때 사용.
# 새로운 열 추가, 기존 열을 수정시 사용.
result <- transform(data, DoubleValue = Value * 2)
print(result)

# summarise() : ddply()와 함께 사용되며, 그룹화된 데이터에 대해 집계 통계를 계산...
result <- ddply(data, .(Group), summarise,
                TotalValue = sum(Value),
                AverageValue = mean(Value))
print(result)

# subset() : 데이터 프레임에서 조건에 맞는 행을 선택할 때 사용됨.
subset(data, Value >= 30)

# reshape2 패키지 : R에서 데이터를 "넓은 형식(wide format)"과 "긴 형식(long format)" 간에 변환할 수 있는 기능을 제공
# 주요 함수 : melt(), dcast()

# reshape2 패키지 설치
install.packages("reshape2")

# reshape2 패키지 로드
library(reshape2)
# 예제 데이터프레임 생성 (넓은 형식)
data_wide <- data.frame(
  ID = 1:3,
  Time1 = c(10, 20, 30),
  Time2 = c(15, 25, 35),
  Time3 = c(20, 30, 40)
)
print(data_wide)

# melt() : 데이터를 긴 형식으로 변환
data_long <- melt(data_wide, id.var = "ID", variable.name = "Time", value.name = "Score")
# id.vars는 고정할 열(여기서는 ID), variable.name은 변환된 열 이름,
# value.name은 해당 열의 값 이름
print(data_long)

# dcast() : 긴 형식의 데이터를 넓은 형식으로 변환
data_wide_recast <- dcast(data_long, ID ~ Time, value.var = "Score")
print(data_wide_recast)

# data.table 패키지
# R에서 효율적으로 대용량 데이터를 처리하고 조작할 수 있는 강력한 데이터 구조를 제공
# data.table은 데이터프레임보다 훨씬 더 빠르고 메모리 효율적인 데이터 조작을 가능하게 하며, 특히 대규모 데이터 분석에 유용

# data.table 패키지 설치
install.packages("data.table")

# data.table 패키지 로드
library(data.table)

# 데이터 테이블 생성
dt <-  data.table(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie","David", "Eve"),
  Age = c(25, 30, 35, 40, 45),
  Score = c(85, 90, 95, 80,88)
)
class(dt)
dt

# 특정 열
dt[, .(Name,Score)]
# 특정 행
dt[Age >30]
# 특정 열과 행
dt[Age>30, .(Name, Score)]


# 그룹 연산
# by 인자를 사용하여 그룹화된 연산을 수행할 수 있습니다.
# Age 별 평균 Score 계산
dt[, .(AverageScore = mean(Score)), by = Age]

# 키를 이용한 탐색
# data.table은 key를 설정하여 탐색 속도를 개선할 수 있음.
# setkey() 함수를 사용하여 키를 설정

# 키 설정
setkey(dt, ID)
dt
# 키를 사용한 탐색
dt[J(3)]

# 키를 사용한 데이터 테이블 병합
dt1 <- data.table(ID = 1:3, Value1 = c("A", "B", "C"))
dt2 <- data.table(ID = 2:4, Value2 = c("X", "Y", "Z"))

# 키 설정 후 병합
setkey(dt1, ID)
setkey(dt2, ID)

# join(조인 - 외부 조인)
merged_dt <- dt1[dt2]
# inner join : na.omit(dt1[dt2])
print(merged_dt)

# 참조를 사용한 데이터 수정
# data.table에서 참조(:=)를 사용하여 데이터를 효율적으로 수정
# 데이터 테이블 수정
dt[Age > 30, Score := Score + 5]  # Age가 30보다 큰 행의 Score를 5만큼 증가
print(dt)

# rbindlist 함수
# 여러개의 데이터 테이블을 행 방향으로 결합하는데 사용
dt1 <- data.table(ID = 1:3, Value = c("A","B","C"))
dt2 <- data.table(ID = 4:6, Value = c("D","E","F"))
dt3 <- data.table(ID = 7:9, Value = c("G","H","I"))

# 데이터 테이블 결합
combined_dt <- rbindlist(list(dt1, dt2, dt3))
print(combined_dt)

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
merged_dt <- na.omit(dt1[dt2])
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

# foreach 패키지
# 반복 작업을 수행할 때 유용한 도구.
# 병렬 처리와 분산 처리를 위해 다양한 백엔드를 지원하고, 반복 작업을 보다 효율적으로 처리할 수 있다.

# foreach 패키지 및 doParallel 패키지 설치
install.packages("foreach")
install.packages("doParallel")

# foreach 패키지 및 doParallel 패키지 로드
library(foreach)
library(doParallel)

# 기본 foreach 사용
result <- foreach(i = 1:5, .combine = c) %do% {
  i^2
}
# i는 반복변수, .combine = c는 결과를 벡터로결합.
# .combine는 인자에 따라 달라질 수 있음.
# %do% 는 연산자의 순차적으로 진행할 작업.
print(result)

# 병렬 처리
# foreach가 병렬 처리를 지원. 병렬 처리 지원을 위해서 먼저 병렬 클러스털를 설정.

#1. 병렬 클러스터 설정
c1 <- makeCluster(detectCores() - 1) # CPU 코드 수 - 1로 설정
registerDoParallel(c1)

#2. 병렬 처리와 함께 foreach 사용
result <- foreach(i = 1:5, .combine = c) %dopar% {
  Sys.sleep(1)    # 시간 지연을 통해서 병렬 처리 효과 보기
  i^2
}
print(result)

#3. 클러스터 종료 - 클러스터 작업이 완료되면 종료해야 함.
stopCluster(c1)

# .combine 인자 
#1. c
result <- foreach(i = 1:5, .combine = c) %do% {
  i^2
}
#2. list
result <- foreach(i = 1:5, .combine = 'list') %do% {
  list(i^2)
}

#3. data.frame(rbind)
result <- foreach(i = 1:5, .combine = rbind) %do% {
  data.frame(Value = i^2)
}
print(result)


# doMC 패키지 : 병렬 처리를 위한 백엔드로, 특히 Unix 계열 시스템(Linux 및 macOS)에서 사용할 수 있는 멀티코어 병렬 처리를 지원
# doMC를 사용하면 여러 프로세스를 동시에 실행하여 작업을 병렬화할 수 있으며, 이는 반복 작업의 성능을 크게 향상
# doMC 패키지는 Windows에서는 작동하지 않습니다.



