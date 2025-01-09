# 필요한 패키지 설치 및 로드
if (!require("RMySQL")) install.packages("RMySQL", dependencies = TRUE)
library(RMySQL)

# 데이터베이스 연결 설정
host <- "localhost"
dbname <- "company"
port <- 3306
user <- "root"
password <- "1234"

# MySQL 데이터베이스에 연결
con <- dbConnect(MySQL(), 
                 dbname = dbname, 
                 host = host, 
                 port = port, 
                 user = user, 
                 password = password)

# 1. 테이블 목록 확인
cat("--- List of Tables ---\n")
tables <- dbListTables(con)
print(tables)

# 2. 테이블 구조 확인
cat("\n--- Structure of 'employee' Table ---\n")
employee_structure <- dbGetQuery(con, "DESCRIBE employee")
print(employee_structure)

# 3. 데이터 조회: 'employee' 테이블에서 데이터 가져오기
cat("\n--- Data from 'employee' Table ---\n")
employee_data <- dbGetQuery(con, "SELECT * FROM employee")
print(employee_data)

# 4. 데이터 삽입: 'employee' 테이블에 새로운 행 추가
cat("\n--- Inserting Data into 'employee' Table ---\n")
dbSendQuery(con, "INSERT INTO employee (id, name, position, salary) VALUES (5, 'Sam', 'Analyst', 55000)")

# 데이터 변경 사항 확인
employee_data_updated <- dbGetQuery(con, "SELECT * FROM employee")
print(employee_data_updated)

# 5. 데이터 수정: 'employee' 테이블에서 특정 데이터 수정
cat("\n--- Updating Data in 'employee' Table ---\n")
dbSendQuery(con, "UPDATE employee SET salary = 60000 WHERE id = 5")

# 데이터 변경 사항 확인
employee_data_updated <- dbGetQuery(con, "SELECT * FROM employee")
print(employee_data_updated)

# 6. 데이터 삭제: 'employee' 테이블에서 특정 데이터 삭제
cat("\n--- Deleting Data from 'employee' Table ---\n")
dbSendQuery(con, "DELETE FROM employee WHERE id = 5")

# 데이터 변경 사항 확인
employee_data_final <- dbGetQuery(con, "SELECT * FROM employee")
print(employee_data_final)

# 7. 테이블 삭제
cat("\n--- Dropping 'employee' Table ---\n")
dbSendQuery(con, "DROP TABLE IF EXISTS employee")

# 8. 연결 종료
dbDisconnect(con)

cat("\n--- Database Connection Closed ---\n")
