# 데이터셋 로드
data(iris)

# 꽃받침 길이와 꽃받침 너비의 산점도
plot(iris$Sepal.Length, iris$Sepal.Width,
     main="Sepal Length vs Sepal Width",
     xlab="Sepal Length", ylab="Sepal Width",
     col=iris$Species, pch=19)
legend("topright", legend=levels(iris$Species), col=1:3, pch=19)

# 꽃잎 길이와 꽃잎 너비의 산점도
plot(iris$Petal.Length, iris$Petal.Width,
     main="Petal Length vs Petal Width",
     xlab="Petal Length", ylab="Petal Width",
     col=iris$Species, pch=19)
legend("topright", legend=levels(iris$Species), col=1:3, pch=19)

# 꽃받침 길이의 상자 그림
boxplot(Sepal.Length ~ Species, data=iris,
        main="Sepal Length by Species",
        xlab="Species", ylab="Sepal Length")

# 꽃받침 너비의 상자 그림
boxplot(Sepal.Width ~ Species, data=iris,
        main="Sepal Width by Species",
        xlab="Species", ylab="Sepal Width")

# 꽃잎 길이의 상자 그림
boxplot(Petal.Length ~ Species, data=iris,
        main="Petal Length by Species",
        xlab="Species", ylab="Petal Length")

# 꽃잎 너비의 상자 그림
boxplot(Petal.Width ~ Species, data=iris,
        main="Petal Width by Species",
        xlab="Species", ylab="Petal Width")

# 꽃받침 길이를 꽃받침 너비로 예측하는 선형 회귀 모델
lm_model <- lm(Sepal.Length ~ Sepal.Width, data=iris)
summary(lm_model)

# 예측값 시각화
plot(iris$Sepal.Width, iris$Sepal.Length,
     main="Sepal Length vs Sepal Width with Regression Line",
     xlab="Sepal Width", ylab="Sepal Length")
abline(lm_model, col="red")

# 필요한 패키지 로드
library(class)

# 훈련 데이터와 테스트 데이터 나누기
set.seed(123)
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# K-NN 분류 모델 생성
knn_model <- knn(train_data[,1:4], test_data[,1:4], train_data$Species, k=3)

# 모델 평가
table(Predicted=knn_model, Actual=test_data$Species)

# PCA 수행
pca_result <- prcomp(iris[,1:4], center=TRUE, scale.=TRUE)

# PCA 결과 요약
summary(pca_result)

# PCA 결과 시각화
biplot(pca_result, main="PCA Biplot")