# 데이터셋 로드 및 기본 정보 확인
# 데이터셋 로드
data(USArrests)

# 데이터셋 요약
summary(USArrests)

# 데이터셋 구조 확인
str(USArrests)

# 상위 6개의 행 보기
head(USArrests)


# 기본 통계량 계산
# 각 변수의 기본 통계량
summary(USArrests)

# 각 변수별 평균
colMeans(USArrests)

# 각 변수별 표준편차
apply(USArrests, 2, sd)


# 변수 간의 관계 시각화
# 살인 사건 수와 폭력 사건 수 간의 산점도
plot(USArrests$Murder, USArrests$Assault,
     main="Murder vs Assault",
     xlab="Murder Rate", ylab="Assault Rate",
     pch=19)

# 강간 사건 수와 살인 사건 수 간의 산점도
plot(USArrests$Rape, USArrests$Murder,
     main="Rape vs Murder",
     xlab="Rape Rate", ylab="Murder Rate",
     pch=19)


# 상관 행렬 및 시각화
# 상관 행렬 계산
cor_matrix <- cor(USArrests)
print(cor_matrix)

# 상관 행렬 시각화
library(corrplot)
corrplot(cor_matrix, method="circle", type="upper", 
         tl.cex=0.8, title="Correlation Matrix of USArrests Variables")


# 주별 군집 분석 (클러스터링)
# 거리 행렬 계산
dist_matrix <- dist(USArrests)

# 계층적 군집 분석
hc <- hclust(dist_matrix, method="ward.D2")
plot(hc, main="Hierarchical Clustering of USArrests Data")

# 클러스터 수 지정
clusters <- cutree(hc, k=4)

# 군집 결과를 데이터프레임에 추가
USArrests$Cluster <- as.factor(clusters)

# 군집별 평균 시각화
library(ggplot2)
ggplot(USArrests, aes(x=Murder, y=Assault, color=Cluster)) +
  geom_point() +
  labs(title="Cluster Analysis of USArrests Data",
       x="Murder Rate", y="Assault Rate") +
  theme_minimal()


# 주성분 분석 (PCA)
# PCA 수행
pca_result <- prcomp(USArrests, center=TRUE, scale.=TRUE)

# PCA 결과 요약
summary(pca_result)

# PCA 결과 시각화
biplot(pca_result, main="PCA Biplot of USArrests Data")

# 주성분의 비율
pca_var <- pca_result$sdev^2
pca_var_ratio <- pca_var / sum(pca_var)
print(pca_var_ratio)


# 선형 회귀 분석
# 폭력 사건 수를 살인 사건 수로 예측하는 선형 회귀 모델
lm_model <- lm(Assault ~ Murder + Rape + UrbanPop, data=USArrests)
summary(lm_model)

# 회귀 직선 시각화
plot(USArrests$Murder, USArrests$Assault,
     main="Regression of Assault on Murder",
     xlab="Murder Rate", ylab="Assault Rate", pch=19)
abline(lm_model, col="red")


# 도시 인구 비율에 따른 강간 사건 수 분석
# 도시 인구 비율에 따른 강간 사건 수의 산점도
plot(USArrests$UrbanPop, USArrests$Rape,
     main="Rape Rate vs Urban Population",
     xlab="Urban Population (%)", ylab="Rape Rate",
     pch=19)

# 선형 회귀 모델
lm_model_urban <- lm(Rape ~ UrbanPop, data=USArrests)
abline(lm_model_urban, col="blue")