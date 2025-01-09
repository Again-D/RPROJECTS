# 파이 그래프(pie) 실습 예제

# 데이터 생성
slices <- c(10, 20, 30, 40)
labels <- c("Category A", "Category B", "Category C", "Category D")
colors <- c("red", "blue", "green", "yellow")

# 1. 기본 파이 그래프
pie(slices, labels = labels, main = "Basic Pie Chart")

# 2. 파이 그래프에 색상 지정
pie(slices, labels = labels, main = "Pie Chart with Colors", col = colors)

# 3. 파이 그래프에 퍼센트 표시
percent_labels <- paste0(round(slices / sum(slices) * 100), "%")
pie(slices, labels = percent_labels, main = "Pie Chart with Percentages", col = colors)

# 4. 파이 그래프의 조각 분리
explode <- c(0.1, 0, 0, 0) # 첫 번째 조각을 약간 분리
pie(slices, labels = percent_labels, main = "Pie Chart with Exploded Slice", col = colors, explode = explode)

# 5. 파이 그래프에 범례 추가
pie(slices, labels = percent_labels, main = "Pie Chart with Legend", col = colors)
legend("topright", legend = labels, fill = colors)

# 6. 파이 그래프에 텍스트 레이블 추가
pie(slices, labels = NULL, main = "Pie Chart with Text Labels")
text(x = 0.5 * cos(seq(0, 2*pi, length.out = length(slices) + 1)), 
     y = 0.5 * sin(seq(0, 2*pi, length.out = length(slices) + 1)),
     labels = percent_labels, cex = 0.8, col = "black")
