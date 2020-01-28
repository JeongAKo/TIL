# ARC (Automatic Reference Counting)

스위프트에서 메모리를 관리하는 역할은 `ARC(Automatic Reference Counting)`가  담당합니다. 이것은 객체를 가리키는 레퍼런스의 숫자를 관리하는 의미를 가지고 있으며, 실제로도 숫자를 관리합니다.



### 객체 소유하기

레퍼런스 숫자는 클래스로부터 만들어진 인스턴스 객체에만 적용도는 개념입니다. 따라서 Int, String과 같은 기본 자료형이나 구조체(struct), 열거형(enum)에는 적용되지 않습니다.

