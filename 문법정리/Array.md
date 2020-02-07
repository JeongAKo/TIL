# Array



##### 안전한 방법으로 배열에 접근하기



일반적으로 배열에 `index`를 통해 접근하는 상황을 최소화해야 하는 것이 옳지만 어쩔 수 없이 관련된 상황이 발생하기 마련이다.

~~~swift
let arr = [1, 2, 3, 4]

arr[4] // Fatal error: Index out of range 
~~~





`index`가 유효한지 판단한 뒤 유효할 경우 실제 `Element`를 반환하고 아닌 경우 `nil` 값을 넘겨준다.

~~~swift
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
~~~



예시

~~~swift
let arr = ["a", "aa", "aaa", "aaaa", "aaaaa", "aaaaaa"]

func getElementCount(_ index: Int) -> Int {
    guard let value = arr[safe: index] else { return 0 }
    return value.count
}

(-5..<10).forEach {
    print("\($0) : \(getElementCount($0))")
}

/* --------- result ---------
-5 : 0
-4 : 0
-3 : 0
-2 : 0
-1 : 0
0 : 1
1 : 2
2 : 3
3 : 4
4 : 5
5 : 6
6 : 0
7 : 0
8 : 0
9 : 0
*/
~~~





#### How to split an array into chunks

~~~swift
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

let numbers = Array(1...100)
let result = numbers.chunked(into: 5)

~~~

