# 데이터셋 로드
data(cars)

# 데이터셋 구조 확인
str(cars)

# 데이터셋 미리보기
head(cars)

# 자동차 속도와 제동 거리에 대한 기초 통계량 확인
summary(cars)

# 데이터 시각화
# 속도와 제동 거리 간의 관계를 산점도 시각화/선형 회귀선 추가
# ggplot2 패키지 로드
library(ggplot2)

# 속도와 제동 거리 간의 관계 시각화
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "속도와 제동 거리 간의 관계",
       x = "속도 (마일/시간)",
       y = "제동 거리 (피트)") +
  theme_minimal()


# 선형 회귀 분석
# 속도와 제동 거리 간의 선형 회귀 모델
# 선형 회귀 모델 적합
model <- lm(dist ~ speed, data = cars)

# 회귀 분석 결과 요약
summary(model)


# 회귀 진단 플롯
# 회귀 분석의 적합도를 평가하기 위해 잔차와 기타 진단 플롯 생성
# 회귀 진단 플롯 생성
par(mfrow = c(2, 2))  # 2x2 플롯 레이아웃 설정
plot(model)