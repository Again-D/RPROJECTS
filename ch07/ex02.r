# 필요한 패키지 설치 및 로드
if (!require("plyr")) install.packages("plyr", dependencies = TRUE)
library(plyr)

# 예제 데이터 프레임 생성
employee <- data.frame(
  ID = 1:6,
  Name = c("John", "Jane", "Alice", "Bob", "Carol", "David"),
  Department = c("HR", "IT", "IT", "Design", "HR", "IT"),
  Salary = c(75000, 68000, 62000, 58000, 54000, 70000)
)

# 1. ddply: 데이터 프레임을 그룹화하고 집계 함수 적용
cat("--- ddply Example: Average Salary by Department ---\n")
average_salary_by_department <- ddply(employee, .(Department), summarize, Average_Salary = mean(Salary))
print(average_salary_by_department)

# 2. llply: 리스트에 함수를 적용
cat("\n--- llply Example: Add 10% Bonus to Each Employee's Salary ---\n")
add_bonus <- function(salary) {
  return(salary * 1.10)
}
employee_with_bonus <- llply(employee$Salary, add_bonus)
employee_with_bonus_df <- data.frame(ID = employee$ID, Name = employee$Name, Department = employee$Department, Salary = unlist(employee_with_bonus))
print(employee_with_bonus_df)

# 3. adply: 데이터 프레임을 행렬로 변형하고 함수 적용
cat("\n--- adply Example: Apply Function to Each Row to Create Summary ---\n")
row_summary <- adply(employee, 1, function(row) {
  return(data.frame(
    ID = row$ID,
    Summary = paste(row$Name, "works in", row$Department, "department with salary", row$Salary)
  ))
})
print(row_summary)

# 4. dlply: 데이터 프레임을 그룹화하고 리스트로 반환
cat("\n--- dlply Example: List of Data Frames by Department ---\n")
department_list <- dlply(employee, .(Department))
print(department_list)

# 5. mapply: 벡터나 리스트에 함수를 병렬적으로 적용
cat("\n--- mapply Example: Calculate Total Compensation with 10% Bonus ---\n")
total_compensation <- mapply(function(salary) {
  return(salary * 1.10)
}, employee$Salary)
employee_total_compensation_df <- data.frame(ID = employee$ID, Name = employee$Name, Department = employee$Department, Total_Compensation = total_compensation)
print(employee_total_compensation_df)
