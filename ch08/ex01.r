# 필요한 패키지 설치 및 로드
if (!require("ggplot2")) install.packages("ggplot2", dependencies = TRUE)
if (!require("lattice")) install.packages("lattice", dependencies = TRUE)
library(ggplot2)
library(lattice)

# 데이터 생성
set.seed(123)  # For reproducibility
data <- data.frame(
  x = rnorm(100, mean = 5, sd = 2),
  y = rnorm(100, mean = 3, sd = 1)
)

# Base R 그래픽을 사용한 산점도
cat("--- Base R Scatter Plot ---\n")
plot(data$x, data$y, 
     main = "Base R Scatter Plot", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19,          # Point character (solid circle)
     col = "blue")      # Point color
abline(h = 0, col = "red", lty = 2)  # Horizontal line at y = 0
abline(v = 0, col = "green", lty = 2)  # Vertical line at x = 0

# ggplot2 패키지를 사용한 산점도
cat("\n--- ggplot2 Scatter Plot ---\n")
ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "ggplot2 Scatter Plot", x = "X Axis", y = "Y Axis") +
  theme_minimal()

# lattice 패키지를 사용한 산점도
cat("\n--- Lattice Scatter Plot ---\n")
xyplot(y ~ x, data = data,
       main = "Lattice Scatter Plot",
       xlab = "X Axis",
       ylab = "Y Axis",
       pch = 19,          # Point character (solid circle)
       col = "blue")

