## Protocol

##### 프로토콜은 특정 작업이나 기능에 적합한 메서드, 피로퍼티 및 기타 요구사항의 청사진을 정의합니다.

그런 다음 프로토콜을 클래스, 구조체 또는 열거혐에서 채택(adopted)하여 이러한 요구사항을 구현할 수 있습니다

프로토콜의 요구사항을 충족시키는 모든 타입은 해당 프로토콜을 준수(conform) 한다고 합니다.

##### 프로토콜은 메소드, 프로퍼티등을 "정의"만 하고, 이 프로토콜을 채택한 곳에서 "구현"을 한다.

**1. 프로토콜은 프로퍼티가 저장 프로퍼티인지, 연산 프로퍼티인지 명시하지 않는다.**

**2. 대신 읽기만 가능한지, 읽기/쓰기 모두가 가능한지 명시해야한다 ( setter만 있는건 없다)**

**3. 프로퍼티 요구사항은 항상 var로 선언되어야 한다.**



**구조체, 클래스, 열거형**

```swift
// 프로토콜 생성
protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedToBeSettableProperty: String { get }
}


//class나 struct에서 프로토콜 채택
struct SomeStructure: SomeProtocol {
  // structure definition goes here
}


class SomeClass: SomeSuperclass, SomeProtocol{
    // class definition goes here
}


//서브클래스에서의 채택은 슈퍼클래스를 먼저 써주고 그 다음 프로토콜을 채택
class SomeClass: SomeSuperclass, SomeProtocol{
    // class definition goes here
}
```

### Protocol Extension

```swift
protocol ColorChangable {
  func changeColor()
}

extension ColorChangable {
  func changeColor() {

  }
}


class MyButton: ColorChangable {

}

class MyLable: ColorChangable {

}

class MuView: ColorChangable() {

}




let myButton = MyButton()
myButton.chageColor()
```

# POP(Protocol Oriented Programming)

정말 좋은 자료!

[Swift - 프로토콜 지향 프로그래밍 - yagom&#039;s blog](https://blog.yagom.net/531/)

https://www.youtube.com/watch?v=QZjz2PL9IS8&t=531s 

https://www.youtube.com/watch?v=oqr8Wvn8tCo

https://academy.realm.io/kr/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/

https://zeddios.tistory.com/12