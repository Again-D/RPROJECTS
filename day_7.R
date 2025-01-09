# 데이터 셋 예제중 Iris 데이터 셋
# iris 데이터셋은 R에서 기본저긍로 제공되는 가장 유명한 데이터 셋 중 하나로, 통계학과 기계학습의 기본 예제로 자주 사용됨.
# 이 데이터 셋은 Edger Anderson이 1936년에 수집한 것으로, R.A Fisher가 다변량 분석 기법을 개발할 때 사용
iris
?iris

# iris 데이터 셋의 구성
# 총 행(row) 수는 150, 열(column) 수는 5개

# 제공되는 변수들(column)...
# Sepal.Length (꽃 받침 길이) - 데이터 타입 : 숫자(numeric) 단위는 cm
# Sepal.Width (꽃 받침 넓이) - 데이터 타입 : 숫자 , 단위 cm
# Petal.Length (꽃잎 길이) - 데이터 타입 : 숫자, 단위 cm
# Petal.Width (꽃잎 넓이) - 데이터 타입 : 숫자, 단위 cm
# Species (종) - 붓꽃(Iris)의 세가지 품종. - 데이터 타입 : 팩터(factor), 값 setosa, versicolor, virginica

View(iris)
# 데이터셋 요약
summary(iris)
# 데이터셋 구조 확인
str(iris)
# 상위 6개 행을 보기
head(iris)
# 하위 6개 행을 보기
tail(iris)

# 꽃 받침 길이의 기본 통계량
summary(iris$Sepal.Length)
# 꽃 받침 너비의 기본 통계량
summary(iris$Sepal.Width)
# 꽃잎 길이의 기본 통계량
summary(iris$Petal.Length)
# 꽃잎 너비의 기본 통계량
summary(iris$Petal.Width)

# 종별 꽃 받침 길이 평균
aggregate(Sepal.Length ~ Species, data = iris, mean)
# 종별 꽃 받침 너비 평균
aggregate(Sepal.Length ~ Species, data = iris, mean)
# 졸별 꽃잎 길이 평균
aggregate(Petal.Length ~ Species, data = iris, mean)
# 종별 꽃잎 너비 평균
aggregate(Petal.Length ~ Species, data = iris, mean)

#===============================
#1. mtcars
data(mtcars)
print(head(mtcars))
summary(mtcars)

# mtcars 데이터셋의 mpg(연비)와 hp(마력) 간의 관계를 시각화
# 시각화를 위한 패키지.. ggplot2
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +geom_point() + labs(title = "HP VS MPG in mtcars", x= "Horsepower(hp)", y="Miles Per Gallon(mpg)")

# PlantGrowth
data("PlantGrowth")
print(PlantGrowth)
print(head(PlantGrowth))
summary(PlantGrowth)

# PlantGrowth 데이터 셋을 이용한 Group을 이용한 Okabt
ggplot(data = PlantGrowth, aes(x=group, y=weight))+ geom_boxplot()+labs(title = "Plant Weight by Group in PlantCrowth",x="Group",y="Weight (g)")

# ChickWeight 데이터셋의 Time에 따른 Chick의 weight 시각화
data("ChickWeight")
print(head(ChickWeight))
summary(ChickWeight)
?ChickWeight
ggplot(ChickWeight, aes(x = Time, y= weight, color = Chick))+geom_line()+labs(title = "Chick Weight Over Time", x="Time (days)", y="Weight (g)")

# sleep 데이터 셋
data("sleep")
summary(sleep)
?sleep
# extra(수면 증가량)

ggplot(sleep, aes(x= as.factor(group), y=extra))+geom_boxplot() + labs(title = "Extra Sleep by Group in sleep", x= "Group", y= "Extra Sleep(hours)")

# Titanic 데이터 셋
data("Titanic")
summary(Titanic)
View(head(Titanic))

