# Array

https://soooprmx.com/archives/7045

https://www.vadimbulavin.com/handling-out-of-bounds-exception/



#### enumerated() 배열의 인덱스 가져오기

~~~swift
let array: [String] = ["one", "two", "three", "four", "five"]
    
		for (index, number) in array.enumerated() {
			print("\(index): \(number)")
		}
		
		
//결과
0: 0ne
1: two
2: three
3: four
4: five
~~~





##### 안전한 방법으로 배열에 접근하기

일반적으로 배열에 `index`를 통해 접근하는 상황을 최소화해야 하는 것이 옳지만 어쩔 수 없이 관련된 상황이 발생하기 마련이다.

~~~swift
let arr = [1, 2, 3, 4]

arr[4] // Fatal error: Index out of range 
~~~





`index`가 유효한지 판단한 뒤 유효할 경우 실제 `Element`를 반환하고 아닌 경우 `nil` 값을 넘겨준다.

~~~swift
extension Array {
    subscript (safe index: Int) -> Element? {
    	// iOS 9 or later
        return indices ~= index ? self[index] : nil	
        // iOS 8 or earlier
        // return startIndex <= index && index < endIndex ? self[index] : nil
        // return 0 <= index && index < self.count ? self[index] : nil
    }
}

let list = [1, 2, 3]
list[safe: 4] // nil
list[safe: 2] // 3
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

