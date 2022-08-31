# Combine

비동기 이벤트를 처리하기 위해 애플에서 만든 **프레임 워크** / 변화를 다루는 것이 Combine 의 핵심기능

*iOS13 부터 적용 가능*

subscriber를 통해 Publisher를 구독(subscribe) 하여 비동기적 event 를 처리

> Combine 프레임워크는 시간 경과에 따라 변경되는 값을 내보내는 Publisher와 이를 수신하는 Subscriber로 시간 경과에 따른 값 처리를 위한 선언적 Swift API 

##### Why Combine?

비동기 프로그래밍을 할때는 **재현이나 추적 및 수정이 어렵다**는 문제를 갖고 있습니다. 이런 문제의 원인은 각각이 **고유한 인터페이스를 가지는 비동기 API를 사용하기 때문**

`Combine`은 `SwiftUI` 에 적합한 데이터 바인딩 방법을 제공

rx와 비교했을때 combine이 시간이나 메모리 할당면에서 모두 성능이 더 좋았다 안쓸이유가? 🤷🏻‍♀️

**Protocol**: Publisher, Subscriber, Operator, Subscription, Scheduler, Cancelable

    

- ### Publisher (rx: observable)
  
  `output`, `failure` 타입을 가지고 있다
  
  subscribrer에게 <u>`subscription`</u> 인스턴스를 전달
  
  - **Future**: 실패하거나 하나의 값을 방충한 후 완료
    
    - Promise
  
  - **Just**: 각각의 Subsciber에게 딱 한번 값을 방출하고 완료
  
  - **Empty**: 어떤 값도 내보내지 않습니다. 즉시 종료 될 수도 있음
  
  - **Fail**: 특정한 error와 함께 즉시 종료
    
    ...etc

- ### Subscriber
  
  `itput`, `failure` 타입을 가지고 있다 *(publisher의 `output` 타입과 일치해야 한다)*
  
  - **custom subscriber**: 애플에서 권장하지는 않음
  
  - **sink** (receiveCompletion: receiveValue:): `종료 시그널`을 받거나 매번 `새로운 값`를 받았을 때 임의적인 $closure$를 실행
  
  - **assign**(to: on:): 매번 `새로 받은 값`을 주어진 인스턴스의 `key path`로 정의되는 property에 **할당**
    
    - **\\.value** → keyPath

- ### Operator
  
  `publisher`가 방출하는 값을 결합 할 수 있다
  
  - **Collecting**
    
    - collect() 
    
    모든 element를 수집하고 upatream publisher가 완료되면 **single array**를 내보낸다 
    
    몇개 만들지 정할 수 있다 
    
    ```swift
    var subscriptions = Set<AnyCancellable>()
    
    ["A", "B", "C", "D", "E"].publisher
        .collect(2)
        .sink(re  ["A", "B", "C", "D", "E"].publisher
        .collect(2)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions))
    
    // 결과값
    // ["A", "B"]
    // ["C", "D"]
    // ["E"]
    ```
  
  - **Mapping**
    
    - map
    
    ```swift
      let formatter = NumberFormatter()
      formatter.numberStyle = .spellOut
    
      [123, 4, 56].publisher
        .map {
          formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
        }
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    // 결과값
    // one hundred twenty-three
    // four
    // fifty-six
    ```
  
  - **Replacing**
    
    - replaceNil
    
    ```swift
      ["A", nil, "C"].publisher
        .replaceNil(with: "-")
        .map { $0! }
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
      // 결과값
      // A
      // -
      // C
    ```
    
    - replaceEmpty(with:) 
    
    ```swift
     let empty = Empty<Int, Never>()
    
      empty
        .replaceEmpty(with: 1)
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
    
      // 결과값
      //  1
    ```
    
    - scan
    
    inital 값을 가지고 계산값을 축적
    
    ```swift
      var dailyGainLoss: Int { .random(in: -10...10) }
    
      let august2019 = (0..<22)
        .map { _ in dailyGainLoss }
        .publisher
    
      august2019
        .scan(50) { latest, current in
          max(0, latest + current)
        }
        .sink(receiveValue: { _ in })
        .store(in: &subscriptions)
    ```
  
  - **Flattening**
    
    - flatMap
    
    element로 부터 새로운 publisher를 리턴한다
    
    같은 타입의 downstream publisher들을 하나의 publisher로 변경
    
    ```swift
      let charlotte = Chatter(name: "Charlotte", message: "Hi, I'm Charlotte!")
      let james = Chatter(name: "James", message: "Hi, I'm James!")
    
      let chat = CurrentValueSubject<Chatter, Never>(charlotte)
    
      chat
        .flatMap(maxPublishers: .max(2)) { $0.message }
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
      charlotte.message.value = "Charlotte: How's it going?"
    
      chat.value = james
    
      james.message.value = "James: Doing great. You?"
      charlotte.message.value = "Charlotte: I'm doing fine thanks."
    
      let morgan = Chatter(name: "Morgan",
                           message: "Hey guys, what are you up to?")
    
      chat.value = morgan
    
      charlotte.message.value = "Did you hear something?"
    ```
  
  - **Filtering**
    
    - filter
    
    ```swift
      let numbers = (1...10).publisher
    
      numbers
        .filter { $0.isMultiple(of: 3) }
        .sink(receiveValue: { n in
          print("\(n) is a multiple of 3!")
        })
        .store(in: &subscriptions)
    ```
    
    - removeDuplicates
    
    ```swift
      let words = "hey hey there! want to listen to mister mister ?"
                      .components(separatedBy: " ")
                      .publisher
    
      words
        .removeDuplicates()
        .sink(receiveValue: {
          print($0)
        })
        .store(in: &subscriptions)
    ```

