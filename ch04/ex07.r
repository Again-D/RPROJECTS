# 타입 판별
class(c(1,2,3))
class(matrix(c(1,2,3)))
class(array(c(1,2,3)))
class(list(c(1,2,3)))
class(data.frame(x=c(1,2,3)))

class(c(1:10))
class(matrix(1:10))
class(array(1:10))
class(data.frame(1:10))

# 정보 출력
str(c(1,2,3))
str(matrix(c(1,2,3)))
str(array(c(1,2,3)))
str(list(c(1,2,3)))
str(data.frame(x=c(1,2,3)))

# 타입 확인
is.numeric(c(1,2,3))
is.numeric(c("a","b","c"))
is.character(c(1,2,3))
is.character(c("a","b","c"))
is.matrix(matrix(c(1,2,3)))
is.array(array(c(1,2,3)))
is.list(list(c(1,2,3)))
is.data.frame(data.frame(x=c(1,2,3)))
