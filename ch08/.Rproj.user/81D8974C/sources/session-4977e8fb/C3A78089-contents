# 모자이크 플롯(mosaicplot) 실습 예제

# 데이터 생성
# 예를 들어, `UCBAdmissions` 데이터셋은 학생들의 학부 모집 상황을 나타냅니다.
data(UCBAdmissions)
admissions_table <- as.table(UCBAdmissions)

# 1. 기본 모자이크 플롯
mosaicplot(admissions_table, main = "Basic Mosaic Plot")

# 2. 모자이크 플롯의 색상 지정
# 색상을 추가하여 각 부분의 빈도를 시각적으로 구분할 수 있습니다.
mosaicplot(admissions_table, main = "Mosaic Plot with Color", color = TRUE)

# 3. 모자이크 플롯의 비율 표시
# 비율을 표시하여 각 영역의 상대적 비율을 시각적으로 명확하게 나타냅니다.
mosaicplot(admissions_table, main = "Mosaic Plot with Proportions", color = TRUE, 
           labeling_args = list(rot = 45, cex = 0.8))

# 4. 사용자 정의 라벨 및 텍스트
# 각 모자이크 조각에 레이블을 추가하여 정보를 명확하게 전달합니다.
mosaicplot(admissions_table, main = "Mosaic Plot with Custom Labels", color = TRUE, 
           labeling_args = list(rot = 90, cex = 0.8))

# 5. 데이터 변형을 통한 모자이크 플롯
# 데이터를 변형하여 다른 시각적 표현을 실습합니다.
# 예를 들어, `Titanic` 데이터셋을 사용하여 모자이크 플롯을 그립니다.
data(Titanic)
titanic_table <- as.table(Titanic)
mosaicplot(titanic_table, main = "Titanic Data Mosaic Plot", color = TRUE)

# 6. 모자이크 플롯에 데이터와 비율 추가
# 데이터와 비율을 함께 표시하여 각 영역의 비율을 명확하게 나타냅니다.
mosaicplot(titanic_table, main = "Mosaic Plot with Data and Proportions", color = TRUE, 
           labeling_args = list(rot = 45, cex = 0.8, bg = "white"))
