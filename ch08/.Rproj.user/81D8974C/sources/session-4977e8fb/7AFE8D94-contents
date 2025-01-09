data(ToothGrowth)

# 데이터셋 구조 확인
str(ToothGrowth)

# 데이터셋 미리보기
head(ToothGrowth)

# 치아 길이에 대한 기초 통계량 확인
summary(ToothGrowth$len)

# 비타민 C의 공급원과 용량에 따른 치아 길이의 변화 시각화
# ggplot2 패키지 로드
library(ggplot2)

# 비타민 C 공급원별 치아 길이의 분포 시각화
ggplot(ToothGrowth, aes(x = dose, y = len, color = supp)) +
  geom_boxplot() +
  labs(title = "비타민 C 공급원 및 용량에 따른 치아 길이",
       x = "비타민 C 용량 (mg)",
       y = "치아 길이 (mm)",
       color = "보충제") +
  theme_minimal()


# 비타민 C 공급원과 용량에 따른 치아 길이 평균 비교
# 공급원과 용량에 따른 치아 길이의 평균을 비교하기 위해 aggregate 함수 또는 dplyr 패키지 사용
# aggregate 함수로 평균 계산
aggregate(len ~ supp + dose, data = ToothGrowth, FUN = mean)

# dplyr 패키지 사용 예
library(dplyr)

ToothGrowth %>%
  group_by(supp, dose) %>%
  summarise(mean_length = mean(len, na.rm = TRUE))


# 치아 길이와 비타민 C 용량의 관계 분석
# 비타민 C의 용량에 따라 치아 길이의 변화 분석과 ggplot2를 사용하여 산점도와 선형 회귀선 시각화
# 비타민 C 용량에 따른 치아 길이 시각화
ggplot(ToothGrowth, aes(x = dose, y = len, color = supp)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "비타민 C 용량에 따른 치아 길이 변화",
       x = "비타민 C 용량 (mg)",
       y = "치아 길이 (mm)",
       color = "보충제") +
  theme_minimal()


# 비타민 C 공급원과 용량에 따른 ANOVA 분석
# ANOVA 분석
aov_result <- aov(len ~ supp * dose, data = ToothGrowth)

# ANOVA 결과 출력
summary(aov_result)