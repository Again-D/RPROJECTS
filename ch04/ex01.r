# 요인(Factor)
# 요인(Factor)은 범주형(Categorical) 변수를 위한 데이터 타입
# 기본적으로 데이터에 순서가 없는 명목형 변수(Nominal)

sex <- factor ( " m " , c ( " m " , " f " ) )
sex

# 요소의 수
nlevels(sex)

# 요소의 값
levels(sex)

# 요소의 접근
levels(sex)[1]

levels(sex)[2]

# 값의 변경
levels(sex) <- c("male", "female")
sex


# 범주형(Categorical) 변수를 위한 데이터 타입
# 순서가 있는 값일 경우는 순서형(Ordinal) 변수

ordered(c("b","a","d","c"))
factor(c("b","a","d","c"), ordered = TRUE)

ordered(c("b","a","d","c"))
