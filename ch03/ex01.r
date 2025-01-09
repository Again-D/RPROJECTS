# 조건문 IF

# 단순 IF
if (TRUE) print("OK")


# IF~ELSE
if (TRUE) {
  print(TRUE)
  print("hello")
} else {
  print (FALSE)
  print ("world")
}


# IF~ELSE IF~ELSE~
n1=88

if (n1>=90) {
  print("A")
} else if(n1>=80){
  print("B")
} else if(n1>=70){
  print("C")
} else if(n1>=60){
  print("D")
} else {
  print("E")
}


# 다단계 중첩 if

jum = 87
grade = "F" 

if (jum >= 90) {  # A등급
  if (jum >= 97) {
    grade <- "A+"
  } else if (jum >= 93) {
    grade <- "A0"
  } else {
    grade <- "A-"
  }
} else if (jum >= 80) {  # B등급
  if (jum >= 87) {
    grade <- "B+"
  } else if (jum >= 83) {
    grade <- "B0"
  } else {
    grade <- "B-"
  }
} else if (jum >= 70) {  # C등급
  if (jum >= 77) {
    grade <- "C+"
  } else if (jum >= 73) {
    grade <- "C0"
  } else {
    grade <- "C-"
  }
} else if (jum >= 60) {  # D등급
  if (jum >= 67) {
    grade <- "D+"
  } else if (jum >= 63) {
    grade <- "D0"
  } else {
    grade <- "D-"
  }
} else {  # F등급
  grade <- "F"
}

cat("점수:", jum, "학점:", grade, "\n")


# ifelse 문
x <- c(5, 2, 9)
result <- ifelse(x > 3, "크다", "작다")
print(result)
