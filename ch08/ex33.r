# 데이터셋 로드
data(airquality)

# 데이터셋 구조 확인
str(airquality)

# 데이터셋 미리보기
head(airquality)

# 공기질 변수에 대한 기초 통계량 확인
summary(airquality)

# 결측값 처리
# airquality 데이터셋에는 결측값(NAs)이 포함되어 있을 수 있음

# 결측값 확인
sum(is.na(airquality))

# 결측값이 포함된 행 제거
airquality_clean <- na.omit(airquality)

# 결측값 제거 후 데이터셋 구조 확인
str(airquality_clean)


# 데이터 시각화
# ggplot2 패키지 로드
library(ggplot2)

# 기온과 오존 농도의 관계 시각화
ggplot(airquality_clean, aes(x = Temp, y = Ozone)) +
  geom_point(aes(color = Month), alpha = 0.7) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "기온과 오존 농도 간의 관계",
       x = "기온 (화씨)",
       y = "오존 농도 (ppb)") +
  theme_minimal()


# 월별 오존 농도 박스 플롯
ggplot(airquality_clean, aes(x = factor(Month), y = Ozone)) +
  geom_boxplot(aes(fill = factor(Month))) +
  labs(title = "월별 오존 농도 분포",
       x = "월",
       y = "오존 농도 (ppb)") +
  theme_minimal()


# 기온에 따른 오존 농도의 선형 회귀 분석
# 선형 회귀 모델 적합
model <- lm(Ozone ~ Temp, data = airquality_clean)

# 회귀 분석 결과 요약
summary(model)


# 회귀 진단 플롯
# 회귀 모델의 적합도를 평가하기 위해 진단 플롯 생성
# 회귀 진단 플롯 생성
par(mfrow = c(2, 2))  # 2x2 플롯 레이아웃 설정
plot(model)