- **Compacting and ignoring**
  
  - compactMap
  
  ```swift
    let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher
  
    strings
      .compactMap { Float($0) }
      .sink(receiveValue: {
        print($0)
      })
      .store(in: &subscriptions)
  ```
  
  - ignoreOutput
  
  ```swift
    let numbers = (1...10_000).publisher
  
    numbers
      .ignoreOutput()
      .sink(receiveCompletion: { print("Completed with: \($0)") },
            receiveValue: { print($0) })
      .store(in: &subscriptions)
  ```
  
  // **Finding values**
  
  - first(where:)
  
  ```swift
    let numbers = (1...9).publisher
  
    numbers
      .print("numbers")
      .first(where: { $0 % 2 == 0 })
      .sink(receiveCompletion: { print("Completed with: \($0)") },
            receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    //  first() is a `lazy` operator
    // 결과값
    // 2 
  ```
  
  - last(where:)
  
  last() returns the last value
  
  ```swift
  let numbers = PassthroughSubject<Int, Never>()
  
    numbers
      .last(where: { $0 % 2 == 0 })
      .sink(receiveCompletion: { print("Completed with: \($0)") },
            receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    numbers.send(1)
    numbers.send(2)
    numbers.send(3)
    numbers.send(4)
    numbers.send(5)
    numbers.send(completion: .finished)
  
    // last() is a `greedy` 
    // 결과값
    // 4
  ```
  
  // **Limiting values**
  
  - prefix
  
  ```swift
    let numbers = (1...10).publisher
  
    numbers
      .prefix(2)
      .sink(receiveCompletion: { print("Completed with: \($0)") },
            receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    // As with first(), prefix() is also a `lazy` operator
    // 결과값
    // 1
    // 2
  ```
  
  // **Dropping values**
  
  - drop(while:)
  
  ```swift
  let numbers = (1...10).publisher
  
    numbers
      .drop(while: {
        print("x")
        return $0 % 5 != 0
      })
      .sink(receiveValue: {
        print($0)
      })
      .store(in: &subscriptions)
  
    // 결과값
    // 5, 6, 7, 8, 9, 10
  ```

- ##### Prepend
  
  - prepend(Output...)
  
  ```swift
    let publisher = [3, 4].publisher
  
    publisher
      .prepend(1, 2)
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    // 결과값
    // 1
    // 2
    // 3
    // 4
  ```
  
  - prepend(Sequence)
  
  ```swift
   let publisher = [5, 6, 7].publisher
  
    publisher
      .prepend([3, 4])
      .prepend(Set(1...2))
      .prepend(stride(from: 6, to: 11, by: 2))
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
  
  // 결과값
  // 6, 8, 10, 1, 2, 3, 4, 5, 6, 7
  ```
  
  - prepend(Publisher)
  
  ```swift
  let publisher1 = [3, 4].publisher
    let publisher2 = [1, 2].publisher
  
    publisher1
      .prepend(publisher2)
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
  
  // 결과값
  // 1, 2, 3, 4
  ```
  
  - prepend(Publisher) #2
  
  ```swift
    let publisher1 = [3, 4].publisher
    let publisher2 = PassthroughSubject<Int, Never>()
  
    publisher1
      .prepend(publisher2)
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    publisher2.send(1)
    publisher2.send(2)
    publisher2.send(completion: .finished)
  
    // 결과값
    // 1, 2, 3, 4
  ```

