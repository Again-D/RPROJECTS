# 데이터셋 로드
data(mtcars)

# 데이터셋 구조 확인
str(mtcars)

# 데이터셋 미리보기
head(mtcars)

# 자동차 특성에 대한 기초 통계량 확인
summary(mtcars)

# 데이터 시각화
# ggplot2 패키지 로드
library(ggplot2)

# 연비와 차량 중량 간의 관계 시각화
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = factor(cyl)), size = 3) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "연비와 차량 중량 간의 관계",
       x = "차량 중량 (천 파운드)",
       y = "연비 (마일/갤런)",
       color = "실린더 수") +
  theme_minimal()


# 실린더 수와 마력 간의 관계 시각화
ggplot(mtcars, aes(x = cyl, y = hp)) +
  geom_boxplot(aes(fill = factor(cyl))) +
  labs(title = "실린더 수와 마력 간의 관계",
       x = "실린더 수",
       y = "마력") +
  theme_minimal()


# 선형 회귀 분석
# 선형 회귀 모델 적합
model <- lm(mpg ~ wt + cyl + hp, data = mtcars)

# 회귀 분석 결과 요약
summary(model)


# 회귀 진단 플롯
# 회귀 모델의 적합도를 평가하기 위해 진단 플롯 생성
# 회귀 진단 플롯 생성
par(mfrow = c(2, 2))  # 2x2 플롯 레이아웃 설정
plot(model)


# 변속기 유형에 따른 연비 비교
# 변속기 유형에 따른 연비 박스 플롯
ggplot(mtcars, aes(x = factor(am), y = mpg)) +
  geom_boxplot(aes(fill = factor(am))) +
  labs(title = "변속기 유형에 따른 연비",
       x = "변속기 유형 (0 = 자동, 1 = 수동)",
       y = "연비 (마일/갤런)") +
  theme_minimal()