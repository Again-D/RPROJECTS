# 패키지 설치 예제
install.packages("ggplot2")  # ggplot2 패키지 설치
install.packages("dplyr")    # dplyr 패키지 설치

# 패키지 로드 예제
library(ggplot2)  # ggplot2 패키지 로드
library(dplyr)    # dplyr 패키지 로드

# 패키지 업데이트 예제
update.packages()  # 모든 패키지를 최신 버전으로 업데이트

# 패키지 삭제 예제
remove.packages("dplyr")  # dplyr 패키지 삭제

# 설치된 패키지 목록 확인
installed_packages <- installed.packages()
print(installed_packages[1:5, ])  # 설치된 패키지의 상위 5개를 출력

# 패키지 정보 확인
pkg_info <- packageDescription("ggplot2")
print(pkg_info)

# 패키지가 설치되어 있는지 확인하는 함수
is_package_installed <- function(pkg_name) {
  return(pkg_name %in% rownames(installed.packages()))
}

# 패키지 설치 확인
pkg_name <- "ggplot2"
if (is_package_installed(pkg_name)) {
  cat(paste(pkg_name, "is installed.\n"))
} else {
  cat(paste(pkg_name, "is not installed.\n"))
}
