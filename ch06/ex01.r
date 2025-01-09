# 데이터셋 탐색 및 분석 예제

# 필요한 패키지 로드
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# 1. mtcars 데이터셋
cat("\n--- mtcars Dataset ---\n")
data(mtcars)
print(head(mtcars))
summary(mtcars)

# mtcars 데이터셋의 mpg(연비)와 hp(마력) 간의 관계를 시각화
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  labs(title = "HP vs MPG in mtcars", x = "Horsepower (hp)", y = "Miles Per Gallon (mpg)")

# 2. airquality 데이터셋
cat("\n--- airquality Dataset ---\n")
data(airquality)
print(head(airquality))
summary(airquality)

# airquality 데이터셋의 Ozone 농도와 Temperature 간의 관계를 시각화
ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  labs(title = "Temperature vs Ozone in airquality", x = "Temperature (F)", y = "Ozone (ppb)")

# 3. cars 데이터셋
cat("\n--- cars Dataset ---\n")
data(cars)
print(head(cars))
summary(cars)

# cars 데이터셋의 speed와 dist(제동거리) 간의 관계를 시각화
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  labs(title = "Speed vs Distance in cars", x = "Speed (mph)", y = "Distance (ft)")

# 4. PlantGrowth 데이터셋
cat("\n--- PlantGrowth Dataset ---\n")
data(PlantGrowth)
print(head(PlantGrowth))
summary(PlantGrowth)

# PlantGrowth 데이터셋의 Group별 Plant Weight의 상자 그림
ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  labs(title = "Plant Weight by Group in PlantGrowth", x = "Group", y = "Weight (g)")

# 5. ToothGrowth 데이터셋
cat("\n--- ToothGrowth Dataset ---\n")
data(ToothGrowth)
print(head(ToothGrowth))
summary(ToothGrowth)

# ToothGrowth 데이터셋의 dose와 length(치아 길이) 간의 관계를 시각화
ggplot(ToothGrowth, aes(x = dose, y = len, color = supp)) +
  geom_point() +
  labs(title = "Dose vs Tooth Length in ToothGrowth", x = "Dose", y = "Tooth Length (mm)")

# 6. ChickWeight 데이터셋
cat("\n--- ChickWeight Dataset ---\n")
data(ChickWeight)
print(head(ChickWeight))
summary(ChickWeight)

# ChickWeight 데이터셋의 Time에 따른 Chick의 Weight를 시각화
ggplot(ChickWeight, aes(x = Time, y = weight, color = Chick)) +
  geom_line() +
  labs(title = "Chick Weight Over Time", x = "Time (days)", y = "Weight (g)")

# 7. sleep 데이터셋
cat("\n--- sleep Dataset ---\n")
data(sleep)
print(head(sleep))
summary(sleep)

# sleep 데이터셋의 group별 extra(수면 증가량) 상자 그림
ggplot(sleep, aes(x = as.factor(group), y = extra)) +
  geom_boxplot() +
  labs(title = "Extra Sleep by Group in sleep", x = "Group", y = "Extra Sleep (hours)")

# 8. Titanic 데이터셋
cat("\n--- Titanic Dataset ---\n")
data(Titanic)
print(Titanic)
summary(Titanic)

# Titanic 데이터셋의 승객 클래스와 생존 여부에 따른 비율을 시각화
titanic_df <- as.data.frame(Titanic)
ggplot(titanic_df, aes(x = Class, fill = Survived)) +
  geom_bar(position = "fill") +
  labs(title = "Survival Rate by Class on Titanic", x = "Class", y = "Proportion")
