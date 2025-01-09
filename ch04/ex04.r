# 행렬(Matrix)
# 벡터와 마찬가지로 행렬에는 한 가지 유형의 스칼라만 저장
# 모든 요소가 숫자인 행렬은 가능하지만, ‘1열은 숫자, 2열은 문자열’과 같은 형태는 불가능

# 행 개수를 지정, 열은 자동
m1 = matrix(c(1,2,3,4,5,6,7,8,9), nrow=4)
m1

# 열 개수를 지정, 행은 자동
m2 = matrix(c(1,2,3,4,5,6,7,8,9), ncol=4)
m2

# 행 부터 채우기
m3 = matrix(c(1,2,3,4,5,6,7,8,9), nrow=2, byrow=T)
m3

# 행과 열에 이름을 부여
m4 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, dimnames=list(c("item1","item2","item3"), c("feature1","feature2","feature3")))
m4

# 행렬 내 요소의 접근
m4[1]
m4[1,]
m4[,1]
m4[-1]
m4[1,2]
m4[1:2,2]
m4[1:2,1:2]
m4["item2",]
m4[,"feature2"]
m4["item2",1]
m4[3,"feature2"]


# 행렬의 연산
m5 <- matrix(1:9, ncol=3, nrow=3)
m5*2
m5/2
m5+m5
m5-m5
m5%*%m5             # 행렬곱


m5 <- matrix(c(3,2,3,2,4,6,4,6,9), nrow=3, ncol=3)



# 역행렬 : solve()
# 행렬식 계산
det_m5 <- det(m5)

# 행렬식이 0인지(특이행렬) 확인
if (det_m5 == 0) {
  print("이 행렬은 특이행렬입니다. 역행렬이 존재하지 않습니다.") } else {
  inverse_m5 <- solve(m5)
  print("역행렬:")
  print(inverse_m5)
}

library(MASS)

# 일반화 역행렬 계산
pseudo_inverse_m5 <- ginv(m5)
print("일반화 역행렬:")
print(pseudo_inverse_m5)



# 전치 행렬 : t()
t_m5 <- t(m5)
t_m5


# 행렬의 요소의 수
length(m5)
ncol(m5)
nrow(m5)
