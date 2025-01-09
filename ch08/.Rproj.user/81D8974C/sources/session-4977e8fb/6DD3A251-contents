# 투시도(persp) 실습 예제

# 1. 데이터 생성
# x, y, z를 위한 격자 데이터를 생성합니다.
x <- seq(-10, 10, length.out = 30)
y <- seq(-10, 10, length.out = 30)
z <- outer(x, y, function(x, y) sqrt(x^2 + y^2))

# 2. 기본 투시도 그래프
persp(x, y, z, main = "Basic Perspective Plot")

# 3. 투시도 그래프의 색상 및 조명 추가
persp(x, y, z, col = "lightblue", theta = 30, phi = 30, 
      main = "Perspective Plot with Colors and Lighting")

# 4. 투시도 그래프의 눈금 조정
persp(x, y, z, col = "lightgreen", theta = 45, phi = 20, 
      ticktype = "detailed", main = "Perspective Plot with Detailed Ticks")

# 5. 투시도 그래프에 격자 추가
persp(x, y, z, col = "lightcoral", theta = 60, phi = 30, 
      ltheta = 120, shade = 0.5, main = "Perspective Plot with Grid Lines")
