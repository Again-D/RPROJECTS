# 데이터셋 로드
data(InsectSprays)

# 데이터셋 요약
summary(InsectSprays)

# 데이터셋 구조 확인
str(InsectSprays)

# 상위 6개의 행 보기
head(InsectSprays)


# 각 스프레이의 기본 통계량 계산
# 스프레이 별 평균 개체 수 계산
aggregate(count ~ spray, data=InsectSprays, mean)

# 스프레이 별 개체 수의 기본 통계량
aggregate(count ~ spray, data=InsectSprays, summary)


# 스프레이 별 개체 수의 분포 시각화
# 상자 그림 (Boxplot) 시각화
boxplot(count ~ spray, data=InsectSprays,
        main="Insect Count by Spray Type",
        xlab="Spray Type", ylab="Insect Count")


# 스프레이 별 평균 개체 수 계산 및 시각화
# 각 스프레이의 평균 개체 수 계산
library(dplyr)
avg_counts <- InsectSprays %>%
  group_by(spray) %>%
  summarize(mean_count = mean(count))

# 평균 개체 수 시각화
library(ggplot2)
ggplot(avg_counts, aes(x=spray, y=mean_count, fill=spray)) +
  geom_bar(stat="identity") +
  labs(title="Average Insect Count by Spray Type",
       x="Spray Type", y="Average Insect Count") +
  theme_minimal()


# 스프레이의 효과 분석 (ANOVA)
# ANOVA 분석
anova_model <- aov(count ~ spray, data=InsectSprays)
summary(anova_model)


# 사후 검정 (Tukey HSD)
# Tukey HSD 사후 검정
tukey_test <- TukeyHSD(anova_model)
print(tukey_test)


# 스프레이와 개체 수 간의 관계 시각화 (추가적인 시각화)
# 스프레이 별 개체 수의 히스토그램
ggplot(InsectSprays, aes(x=count, fill=spray)) +
  geom_histogram(binwidth=1, position="dodge") +
  labs(title="Histogram of Insect Counts by Spray Type",
       x="Insect Count", y="Frequency") +
  theme_minimal()


# 스프레이별 평균 개체 수를 히트맵으로 시각화
# 필요한 패키지 로드
library(reshape2)

# 데이터 변환: 스프레이별 평균 개체 수로 변환
avg_counts_matrix <- dcast(avg_counts, . ~ spray, value.var="mean_count")
rownames(avg_counts_matrix) <- NULL

# 히트맵 시각화
library(pheatmap)
pheatmap(as.matrix(avg_counts_matrix[,-1]),
         cluster_rows=FALSE,
         cluster_cols=FALSE,
         main="Heatmap of Average Insect Count by Spray Type")