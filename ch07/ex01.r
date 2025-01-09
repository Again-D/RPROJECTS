# 필요한 패키지 설치 및 로드
if (!require("sqldf")) install.packages("sqldf", dependencies = TRUE)
library(sqldf)

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