class(Titanic) # table -> data.frame
titanic_df <-  as.data.frame(Titanic)
class(titanic_df)
ggplot(titanic_df, aes(x = Class, fill = Survived))+geom_bar(position = "fill")+labs(title = "Survival Rate by Class on Titanic", x= "Class", y= "Proportion")
#-------------------------------------------------------------------------------------------------
# 파일 입출력
# R언어에서 기본적으로 제공하는 패키지 라이브러리
# 별도의 설치가 필요 없음.
#1. 파일 쓰기
# writeLines() : 문자 벡터를 파일로 저장
writeLines(c(c("오늘", "내일", "모레"),c(0, -8, -14)), "outputfile.txt")
# write.csv() : 데이터 프레임을 CSV파일로 저장
# row.names = FALSE는 인덱스(row.name)을 저장X
write.csv(titanic_df, "outputfile2.csv", row.names = FALSE)
# write.table() : 데이터 프레임을 파일로 저장. 기본적으로 탭으로 구분된 파일을 생성
write.table(titanic_df, "output_df_file.txt", sep = "\t", row.names = FALSE)
# cat() : 문자 데이터를 파일에 출력. 주로 사용은 형식을 맞추기 위해 사용.
cat("Hello, World!!!", file = "cat_outputfile.txt")
# save() : R객체를 R의 이진형식으로 저장하는데 사용. 이 방식으로 저장된 파일은 .RData또는 .rda 확장자를 가지고, R의 load()함수를 사용하면 다시 불러올 수 있다.
# 여러 객체를 저장할 때,
x <- 1:10
y <- rnorm(100)
save(x,y, file = "mydata.RData")
# 하나만 저장할 때,
save(x, file = "x.RData")

#2. 파일 열기(open)
# file() : 파일을 열기 위한 연결을 생성. 이 함수는 파일을 읽거나 쓰기 위한 연결 객체를 반환.
con <- file("filename.txt", "r") # 읽기모드
con <- file("filename.txt", "w") # 쓰기모드

#3. 파일 닫기(close)
close(con)

#4. 파일 읽기 함수
# read.table() : 파일에서 데이터를 읽어와 데이터프레임으로 반환. 기본적으로 탭 또는 공백으로 구분된 파일을 읽는다.
table_titanic <- read.table("output_df_file.txt", header = TRUE)
table_titanic
# read.csv() : CSV 파일을 읽어 데이터 프레임으로 반환. 
csv_titanic <- read.csv("outputfile2.csv", header = TRUE)
csv_titanic

# readLines() : 파일의 각 행을 문자 벡터로 읽기.
lines <- readLines("outputfile.txt")
class(lines)
# scan() : 데이터를 읽어와 벡터로 반환. 주로 숫자 데이터를 읽어 들이는데 사용.
numbers <- scan("outputfile.txt", what = numeric())
class(numbers)
numbers
# load() : save() 함수로 저장된 R데이터 파일을 불러올 때 사용. 이 함수를 사용하면 저장된 객체를 현재 작업 공간으로 복원
load("x.RData")
x
load("mydata.RData")
y
x

test_df <- read.csv("test_20240709.csv", header = TRUE)
summary(test_df)

#=====================================================================================
# 외부 패키지를 이용한 파일 입출력
# readr 패키지
install.packages("readr")
library(readr)

data <- read_csv("outputfile_iris.csv")
data
class(data)

write_csv(iris, "outputfile_iris.csv")

# read_tsv() : 탭으로 구분된 파일을 읽어 옴. read_table()
data <- read_tsv("output_df_file.txt")
data
# write_tsv() : 탭으로 구분된 파일을 저장. write_table()

# readxl 패키지 - 엑셀 파일을 읽어 들일 수 있는 패키지.
install.packages("readxl")
library(readxl)
xlsx_iris <- read_xlsx("output_iris.xlsx", sheet = 1)
xlsx_iris <- read_excel("output_iris.xlsx", sheet = 1)
xlsx_iris
# writexl 패키지 - 데이터 프레임을 엑셀 파일로 저장할 수 있는 패키지
install.packages("writexl")
library(writexl)
# write_xlsx() : 데이터 프레임을 엑셀 파일로 저장.
write_xlsx(iris, "output_iris.xlsx")

# jsonlite 패키지 - json파일을 읽고 쓸 수 있는 패키지
install.packages("jsonlite")
library(jsonlite)
# fromJSON - json으로 부터 데이터(R객체)를 읽어옴.
data <- fromJSON("output_plantgrowth.json")
class(data)
data
# toJSON - json으로 데이터(R객체)를 저장.
toJSON(PlantGrowth, pretty = TRUE, auto_unbox = TRUE)
# 파일로 저장
writeLines(toJSON(PlantGrowth, pretty = TRUE, auto_unbox = TRUE), "output_plantgrowth.json")

data <- fromJSON("http://localhost:7634/aircraft")
data
View(data)
writeLines(toJSON(data, pretty = TRUE), "output_aircraft_positions.json")
ac <- fromJSON("output_aircraft_positions.json")
ac
