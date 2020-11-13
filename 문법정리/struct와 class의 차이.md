## Struct와 클래스의 차이

> **Struct(구조체)는 값타입**이라는것과 **클래스는 참조타입**이라는 점에서 차이점이 있다.

https://blog.bobthedeveloper.io/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f





공통점

- 프로퍼티 정의가 가능합니다.
- 메소드 정의가 가능합니다.
- initializer 정의가 가능합니다.
- extension이 가능합니다.
- protocol이 가능합니다.



**차이점**

- **구조체는 value type, 클래스는 reference type 입니다.**
- **구조체는 상속(inheritance)이 불가능합니다.**
- **구조체에서는 AnyObject로 타입캐스팅이 불가능합니다.**
- **구조체는 생성자를 구현하지 않을 시 기본 initializer를 사용할 수 있습니다.**
- **클래스는 reference counting으로 메모리 관리가 가능합니다.**

클래스는 힙에 저장/ Automatically reference counted /call by reference

구조체는 스텍에 저장/ copy on write /call by value