- ##### Append
  
  - append(Output...)
  
  ```swift
    let publisher = [1].publisher
  
    publisher
      .append(2, 3)
      .append(4)
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    // 결과값
    // 1, 2, 3, 4
  ```
  
  - append(Output...) #2
  
  ```swift
    let publisher = PassthroughSubject<Int, Never>()
  
    publisher
      .append(3, 4)
      .append(5)
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
  
    publisher.send(1)
    publisher.send(2)
    publisher.send(completion: .finished)
  ```
  
    // 결과값
    // 1, 2, 3, 4, 5

```
- append(Sequence)

```swift
  let publisher = [1, 2, 3].publisher

  publisher
    .append([4, 5])
    .append(Set([6, 7]))
    .append(stride(from: 8, to: 11, by: 2))
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)


  // 결과값
  // 1, 2, 3, 4, 5, 6, 7, 8, 10
```

- append(Publisher)
  
  ```swift
  let publisher1 = [1, 2].publisher
  let publisher2 = [3, 4].publisher
  
  publisher1
    .append(publisher2)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
  
  // 결과값
  // 1, 2, 3, 4
  ```

##### Combining Elements from Multiple Publishers

**switchToLatest**

```swift
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<Int, Never>()
  let publisher3 = PassthroughSubject<Int, Never>()

  let publishers = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()

  publishers
    .switchToLatest()
    .sink(receiveCompletion: { _ in print("Completed!") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)

  publishers.send(publisher1)
  publisher1.send(1)
  publisher1.send(2)

  publishers.send(publisher2)
  publisher1.send(3)
  publisher2.send(4)
  publisher2.send(5)

  publishers.send(publisher3)
  publisher2.send(6)
  publisher3.send(7)
  publisher3.send(8)
  publisher3.send(9)

  publisher3.send(completion: .finished)
  publishers.send(completion: .finished)

  // 결과값
  // 1, 2, 4, 5, 7, 8, 9

  // 3, 6은 → 4, 7로 switch 됨
```

- **merge**
  
  interleaves values from publishers together, and can be of different types
  
  하나의 스트림으로 합쳐주는 역할
  
  ```swift
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<Int, Never>()
  
  publisher1
    .merge(with: publisher2)
    .sink(receiveCompletion: { _ in print("Completed") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
  
  publisher1.send(1)
  publisher1.send(2)
  
  publisher2.send(3)
  
  publisher1.send(4)
  
  publisher2.send(5)
  
  publisher1.send(completion: .finished)
  publisher2.send(completion: .finished)
  
  // 결과값
  // 1 2 3 4 5
  ```

- **combineLatest**
  
  두 게시자로부터 ouput을 수신하면 클로저를 호출 (마지막 친구들 모여라)
  
  ```swift
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<String, Never>()
  
  publisher1
    .combineLatest(publisher2)
    .sink(receiveCompletion: { _ in print("Completed") },
          receiveValue: { print("P1: \($0), P2: \($1)") })
    .store(in: &subscriptions)
  
  publisher1.send(1)
  publisher1.send(2)
  
  publisher2.send("a")
  publisher2.send("b")
  
  publisher1.send(3)
  
  publisher2.send("c")
  
  publisher1.send(completion: .finished)
  publisher2.send(completion: .finished)
  
  // 결과값
  // P1: 2, P2: a
  // P1: 2, P2: b
  // P1: 3, P2: b
  // P1: 3, P2: c
  ```

- **zip**
  
  forms tuples from the same index of all publishers
  
  ```swift
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<String, Never>()
  
  publisher1
    .zip(publisher2)
    .sink(receiveCompletion: { _ in print("Completed") },
          receiveValue: { print("P1: \($0), P2: \($1)") })
    .store(in: &subscriptions)
  
  publisher1.send(1)
  publisher1.send(2)
  
  publisher2.send("a")
  publisher2.send("b")
  
  publisher1.send(3)
  
  publisher2.send("c")
  publisher2.send("d")
  
  publisher1.send(completion: .finished)
  publisher2.send(completion: .finished)
  
  // 결과값
   // "P1: 1, P2: a"
   // "P1: 2, P2: b"
   // "P1: 3, P2: c"
  ```

- ##### Scheduler

Scheduler를 지정하지 않더라도 Combine은 기본 Scheduler를 제공

Scheduler는 **element가 생성된 스레드와 동일한 스레드**를 사용

- **where**
  
  - current run loop
  
  - dispatch queue
  
  - operation queue

- **when**
  
  - virtual time(according to scheduler’s clock)

- **receive(on: )** / downstream

 receive(on: )은 publisher로 부터 element를 수신할 scheduler를 지정

- **subscribe(on: )** / upstream

- **Debounce**

- **Throttle**

[debounce와 throttle의 차이](https://felix-mr.tistory.com/10)

- ##### Timing

- **Timeout**

- **measure**

- ##### Subject

publisher의 일종으로 **밖에서 값을 방출** 할 수 있다.

`(send(:)` 를 통해 stream에 값을 주입 할 수 있는 publisher

```swift
// subscriber에게element를 broadcast하는 subject
example(of: "PassthroughSubject") {
  let subject = PassthroughSubject<String, Never>()

  subject
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)

  subject.send("Hello")
  subject.send("World")

  subject.send(completion: .finished)
  subject.send("Still there?")


// 초기값과 최근 발행된 element에 대한 buffer를 갖는다
example(of: "CurrentValueSubject") {
let subject = CurrentValueSubject<Int, Never>(0)

subject
  .print()
  .sink(receiveValue: { print($0) })
  .store(in: &subscriptions)

print(subject.value)

subject.send(1)
subject.send(2)

print(subject.value)

subject.send(completion: .finished)
}
```

<img title="" src="https://user-images.githubusercontent.com/47776915/172743170-fe3bcc80-5643-424f-834e-b0ec82d32ccc.png" alt="스크린샷 2022-06-09 오전 10 11 17" width="788">

![스크린샷 20220609 오전 9 47 56](https://user-images.githubusercontent.com/47776915/172741007-78cc2bb8-6ef2-4e3e-952c-9f7342ede0c3.png)

```swift
var subscriptions = Set<AnyCancellable>() 

publisher
.sink(...)
.store(in: &subscriptions)  // 여러 subscription 저장
                            // 저장 된 subscription들은 해당 set이 초기회 해제 될 때(deinitialized) 같이 자동으로 취소
```

#### Type 삭제

AnyPublisher는 Operator를 사용하면서 여러 Publisher 타입이 생성되는데 이걸 간단히 처리
`.eraseToAnyPublisher()``

```swift
example(of: "Type erasure") {
  let subject = PassthroughSubject<Int, Never>()

  let publisher = subject.eraseToAnyPublisher()

//  publisher.send(0)

  publisher
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)

  subject.send(1)
}
```

![IMG_9197](https://user-images.githubusercontent.com/47776915/172776173-c4a66ece-7aaf-461f-9a85-682632ec4ee7.jpg)

# Networking with Combine

autoconnect

### raywenderlich

1. *Publishers*: Things that produce values.
2. *Operators*: Things that do work with values.
3. *Subscribers*: Things that care about values.

컴바인을 채택해서 이벤트 처리 코드들을 중앙 집중화 하고, (중첩 클로저나, 다른 타입들을 가진 콜백들)과 같은 문제들을 제거하고 코드를 읽기 쉽게 유지 관리 할 수 있다.

delegate 콜백을 여러개 등록해서 처리하거나 여러개의 completion handler를 이어 처리하는 대신, 주어진 이밴트 소스에 대해 단일 처리 로직을 활용할 수 있다.

 선언형 프레임워크 함수형 프로그래밍, 비동기를 기반으로 한 리액티브 등등 어려운 말들이 많지만 간단히 이야기하면 시간의 흐름에 따라 발생하는 이벤트를 처리하기 위한 API라고 하겠습니다.