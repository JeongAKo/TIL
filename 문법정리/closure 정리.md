## **basic Closure**

클로저란 특정 기능을 담은 코드를 블럭으로 모아둔 형태이자, 일급 객체로 완벽한 역할을 할 수 있습니다. 

`일급 객체`란 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며, 함수의 반환 값이 될 수도 있습니다. 실제 우리가 알고 있는 함수는 클로저의 한 형태로, 이름이 있는 클로저입니다. 

클로져는 굳이 함수의 이름을 작성할 필요 없이 생략된다는 점에서 **익명(Anonymous)함수**라고 부르기도 합니다.



**클로져는 세 가지 형태가 있습니다**

- 이름이 있으면서 어떤 값도 획득하지 않는 전역함수의 형태
- 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
- 이름이 없고 주변 문맥에 따라 값을 획득할수 있는 축약 문법으로 작성한 형태



클로져의 표현은 통상 아래 형식을 따릅니다.

```swift
{ (매개변수들) -> 반환타입 in 
			실행코드
}
```

클로져 표현식은 함수와 달리 생략되는 부분이 많습니다. 우선, 함수를 선언하는 func 키워드를 생략하며, 함수의 이름 또한 생략합니다. 클로저 표현식은 일반 함수의 선언형식에서 func키워드와 함수명을 제외한 나머지 부분만 작성하는 경량문법을 사용합니다.



#####  함수의 인자로, 입력된 문자열의 개수를 반환하는 클로저를 전달하는 예

```swift
func performClosure(param: (String) -> Int) {
  param("Swift")
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }

```

클로져 표현식은 반환값의 타입을 생략할 수 있습니다. 반환값을 생략하면 컴파일러는 클로저 표현식의 구문을 해석하여 반환값을 찾고, 이 값의 타입을 추론하여 클로져의 반환타입을 정의합니다.



**Trailing Closure**

함수의 괄호가 닫힌 후에도 인수로 취급되는 클로저로 하나의 라인에 다 표현하지 못할 긴 클로져에 유용합니다.

클로저를 다른 함수의 인자값으로 전달할 때에는 자칫 가독성을 해치는 복잡한 구문이 만들어 질 수 있습니다. 여러줄로 작성된 클로저 코드가 소괄호 내에 들어가면 아무리 깔끔하게 작성한다 하더라도 전체 코드를 알아보기가 쉽지 않은 것이 사실이죠. 그래서 스위프트는 인자값으로 클로저를 전달하는 특수한 상황에서 문법을 변형할수 있도록 지원하고 있는데, 바로 트레일링 클로저 문법입니다.

 `트레일링클로저(Trailing Closure) `는 함수의 마지막 인자값이 클로저일 때, 이를 인자값 형식으로 작성하는 대신 함수의 뒤에 꼬리처럼 붙일 수 있는 문법을 의미합니다. 이때 인자 레이블은 생략됩니다. 주의할점은 함수의 마지막 인수(Argument)에만 사용 가능하고 해당 인수명은 생략한다는 겁니다. 클로저를 인자값으로 받더리도 마지막 인자값이 아니라면 적용 할 수 없습니다. 



> ©escaping 속성은 인자값으로 전달된 클로저를 저장해 두었다가, 나중에 다른 곳에서도 실행
> 할 수 있도록 허용해주는 속성입니다.





#### Closure에서 weak self 사용

*weak self (약한 참조)*는 문서에 명시적으로 *Strong Reference Cycle (강한 순환 참조)*를 벗어나기 위해 사용된다고 설명하고 있다. Closure를 사용하면서 closure 내부에서 컨트롤러의 멤버를 사용하기 위해 *self*가 사용되는데, 일반적인 경우에는 문제가 없지만 특수한 상황에서 문제가 될 여지가 있다.

~~~swift
class Thing {
	var disposable: Disposable?
	var total: Int = 0

	deinit {
		disposable?.dispose()
	}

	init(producer: SignalProducer<Int, NoError>) {
		disposable = producer.startWithNext { number in
			self.total += number
			print(self.total)
		}
	}
}

~~~



코드를 살펴보면 closure 내부에서 *total*이라는 클래스 멤버를 사용하기 위해 self를 명시해 주고 있다. Self는 사용과 함께 total 멤버의 *retain count*를 증가시키게 되는데 위의 코드에서 closure가 self를 해제하여 retain count를 낮춰준다면 문제없이 작동하는 코드가 된다.

다만 closure에 대한 참조가 disposable 멤버에 의해 붙잡혀 있을 경우 문제가 발생할 수 있게 된다. 즉, closure는 self가 해제 되기를 기다리고, self는 closure가 해제 되기를 기다리는 strong reference cycle 상황을 만들어 내게 되는 것이다.

이러한 상황을 해결하기 위해 weak self 를 사용하면 strong reference cycle 을 크게 줄일 수 있다.

사용법은 굉장히 단순하다.

~~~swift
disposable = producer.startWithNext { [weak self] number in
	self?.total += number
	print(self?.total ?? 0)
}
~~~

기존의 코드와 차이점은 클로져 선언부에 `[weak self] ([parameter]) in`을 명시해주고 self가 사용되는 곳에 옵셔널로 self를 사용해주면 위에서 언급하였던 strong reference cycle 상황을 피해갈 수 있게 된다.













