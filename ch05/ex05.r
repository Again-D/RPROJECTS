# 패키지 생성 및 초기화
library(devtools)

# 패키지 이름과 경로 설정
pkg_name <- "MyPackage"
pkg_path <- file.path(getwd(), pkg_name)

# 패키지 생성
create_package(pkg_path)

# 패키지 디렉토리로 이동
setwd(pkg_path)

# 기본적인 DESCRIPTION 파일 작성
writeLines(
  c(
    "Package: MyPackage",
    "Type: Package",
    "Title: My First R Package",
    "Version: 0.1.0",
    "Authors@R: person(given = 'John', family = 'Doe', email = 'john.doe@example.com', role = c('aut', 'cre'))",
    "Description: This is a simple example package.",
    "License: MIT"
  ),
  file.path(pkg_path, "DESCRIPTION")
)

# 기본적인 NAMESPACE 파일 작성
writeLines(
  c(
    "export(hello_world)"
  ),
  file.path(pkg_path, "NAMESPACE")
)

# 패키지 함수 작성
# 'R' 디렉토리 생성
dir.create(file.path(pkg_path, "R"))

# 함수 파일 작성
writeLines(
  c(
    "hello_world <- function() {",
    "  print('Hello, world!')",
    "}"
  ),
  file.path(pkg_path, "R", "hello_world.R")
)

# 패키지 로드 및 테스트
load_all(pkg_path)
hello_world()  # 테스트 함수 호출

# 패키지 빌드
build(pkg_path)
