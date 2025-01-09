# 데이터 생성
set.seed(42)  # For reproducibility
x <- seq(1, 10)
y <- c(1, 3, 4, 8, 5, 7, 10, 9, 6, 4)

# 기본 산점도 생성
plot(x, y, 
     main = "Scatter Plot with Text Labels", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue", 
     xlim = c(0, 12), 
     ylim = c(0, 12))

# 문자열 추가: 각 데이터 포인트에 레이블 추가
text(x, y, 
     labels = paste("Point", 1:10),  # 레이블을 "Point 1", "Point 2", ..., "Point 10"으로 설정
     pos = 4,  # 레이블 위치 조정: 1은 아래, 2는 왼쪽, 3은 위, 4는 오른쪽
     cex = 0.8,  # 레이블 크기
     col = "red")  # 레이블 색상

# 특정 데이터 포인트에 레이블을 더 강조
text(x[1], y[1], 
     labels = "Start Point", 
     pos = 3,  # 레이블 위치 조정: 위에 표시
     cex = 1.2,  # 더 큰 크기
     col = "green")  # 다른 색상

# 추가적인 텍스트 예제: 그래프의 특정 위치에 설명 추가
text(11, 10, 
     labels = "Sample Plot", 
     pos = 4, 
     cex = 1.5, 
     col = "purple", 
     font = 2)  # 글씨를 굵게

