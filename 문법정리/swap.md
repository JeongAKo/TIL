# [Swift] swap 쉽게 값 교환하기



일반적으로 값을 Swap 하기 위해서는 임시로 값을 저장하고 꺼내어 쓰게 됩니다.

~~~
var tmp = str1
str1 = str2
str2 = tmp
~~~



Swift 기본 라이브러리 함수 swap을 지원합니다.

~~~swift
func swap<T>(inout a: T, inout b: T)

swap(&str1, &str2)
~~~

