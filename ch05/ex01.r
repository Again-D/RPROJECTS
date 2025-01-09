# 데이터 프레임 처리 함수 정의
process_dataframe <- function(df, column_name, filter_value, new_column_name, calculation_function) {
  # 열이 데이터 프레임에 존재하는지 확인
  if (!(column_name %in% colnames(df))) {
    stop("Error: Specified column does not exist in the data frame.")
  }
  
  # 주어진 열의 값에 따라 필터링
  filtered_df <- df[df[[column_name]] > filter_value, ]
  
  # 새로운 열 추가 및 값 계산
  filtered_df[[new_column_name]] <- calculation_function(filtered_df[[column_name]])
  
  return(filtered_df)
}

# 예제 데이터 프레임 생성
example_df <- data.frame(
  A = 1:10,
  B = 11:20
)

# 함수 호출 예시
result_df <- process_dataframe(
  df = example_df,
  column_name = "A",
  filter_value = 5,
  new_column_name = "C",
  calculation_function = function(x) x^2
)

# 결과 출력
print(result_df)