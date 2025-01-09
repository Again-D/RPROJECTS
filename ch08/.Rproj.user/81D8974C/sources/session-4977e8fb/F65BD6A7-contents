# 데이터셋 로드
data(ChickWeight)

# 데이터셋 구조 확인
str(ChickWeight)

# 데이터셋 미리보기
head(ChickWeight)

# 체중에 대한 기초 통계량 확인
summary(ChickWeight$weight)

# 데이터 시각화
# 병아리의 체중 변화 추이를 시각화
# ggplot2 패키지를 사용하여 나이에 따른 체중의 변화 그래프

# ggplot2 패키지 로드
library(ggplot2)

# 나이에 따른 체중 변화 시각화
ggplot(ChickWeight, aes(x = Time, y = weight, color = factor(Diet))) +
  geom_line(aes(group = Chick), alpha = 0.5) +
  labs(title = "병아리의 나이에 따른 체중 변화",
       x = "나이 (일수)",
       y = "체중 (그램)",
       color = "식이 조건") +
  theme_minimal()

# 식이 조건별 체중의 평균 비교
# aggregate 함수 또는 dplyr 패키지를 사용하여 분석
# aggregate 함수로 식이 조건별 체중 평균 계산
aggregate(weight ~ Diet, data = ChickWeight, FUN = mean)

# dplyr 패키지 사용 예
library(dplyr)

ChickWeight %>%
  group_by(Diet) %>%
  summarise(mean_weight = mean(weight, na.rm = TRUE))

# 식이 조건별 체중 변화 시각화
ggplot(ChickWeight, aes(x = Time, y = weight, color = factor(Diet))) +
  geom_smooth(method = "loess") +
  labs(title = "식이 조건에 따른 체중 변화",
       x = "나이 (일수)",
       y = "체중 (그램)",
       color = "식이 조건") +
  theme_minimal()


# 식이 조건별 체중 변화의 차이 분석
# 식이 조건이 체중에 미치는 영향을 분석하기 위해, ANOVA(분산 분석)를 수행
# ANOVA 분석
aov_result <- aov(weight ~ Diet + Error(Chick/Diet), data = ChickWeight)

# ANOVA 결과 출력
summary(aov_result)