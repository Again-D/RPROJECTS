# 데이터 프레임(Data Frame)
# 행렬과 마찬가지의 모습을 하고 있지만 행렬과 달리 다양한 변수, 관측치(observations), 범주 등을 표현하기 위해 특화되어 있음

d1 <- data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10))
d1
View(d1)

d2 <- data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10), z=c("M","F","M","F","M"))
d2
View(d2)

# 새로운 데이터 추가
d2$v <- c(3,6,9,12,15)
d2


# 데이터 프레임 요소의 접근
d2$x
d2[1,2]
d2[c(1,3), 2]
d2[-1, -c(2,3)]
d2[, c("x","y")]
d2[, c("x"), drop=FALSE]
d2
str(d2)


# 행/열 이름 붙이기
d3 <- data.frame(x=1:120)
head(d3)
colnames(d3) <- c("val")
d3
head(d3)
names(d3) <- c("element")
head(d3)

d4 <- data.frame(1:3)
d4
colnames(d4) <- c("value")
rownames(d4) <- c("one","two","three")
d4

d5 <- data.frame(a=1:3, b=4:6, c=7:9)
d5
d6 <- d5[, names(d5) %in% c("b","c")]
d6
d7<-d5[, !names(d5) %in% c("a")]
d7





