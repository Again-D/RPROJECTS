  # 데이터 프레임 생성
  data <- data.frame(
    ID = 1:10,
    Group = rep(c("A", "B"), each = 5),
    Score1 = c(85, 90, 88, 92, 79, 81, 95, 89, 91, 84),
    Score2 = c(78, 85, 87, 91, 80, 75, 90, 88, 84, 83),
    stringsAsFactors = FALSE
  )
  
  # 1. 데이터 프레임 출력
  cat("--- Original Data Frame ---\n")
  print(data)
  
  # 2. split() 사용 예제
  # 'Group' 별로 데이터를 분할
  split_data <- split(data, data$Group)
  cat("\n--- Data Split by Group (split()) ---\n")
  print(split_data)
  
  # 각 그룹별로 분할된 데이터 출력
  cat("\n--- Data for Group A ---\n")
  print(split_data$A)
  
  cat("\n--- Data for Group B ---\n")
  print(split_data$B)
  
  # 3. subset() 사용 예제
  # 'Score1'이 85보다 큰 데이터 서브셋 추출
  subset_data <- subset(data, Score1 > 85)
  cat("\n--- Subset with Score1 > 85 (subset()) ---\n")
  print(subset_data)
  
  # 4. 데이터 프레임 생성 (병합 예제)
  data2 <- data.frame(
    ID = c(6, 7, 8, 9, 10),
    Group = c("B", "B", "A", "A", "B"),
    Additional_Score = c(100, 95, 89, 90, 80),
    stringsAsFactors = FALSE
  )
  
  # 5. merge() 사용 예제
  # 'data'와 'data2'를 'ID'와 'Group'으로 병합
  merged_data <- merge(data, data2, by = c("ID", "Group"), all = TRUE)
  cat("\n--- Merged Data (merge()) ---\n")
  print(merged_data)
  
  # 6. 병합된 데이터의 NA 값 처리 (옵션)
  # NA 값을 0으로 변경
  merged_data[is.na(merged_data)] <- 0
  cat("\n--- Merged Data with NA values replaced by 0 ---\n")
  print(merged_data)
