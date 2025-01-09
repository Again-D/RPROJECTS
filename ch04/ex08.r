# 타입 변환

# vector()
# matrix()
# array()
# list()
# data.frame()

d <- data.frame(matrix(c(1,2,3,4,5,6), ncol=2))
colnames(d) <- c("X","Y")
d

v <- c(1,2,3,4,5,6)


# 벡터(Vector)를 행렬(matrix)로 변환
m1 <- matrix(v, ncol=2)
m1
is.matrix(m1)

# 벡터(Vector)를 배열(array)로 변환
a1 <- array(v, dim = c(2, 3))
a1
is.array(a1)

# 벡터(Vector)를 리스트(list)로 변환
l1 <- list(v)
l1
is.list(l1)

# 벡터(Vector)를 데이터 프레임으로 변환
d1 <- data.frame(matrix(v, nrow=3, ncol=2))
d1
is.data.frame(d1)


m <- matrix(1:12, nrow=4, ncol=3)
m
# 행렬(matrix)를 벡터(Vector)로 변환
v2 <- c(m)
v2
is.vector(v2)

# 행렬(matrix)를 배열(array)로 변환
a2 <- array(m, dim=c(3,4))
a2
is.array(a2)

# 행렬(matrix)를 리스트(list)로 변환
l2 <- list(a=m[,1], b=m[,2], c=m[,3])
l2
is.list(l2)

# 행렬(matrix)를 데이터 프레임으로 변환
d2 <- data.frame(m)
d2
is.data.frame(d2)


a <- array(1:24, dim=c(2,3,4))
a
# Array(배열)을 벡터(Vector)로 변환
v3 <- c(a)
v3
is.vector(v3)

# Array(배열)을 행렬(matrix)로 변환
m3 <- matrix(a, nrow=4, ncol=6)
m3
is.matrix(m3)

# Array(배열)을 리스트(list)로 변환
l3 <- list(a, nrow=6)
l3
is.list(l3)

# Array(배열)을 데이터 프레임으로 변환
d3 <- data.frame(matrix(a, ncol=4))
d3
is.data.frame(d3)


l = list(x=c(1,2,3),y=c(4,5,6),z=c(7,8,9))
l
# 리스트(list)를 벡터(Vector)로 변환
v4 <- unlist(l)
v4
is.vector(v4)

# 리스트(list)를 행렬(matrix)로 변환
m4 <- do.call(cbind, l)
m4
is.matrix(m4)

# 리스트(list)를 Array(배열)로 변환
a4 <- list(l)
a4
is.list(a4)

# 리스트(list)를 데이터 프레임으로 변환
d4 <- data.frame(l)
d4
is.data.frame(d4)


matrix_data <- matrix(1:20, nrow = 4, ncol = 5)
df <- data.frame(matrix_data, row.names = c("kim", "lee", "park", "choi"))
df
# 데이터 프레임을 벡터(Vector)로 변환
v5 <- unlist(df)
v5
is.vector(v5)

# 데이터 프레임을 행렬(matrix)로 변환
m5 <- as.matrix(df, nrow=4, ncol=5)
m5
is.matrix(m5)

# 데이터 프레임을 Array(배열)로 변환
a5 <- as.array(as.matrix(df))
a5
is.array(a5)

# 데이터 프레임을 리스트(list)로 변환
l5 <- list(df)
l5
is.list(l5)
