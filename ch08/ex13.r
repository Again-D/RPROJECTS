# 데이터 생성
set.seed(123)
# 10개의 관측치와 3개의 변수로 이루어진 행렬 생성
data_matrix <- matrix(rnorm(30, mean = 10, sd = 2), nrow = 10, ncol = 3)
colnames(data_matrix) <- c("Var1", "Var2", "Var3")

# matplot()을 사용한 행렬 데이터의 플로팅
matplot(data_matrix, type = "o", pch = 1:3, col = 1:3, 
        main = "Matrix Data Plot", 
        xlab = "Observation", 
        ylab = "Value")
legend("topright", legend = colnames(data_matrix), 
       col = 1:3, pch = 1:3, lty = 1)

# matlines()와 matpoints()를 사용한 추가 시각화
# 새로운 데이터 행렬 생성
new_data_matrix <- matrix(rnorm(30, mean = 12, sd = 2), nrow = 10, ncol = 3)
colnames(new_data_matrix) <- c("Var4", "Var5", "Var6")

# 기존 matplot 위에 새로운 데이터 행렬 추가
matlines(new_data_matrix, type = "o", pch = 4:6, col = 4:6)
legend("topleft", legend = c(colnames(data_matrix), colnames(new_data_matrix)), 
       col = 1:6, pch = 1:6, lty = 1)

# matpoints()를 사용하여 특정 지점 강조
matpoints(data_matrix, pch = 1:3, col = "black", cex = 1.5)
