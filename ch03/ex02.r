# switch 문
# switch 문은 특정 값에 따라 여러 선택지 중 하나를 실행합니다. 이는 일반적으로 여러 조건을 처리할 때 사용됩니다.

# 숫자형 인덱스를 사용하는 경우

x <- 2
result <- switch(x,
                 "첫 번째 옵션",
                 "두 번째 옵션",
                 "세 번째 옵션")
print(result)
# [1] "두 번째 옵션"


# 문자형 값을 사용하는 경우:
day <- "화요일"
result <- switch(day,
                 "월요일" = "일주일의 시작",
                 "화요일" = "일이 많은 날",
                 "수요일" = "중간",
                 "일요일" = "쉬는 날",
                 "알 수 없는 요일")
print(result)
# [1] "일이 많은 날"

