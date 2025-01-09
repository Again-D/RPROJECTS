# 등고선 그래프(contour) 실습 예제

# 1. 데이터 생성
# x, y, z를 위한 격자 데이터를 생성합니다.
x <- seq(-10, 10, length.out = 30)
y <- seq(-10, 10, length.out = 30)
z <- outer(x, y, function(x, y) sqrt(x^2 + y^2))

# 2. 기본 등고선 그래프
contour(x, y, z, main = "Basic Contour Plot")

# 3. 등고선 그래프의 색상 및 레벨 조정
contour(x, y, z, col = rainbow(10), levels = seq(0, 20, by = 2), 
        main = "Contour Plot with Colors and Levels")

# 4. 등고선 그래프에 레이블 추가
contour(x, y, z, main = "Contour Plot with Labels", 
        labels = TRUE)

# 5. 등고선 그래프의 라인 스타일 변경
contour(x, y, z, lty = 2, lwd = 2, col = "blue", 
        main = "Contour Plot with Line Styles")
