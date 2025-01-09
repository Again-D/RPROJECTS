# 리스트(List)
# 해싱 또는 딕셔너리에 해당하며, (키, 값) 형태의 데이터를 담는 연관 배열(associative array)

# 단순 리스트
x1 <- list(name = "kim", height = 174, weight = 71)
x1
x1$name
x1$height
x1$weight

# 중첩 리스트
x2 <- list(a = list(val = c(1,2,3)), b = list(val=c(1,2,3,4)))
x2

# 리스트의 요소 접근
x2$a
x2$b
x2$a$val
x2$b$val
x2[[1]]
x2[[2]]
x2[1]
x2[2]
x2[1:2]



