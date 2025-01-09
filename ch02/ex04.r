# 데이터의 형 변환

a="1004"
b=304.12
c="3.14"
d=1004
e="FALSE"
f="10+7i"

as.numeric(a)
as.integer(b)
as.double(c)
as.character(d)
as.logical(e)
as.complex(f)

is.numeric(as.numeric(a))
is.integer(as.integer(b))
is.double(as.double(c))
is.character(as.character(d))
is.logical(as.logical(e))
is.complex(as.complex(f))
