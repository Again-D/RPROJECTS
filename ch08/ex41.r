# Titanic 데이터셋 로드
data(Titanic)

# 데이터셋의 구조 확인
str(Titanic)

# Titanic 데이터를 데이터 프레임으로 변환
titanic_df <- as.data.frame(Titanic)
head(titanic_df)

# 생존자와 사망자 수 요약
survival_summary <- aggregate(Freq ~ Survived, data=titanic_df, sum)
print(survival_summary)

# 클래스별 생존자 수와 사망자 수 계산
class_summary <- aggregate(Freq ~ Class + Survived, data=titanic_df, sum)
print(class_summary)

# 클래스별 생존율 계산
class_survival_rate <- class_summary[class_summary$Survived == "Yes", "Freq"] /
  aggregate(Freq ~ Class, data=titanic_df, sum)$Freq
names(class_survival_rate) <- class_summary[class_summary$Survived == "Yes", "Class"]
print(class_survival_rate)

# 성별 생존자 수와 사망자 수 계산
sex_summary <- aggregate(Freq ~ Sex + Survived, data=titanic_df, sum)
print(sex_summary)

# 성별 생존율 계산
sex_survival_rate <- sex_summary[sex_summary$Survived == "Yes", "Freq"] /
  aggregate(Freq ~ Sex, data=titanic_df, sum)$Freq
names(sex_survival_rate) <- sex_summary[sex_summary$Survived == "Yes", "Sex"]
print(sex_survival_rate)

# 생존율 시각화 (Class)
library(ggplot2)
ggplot(class_summary, aes(x=Class, y=Freq, fill=Survived)) + 
  geom_bar(stat="identity", position="dodge") +
  labs(title="Survival by Class", x="Class", y="Count")

# 생존율 시각화 (Sex)
ggplot(sex_summary, aes(x=Sex, y=Freq, fill=Survived)) + 
  geom_bar(stat="identity", position="dodge") +
  labs(title="Survival by Sex", x="Sex", y="Count")