# 데이터 생성
set.seed(123)
x <- 1:10
y1 <- x + rnorm(10)
y2 <- x + rnorm(10, 2)
y3 <- x + rnorm(10, 4)

# 기본 산점도 생성
plot(x, y1, type = "o", col = "blue", pch = 19, 
     main = "Scatter Plot with Multiple Series and Legend", 
     xlab = "X Axis", 
     ylab = "Y Axis")

# 추가 데이터 시리즈를 산점도에 추가
lines(x, y2, type = "o", col = "red", pch = 17)
lines(x, y3, type = "o", col = "green", pch = 15)

# 범례 추가
legend("topright",                          # 범례 위치
       legend = c("Series 1", "Series 2", "Series 3"),  # 범례에 표시될 텍스트
       col = c("blue", "red", "green"),     # 각 텍스트와 일치하는 색상
       pch = c(19, 17, 15),                 # 각 텍스트와 일치하는 기호
       lty = 1,                             # 선의 종류
       cex = 0.8,                           # 범례의 글씨 크기
       bg = "lightgray")                    # 범례 배경 색상

# 범례 위치를 좌표로 지정하는 예제
legend(x = 8, y = 4, 
       legend = c("Series 1", "Series 2", "Series 3"), 
       col = c("blue", "red", "green"), 
       pch = c(19, 17, 15), 
       lty = 1, 
       cex = 0.8, 
       bg = "lightyellow", 
       box.lty = 1,        # 박스 선 스타일
       box.lwd = 2,        # 박스 선 두께
       box.col = "black")  # 박스 선 색상
