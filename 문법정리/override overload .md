## override VS overload 



##### 오버라이딩(Overriding)

-상위 클래스에서 상속박은 메서드를 하위 클래스에서 필요에 따라 재정의 하는 것 

-동일 요청이 객체에 따라 다르게 응답

~~~swift
class Shape {
  func draw() {}
}

class Circle: Shape {
  override func draw() {print("draw circle")}
} 


class Triangle: Shape {
  override func draw() {print("draw triangle")}
}
~~~





##### 오버로딩(Overloading)

- 동일한 이름의메서드가 매개변수의 이름, 타입, 개수 등의 차이에 따라 다르게 동작하는 것

-동일 요청이 매개변수에 따라 다르게 응답

~~~swift
func someFunction(param: Int) {
  print(param)
}

func someFunction(param: String) {
  print(param)
}

someFunction(param: 10)
someFunction(param: "10")

~~~







