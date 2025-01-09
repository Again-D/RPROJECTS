# 데이터셋 로드
data(PlantGrowth)

# 데이터셋 구조 확인
str(PlantGrowth)

# 데이터셋 미리보기
head(PlantGrowth)

# 식물 무게에 대한 기초 통계량 확인
summary(PlantGrowth$weight)

# 데이터 시각화
# 식이 조건별 식물 무게의 분포를 박스 플롯으로 시각화
# ggplot2 패키지 로드
library(ggplot2)

# 식이 조건별 식물 무게 분포 시각화
ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot() +
  labs(title = "식이 조건별 식물 무게 분포",
       x = "식이 조건",
       y = "식물 무게 (그램)") +
  theme_minimal()


# 식이 조건별 식물 무게의 평균 비교
# aggregate 함수로 평균 계산
aggregate(weight ~ group, data = PlantGrowth, FUN = mean)

# dplyr 패키지 사용 예
library(dplyr)

PlantGrowth %>%
  group_by(group) %>%
  summarise(mean_weight = mean(weight, na.rm = TRUE))


# 식이 조건별 ANOVA 분석
# ANOVA 분석
aov_result <- aov(weight ~ group, data = PlantGrowth)

# ANOVA 결과 출력
summary(aov_result)


# 식이 조건별 식물 무게의 차이 시각화
# 평균 식물 무게 시각화
ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  labs(title = "식이 조건별 평균 식물 무게",
       x = "식이 조건",
       y = "평균 식물 무게 (그램)") +
  theme_minimal()