# 필요한 패키지 설치 및 로드
# 기본 R 그래픽 시스템을 사용하므로 패키지 설치는 필요하지 않음

# 데이터 생성
set.seed(42)  # For reproducibility
x <- rnorm(100)
y <- rnorm(100)

# Base R 그래픽을 사용한 다양한 그래픽 옵션 적용

# 1. 기본 산점도
cat("--- Basic Scatter Plot ---\n")
plot(x, y, 
     main = "Basic Scatter Plot", 
     xlab = "X Axis", 
     ylab = "Y Axis")

# 2. 점의 종류(pch), 크기(cex), 색상(col)
cat("\n--- Scatter Plot with Custom Points ---\n")
plot(x, y, 
     main = "Customized Points", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 17,         # Point character (filled triangle)
     cex = 1.5,        # Point size
     col = "red")      # Point color

# 3. 좌표축 값의 범위(xlim, ylim)
cat("\n--- Scatter Plot with Custom Axis Limits ---\n")
plot(x, y, 
     main = "Custom Axis Limits", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     xlim = c(-3, 3), # X-axis limits
     ylim = c(-3, 3), # Y-axis limits
     pch = 19,        # Point character (solid circle)
     col = "blue")

# 4. 점의 종류와 색상 변화
cat("\n--- Scatter Plot with Different Point Types and Colors ---\n")
plot(x, y, 
     main = "Different Point Types and Colors", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = c(16, 17, 18)[sample(1:3, 100, replace = TRUE)], # Random point shapes
     col = rainbow(100))  # Random colors from a rainbow palette

# 5. 선 그래프와 점 (type 옵션 사용)
cat("\n--- Plot with Lines and Points (type = 'b') ---\n")
plot(x, y, 
     main = "Lines and Points", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     type = "b",       # Both lines and points
     pch = 19,         # Point character (solid circle)
     col = "green")

# 6. 점의 종류, 크기, 색상 적용 후 선 추가
cat("\n--- Scatter Plot with Custom Points and Line ---\n")
plot(x, y, 
     main = "Customized Points with Line", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 18,         # Point character (solid diamond)
     cex = 1.2,        # Point size
     col = "purple",   # Point color
     xlim = c(-3, 3), 
     ylim = c(-3, 3))
abline(h = 0, col = "red", lty = 2)  # Horizontal line at y = 0
abline(v = 0, col = "blue", lty = 2)  # Vertical line at x = 0

