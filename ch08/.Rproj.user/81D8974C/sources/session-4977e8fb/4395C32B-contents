# 필요한 패키지 로드
install.packages("fmsb")
install.packages("gridExtra")
install.packages("ggplot2")
install.packages("reshape2")
install.packages("viridis")

library(ggplot2)
library(gridExtra)
library(fmsb)
library(reshape2)
library(viridis)

# 임의의 데이터 생성
set.seed(123)

# 데이터 생성
bar_data <- data.frame(Category = factor(paste("Category", 1:5)), Value = sample(10:100, 5))
hbar_data <- data.frame(Category = factor(paste("Category", 1:5)), Value = sample(10:100, 5))
line_data <- data.frame(Time = seq(1, 10), Value = cumsum(runif(10)))
pie_data <- data.frame(Category = factor(paste("Category", 1:4)), Value = sample(10:100, 4))
donut_data <- pie_data
stock_data <- data.frame(Time = seq(1, 20), Price = cumsum(runif(20, -1, 1)))
surface_data <- expand.grid(x = 1:10, y = 1:10)
surface_data$z <- sin(surface_data$x) * cos(surface_data$y)
bubble_data <- data.frame(x = runif(20, 1, 10), y = runif(20, 1, 10), size = runif(20, 5, 20))
scatter_data <- data.frame(x = runif(50), y = runif(50))
area_data <- data.frame(Time = seq(1, 10), Value = runif(10, 0, 10))
hist_data <- data.frame(Value = rnorm(100))
box_data <- data.frame(
  Category = factor(rep(letters[1:4], each = 25)),
  Value = c(rnorm(25, mean = 5), rnorm(25, mean = 10),
            rnorm(25, mean = 15), rnorm(25, mean = 20))
)

# 레이더 차트 대신 히트맵을 위한 데이터 생성
heatmap_data <- matrix(runif(100, 0, 10), nrow = 10, ncol = 10)
colnames(heatmap_data) <- paste("Col", 1:10)
rownames(heatmap_data) <- paste("Row", 1:10)

# 그래프 생성
p1 <- ggplot(bar_data, aes(x = Category, y = Value)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "세로 막대 그래프")

p2 <- ggplot(hbar_data, aes(x = Value, y = Category)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  labs(title = "가로 막대 그래프")

p3 <- ggplot(line_data, aes(x = Time, y = Value)) +
  geom_line(color = "blue") +
  labs(title = "꺾은 선 그래프")

p4 <- ggplot(pie_data, aes(x = "", y = Value, fill = Category)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  labs(title = "원형 그래프") +
  theme_void()

p5 <- ggplot(donut_data, aes(x = "", y = Value, fill = Category)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  theme_void() +
  labs(title = "도넛형 그래프") +
  annotate("text", x = 1, y = 0, label = "Donut", size = 5)

p6 <- ggplot(stock_data, aes(x = Time, y = Price)) +
  geom_line(color = "red") +
  labs(title = "주식형 그래프")

p7 <- ggplot(melt(surface_data, id.vars = c("x", "y")), aes(x = x, y = y, fill = value)) +
  geom_tile() +
  labs(title = "표면형 그래프") +
  scale_fill_viridis_c()

p8 <- ggplot(bubble_data, aes(x = x, y = y, size = size)) +
  geom_point(alpha = 0.5) +
  labs(title = "거품형 그래프")

# 히트맵 그리기
p9 <- ggplot(melt(heatmap_data), aes(x = Var2, y = Var1, fill = value)) +
  geom_tile() +
  labs(title = "히트맵") +
  scale_fill_viridis_c() +
  theme_minimal() +
  xlab("Columns") +
  ylab("Rows")

p10 <- ggplot(scatter_data, aes(x = x, y = y)) +
  geom_point(color = "purple") +
  labs(title = "스캐터(분산형) 그래프")

p11 <- ggplot(area_data, aes(x = Time, y = Value)) +
  geom_area(fill = "orange", alpha = 0.5) +
  labs(title = "영역형 차트")

p12 <- ggplot(hist_data, aes(x = Value)) +
  geom_histogram(bins = 20, fill = "pink", color = "black") +
  labs(title = "히스토그램")

p13 <- ggplot(box_data, aes(x = Category, y = Value)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "박스 플롯")

# 모든 그래프를 4x4 그리드로 배열
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, ncol = 4)
