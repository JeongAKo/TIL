## Higher-order Function(고차함수)

#### 고차함수란?

 \- 하나 이상의 함수를 인자로 취하는 함수

 \- 함수를 결과로 반환하는 함수

  **※ 고차 함수가 되기 위한 조건은 함수가 1급 객체여야 한다.**

>  1급 객체 (First-class citizen)
> 
>  \- 변수나 데이터에 할당할 수 있어야 한다.
> 
>  \- 객체의 인자로 넘길 수 있어야 한다.
> 
>  \- 객체의 리턴값으로 리턴할 수 있어야 한다.

- #### forEach
  
  컬랙션의 각 요소(Element)에 동일 연산을 적용하며, **반환값이 없는 형태**
  
  *for문은 반복문이므로 **break, continue** 키워드 사용*
  
  `return`을 통해 빠져나와야 함(count처럼 동작)
  
  ```swift
  let immutableArray = [1, 2, 3, 4]
  
  for num in immutableArray {
    print(num, terminator: " ") // 1 2 3 4 
  }
  
  immutableArray.forEach { num in
    print(num, terminator: " ") // 1 2 3 4 
  }
  
  immutableArray.forEach {
    print($0, terminator: " ") // 1 2 3 4 }    
  ```

- ### map

컬렉션의 각 요소(Element)에 동일 연산을 적용하여, **변형된 새 컬렉션을 반환**

```swift
 let names = ["Chris", "Alex", "Bob", "Barry"]
  names
    .map { $0 + "'s name" }
    .forEach { print($0) }

  /* 
  Chris's name
  Alex's name
  Bob's name
  */

  let intArr = Array<Int>(repeating: 2, count: 10)
  // 
  for (idx, value) in intArr.enumerated() {
    print(idx, value)
  }
  /* 
  0, 2
  1, 2
  2, 2
  3, 2
  4, 2
  5, 2
  6, 2
  7, 2
  8, 2
  9, 2
  */

  let indexPlusElement = intArr.enumerated().map {
    return $0 + $1
  }
  print(indexPlusElement) // [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
```

- #### filter
  
   컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
  
  ```swift
  let names = ["Chris", "Alex", "Bob", "Barry"]
  
  let containBNames = names
    .filter { (name) -> Bool in
      return name.contains("B")
    }
  print(containBNames) // ["Bob", "Barry"]
  
  let countAlexNames = names
    .filter { $0 == "Alex" }
    .count
  print(countAlexNames) // 1
  ```

- #### reduce
  
  컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환.   e.g. Int, String 타입
  
  ```swift
  (1...100)
     .reduce(<initialResult: Result>, <nextPartialResult: (Result, Int) throws -> Result)
  - initialResult // 초기값
  - nextPartialResult // (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)
  
  let sum1to100 = (1...100)
    .reduce(0) { (sum: Int, next: Int) in
      return sum + next
      // 0 + 1 = 1
      // 1 + 2 = 3
      // 3 + 3 = 6
      // 6 + 4 = 10 ...
    }
  print(sum1to100) // 5050
  
  // 아래처럼 직접 더하는 형태 X
  // (1...100).reduce(0) { (sum, next) in
  //  sum += next
  // }
  
  (1...100)
    .reduce(0) { $0 + $1 }
  ```

- #### compactMap
  
  컬렉션의 요소 중 옵셔널이 있을 경우 제거
  
  ```swift
  let optionalStringArr = ["A", nil, "B", nil, "C"]
  print(optionalStringArr.compactMap { $0 }) // ["A", "B", "C"]
  
  let numbers = [-2, -1, 0, 1, 2]
  let positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil }
  print(positiveNumbers) // [0, 1, 2]
  ```

- ### flatMap
  
  중첩된 컬렉션을 하나의 컬렉션으로 병합 
  
  ```swift
  let nestedArr = [[1, 2, 3], [1, 5, 99], [1, 1]]
  print(nestedArr.flatMap { $0 }) // [1, 2, 3, 1, 5, 99, 1, 1]
  ```

```swift
 let nestedArr2 = [[[1,2,3], [4,5,6], [7, 8, 9]], [[10, 11, 12], [13, 14]]]
 let flattenNumbers1 = nestedArr2.flatMap { $0 }
 print(flattenNumbers1) // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14]]

let flattenNumbers2 = flattenNumbers1.flatMap { $0 }
 print(flattenNumbers2) // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
```
