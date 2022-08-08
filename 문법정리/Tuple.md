# Tuple

간단한 구조체 라고도 부르며 여러 `타입`을 한번에 묶을수 있다는 장점이 있다

하지만 튜플과 관련된 값들을 임시적인 것으로 데이터 구조가 임시범위를 넘어서 존속할 가능성이 있는 경우에는 클래스나 구조체로 모델링을 권장

```swift
var tuple = (1, "Hello, world!", true) // 기본 형태 

려ㅜ, tru
var anotherTuple = (1, (tuple)) // 튜플 안에 튜플 또는 함수을 넣을수도 있다
```

```swift
// 1
switch (request.context.http.path, request.context.http.method) {
// 2
case ("/convert", .GET):
  // 3
  let amount = Double(request.queryStringParameters?["amount"] ?? "0.0") ?? 0
  let desiredCurrency = request.queryStringParameters?["currency"] ?? "USD"
  // 4
  convert(amount: amount, desiredCurrency: desiredCurrency, callback: callback)
// 5
case ("/convert", .POST):
  // 6
  if let data = request.body?.data(using: .utf8), 
    let input = try? jsonDecoder.decode(RateInput.self, from: data) {
      convert(
        amount: input.amount, 
        desiredCurrency: input.currency ?? "USD", 
        callback: callback)
  } else {
    // 7
    callback(.success(APIGateway.V2.Response(statusCode: .badRequest)))
  }
default:
  // 8
  callback(.success(APIGateway.V2.Response(statusCode: .notFound)))
}
```
