## Optional

Swift는 Safe, Fast, Expressive한 언어입니다. 여기서 옵셔널(Optional)은 스위프트에서 도입된 새로운 개념으로서 언어 차원에서 프로그램의 안전성(Safe)을 높이기 위해 사용하는 개념입니다.

옵셔널(Optional) 은 값이 없을 수 있는(absent) 상황에 사용하며 Objective-C 에는 없는 개념으로

옵셔널의 개념을 한 문장으로 정의하자면 `nil을 사용할수 있는 타입과 사용할 수 없는 타입을 구분하고，사용할 수 있는 타입을 가리켜 옵셔널 타입(Optional Type)이라고 부른다`라고 할 수 있습니다.

여기서 말하는 nil이란，값이 없음을 의미하는 특수한 값입니다. 정수형의 0이나, 문자열의 ""과는 다른. 말 그대로 순수하게 아무 값도 없다는 것을 의미하죠. 이런 특수성 때문에 nil은 종종 실제 값으로는 처리할수 없는, 무엇인가 문제가 발생했을 때 이를 의미하기 위해 사용됩니다.



#### 선언

Optional변수의 선언은 `?` 키워드를 사용합니다.

~~~swift
var name: String?
~~~

Optional의 디폴트 값은 `nil`로 name은 `nil`을 갖게 됩니다.

~~~swift
var name: String // 컴파일 에러
var namr = nil //컴파일 에러
~~~

만약 Optional 키워드를 사용하지 않았다면 값을 입력하라는 에러가 발생하고, 그 이후에라도 nil을 넣으려하면 컴파일에러가 발생합니다.
여기에서 Swift가 기본적으로 non-optional을 지원하면서 갖는 `엄청난 장점`을 느낄 수 있습니다.
nil에 대한 컴파일 에러를 통해 개발자는 nil에 대해 명확한 예외처리가 강제되며, 런타임에 nil로 인한 문제를 `컴파일 단계`에서 예방할 수 있습니다



> 옵셔널 추출은 바인딩, 체이닝, 강제추출 세가지 방법으로 옵셔널 변수를 가져와 사용할수 있다.



#### 1. 옵셔널 바인딩(Optional Binding)

옵셔널을 사용하기 전에 값이 있는지 없는지 확인할 때 사용.  안전하게 사용하기 위해서는 강제 언래핑이 아닌 옵셔널 바인딩을 사용해야 합니다.

- ##### if let문을 이용한 옵셔널 바인딩 기법

if let 을 하게되면 if문 안에서 let 변수에 넣어주는 값이 nil인지 체크하고 nil이 아닐경우, 옵셔널 바인딩을 하여 값을 가져오게 됩니다.

~~~swift
if let realStr = optionalStr {
    print("A")
} else {
    print("nil")
}
~~~



- ##### guard을 이용한 옵셔널 바인딩

guard를 이용하면 nil체크와 함께 조건문도 작성할 수 있습니다.

~~~swift
func bindingWithWhere(){
    guard let val = nilAvailable, val > 0 else {
        return;
    }
    print("val 은 nil이 아니고 0 보다 큰 값이다.")
}
~~~

guard 구문을 사용하더라도 옵셔널 바인딩 방식은 동일합니다. 상수를 선언하고，여기에 옵셔널 값을 대입하는 것이 전부죠.

하지만 사용 용법상 구문 내에서 옵셔널 바인딩을 사용하는 것과  구분해야 할 필요는 있습니다. if 구문을 사용한 옵셔널 바인딩은 단순히 옵셔널 값의 처리 결과에 따라 서로 다른 피드백을 주고 싶을 때 사용합니다. 하지만 guard구문은 조건에 맞지 않으면 무조건 함수의 실행을 종료시키는 특성(`early exit`)이 있기 때문에，실행 흐름상 옵셔널 값이 해제되지 않으면 더 이상 진행이 불가능할 정도로 큰일이 생길 때에만 사용하는 것이 좋습니다.



#### 2. 옵셔널 체이닝(Optional Chaining)

 하위 프로퍼티에 Optional 값이 있는지 연속적으로 확인하면서 중간에 하나라도 nil이 발견된다면 nil을 반환.

~~~swift
var display: UILabel?

if let label = display {
    if let text = label.text {
        let x = tex.hashValue
    }
}

//옵셔널 체이닝을 사용하면 한줄로 줄일수 있다.

if let value = display?.text?.hashValue

~~~



#### 3. 옵셔널 강제추출(Forced Unwrapping)

변수를 optional로 선언했지만, **무조건 변수가 있는 상황이 보장된 경우** `!`를 쓰면  옵셔널 변수가 강제로 언래핑되어 옵셔널이 벗겨집니다. 하지만 만약 value값이 nil일 경우 `런타임 에러`가 발생하기 때문에  `확신`이 있을때만 사용해야 합니다.

~~~swift
var optionalString: String? = “Hello”
print(optionalString)
// 출력 결과: Optional(“Hello”)

var optionalString: String? = “Hello”
print(optionalString!)
// 출력 결과: Hello

~~~

위 코드 처럼 확신한다면 !를 옵셔널 변수 뒤에 사용하여 강제로 넣을 수 있습니다.

이는 문법적으로는 문제가 없기 때문에 컴파일러는 에러를 뱉지 않습니다.

nil값이 아닌 것을 확신한다면 굳이 "값이 있나요? nil인가요?"라고 물어볼 필요가 없다는 것입니다.



#### 옵셔널 디폴팅

옵셔널이 nil 이면 기본값을 설정해주는 구문으로

?? 연산자 이후의 값 사용하게 됩니다.

~~~swift
var selectedColor : String?
var colorName = selectedColor ?? "Red
~~~

위와 같이 구성이 된 경우 selectedColor 값을 가져오게 되는데, 만약 nil이면 ?? 뒤에 있는 "Red"을 가져오게됩니다.

