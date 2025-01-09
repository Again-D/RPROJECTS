# 데이터셋 로드
data(sleep)

# 데이터셋 구조 확인
str(sleep)

# 데이터셋 미리보기
head(sleep)

# 기초 통계량 확인
summary(sleep)

# ggplot2 패키지 로드
library(ggplot2)

# 피험자에 따라 그룹화된 수면 시간 시각화
ggplot(sleep, aes(x = Sleep)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  facet_wrap(~ ID) + # 'Group' 변수를 사용하지 않기 때문에 'ID'를 사용
  labs(title = "수면 시간 분포", x = "수면 시간", y = "빈도") +
  theme_minimal()

# 상자 그림을 통한 그룹별 수면 시간 비교
# 피험자 그룹별 상자 그림
ggplot(sleep, aes(x = factor(ID), y = Sleep)) +
  geom_boxplot(fill = c("lightgreen", "lightcoral")) +
  labs(title = "피험자별 수면 시간", x = "피험자 ID", y = "수면 시간") +
  theme_minimal()

# 그룹별 수면 시간 평균 비교
# ID별 수면 시간 평균 계산
group_means <- aggregate(Sleep ~ ID, data = sleep, FUN = mean)
print(group_means)

# t-검정 수행
# 피험자 ID를 그룹으로 변환하여 수면 시간의 평균 비교
t_test_result <- t.test(Sleep ~ ID, data = sleep)

# t-검정 결과 출력
print(t_test_result)
