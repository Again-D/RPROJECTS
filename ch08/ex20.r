# 산점도 행렬(pairs) 실습 예제

# 데이터 생성
# 'mtcars' 데이터셋을 사용하여 여러 변수 간의 관계를 시각화합니다.
data(mtcars)

# 1. 기본 산점도 행렬
pairs(mtcars, main = "Basic Scatterplot Matrix")

# 2. 특정 변수만 선택하여 산점도 행렬 생성
# 'mpg', 'hp', 'wt' 변수를 사용하여 산점도 행렬을 생성합니다.
selected_vars <- mtcars[, c("mpg", "hp", "wt")]
pairs(selected_vars, main = "Scatterplot Matrix of Selected Variables")

# 3. 산점도 행렬의 색상과 기호 지정
# 데이터의 'cyl' 변수에 따라 색상과 기호를 다르게 설정합니다.
pairs(mtcars, col = mtcars$cyl, pch = 21, bg = c("red", "green", "blue")[mtcars$cyl], 
      main = "Scatterplot Matrix with Colors and Symbols")

# 4. 산점도 행렬에 히스토그램 추가
# 대각선에 히스토그램을 추가하여 각 변수의 분포를 시각화합니다.
pairs(mtcars, diag.panel = panel.hist, main = "Scatterplot Matrix with Histograms")

# 5. 산점도 행렬에 회귀선 추가
# 각 산점도에 회귀선을 추가하여 변수 간의 관계를 더 명확하게 합니다.
panel.smooth <- function(x, y) {
  points(x, y, pch = 16, col = "blue")
  abline(lm(y ~ x), col = "red")
}
pairs(mtcars, panel = panel.smooth, main = "Scatterplot Matrix with Regression Lines")

# 6. 산점도 행렬의 대각선에 변수 이름 추가
# 각 변수의 이름을 대각선에 표시하여 변수 간의 관계를 명확하게 합니다.
pairs(mtcars, labels = c("MPG", "HP", "WT", "QSEC", "DRAT", "VS", "AM", "GEAR", "CARB"), 
      main = "Scatterplot Matrix with Custom Labels")
