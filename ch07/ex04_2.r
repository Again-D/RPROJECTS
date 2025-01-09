# 필요한 패키지 설치 및 로드
if (!require("data.table")) install.packages("data.table", dependencies = TRUE)
library(data.table)

# 예제 데이터 프레임 생성
data <- data.table(
  ID = 1:6,
  Name = c("John", "Jane", "Alice", "Bob", "Carol", "David"),
  Department = c("HR", "IT", "IT", "Design", "HR", "IT"),
  Salary = c(75000, 68000, 62000, 58000, 54000, 70000)
)

# 1. 데이터 테이블 생성 및 기본 출력
cat("--- Initial Data Table ---\n")
print(data)

# 2. 데이터 필터링
cat("\n--- Filter Example: Employees in IT Department ---\n")
it_employees <- data[Department == "IT"]
print(it_employees)

# 3. 데이터 정렬
cat("\n--- Sort Example: Employees by Salary (Descending) ---\n")
sorted_by_salary <- data[order(-Salary)]
print(sorted_by_salary)

# 4. 데이터 그룹화 및 집계
cat("\n--- Aggregation Example: Average Salary by Department ---\n")
avg_salary_by_dept <- data[, .(Average_Salary = mean(Salary)), by = Department]
print(avg_salary_by_dept)

# 5. 데이터 업데이트
cat("\n--- Update Example: Increase Salary by 10% for IT Department ---\n")
data[Department == "IT", Salary := Salary * 1.10]
print(data)

# 6. 데이터 병합
cat("\n--- Merge Example: Merge with Another Data Table ---\n")
additional_info <- data.table(
  ID = 1:6,
  Bonus = c(5000, 4500, 4000, 3500, 3000, 4700)
)
merged_data <- merge(data, additional_info, by = "ID")
print(merged_data)

# 7. 데이터의 합계 및 총계 계산
cat("\n--- Sum Example: Total Salary ---\n")
total_salary <- data[, sum(Salary)]
print(total_salary)

# 8. rbindlist을 이용한 데이터 결합
cat("\n--- rbindlist Example: Combine Data Tables ---\n")
new_data <- data.table(
  ID = 7:8,
  Name = c("Eve", "Frank"),
  Department = c("Marketing", "IT"),
  Salary = c(60000, 72000)
)
combined_data <- rbindlist(list(data, new_data))
print(combined_data)

# Clean up
rm(data, it_employees, sorted_by_salary, avg_salary_by_dept, merged_data, total_salary, new_data, combined_data)
