## Type

#### 타입 추론 (Type Inference)

선언과 동시에 초기화 / 타입값을 보고 타입을 추론

```swift
let name = "Daisy"  // type: String
```

#### 타입 명시(Type annotation)

- 원하는 타입으로 추론 되지 않는 경우

- 초기값이 없는 경우

직접 자료형을 지정해준다

```swift
let num = 17.0 // type: Double

let num: Float = 17.0 // type: Double
```



### typealias

기존에 선언되어있는 유형에 새로운 유형의 별칭을 사용함으로써 코드를 더 읽기 쉽도록, 이해하기 쉽도록 만드는 문법

```swift
// 내장 유형
typealias Name = String

let name: Name = "Daisy"
let name: String = "Daisy"


// 사용자 정의 유형
class Student {
}

typealias Students = [Student]
var students: Students = []


// 복합적인 유형
func test(completionHandler: (Void) -> (Void)) {
}

typealias voidHandler = (Void) -> (Void)


func test(completionHandler: voidHandler) {
}
```




