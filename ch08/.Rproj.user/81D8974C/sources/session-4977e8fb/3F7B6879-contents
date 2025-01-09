# 데이터 생성
set.seed(42)
x <- rnorm(10)
y <- rnorm(10)

# 기본 산점도 생성
plot(x, y, 
     main = "Scatter Plot with Data Identification", 
     xlab = "X Axis", 
     ylab = "Y Axis", 
     pch = 19, 
     col = "blue")

# 사용자가 클릭한 점의 인덱스를 반환하는 identify() 함수
# identify() 함수는 인터랙티브한 함수로, 실행 후 그래프 창에서 점을 클릭할 수 있음
identified_points <- identify(x, y, labels = paste("Point", 1:10))

# identified_points 변수에 저장된 인덱스 확인
print(identified_points)

# 클릭한 포인트에 텍스트 레이블 추가 (예: identify() 대신 직접 추가하는 방법)
# 여기서는 수동으로 클릭 대신 text()를 사용하여 식별 레이블을 추가합니다
text(x[identified_points], y[identified_points], 
     labels = paste("ID", identified_points), 
     pos = 3, 
     cex = 0.8, 
     col = "red")

# 클릭된 포인트에 특별한 강조를 추가 (점 크기, 색상 변경 등)
points(x[identified_points], y[identified_points], 
       pch = 19, 
       col = "red", 
       cex = 1.5)

# 그래프 창에서 identify() 함수를 활용한 식별 예시
# 실행 후 클릭한 점의 인덱스가 콘솔에 출력됩니다
