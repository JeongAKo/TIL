## Designated init VS convenience init

**Designated init** (지정이니셜라이저) 초기화 이니셜라이저 **모든 프로퍼티** 가 초기화 괼 수 있도록

~~~swift
class Person {

    var name: String

    var age: Int

    var gender: String

    init(name: String, age: Int, gender: String) {

        self.name = name

        self.age = age

        self.gender = gender

    }
}
~~~



#### **Convenience init**(보조 이니셜라이저) 

- 사용하려면 Designated init이 먼저 선언이 되어있어야 한다

- convenience init은 같은클래스에서 다른 이니셜라이저를 호출해야한다

  ~~~swift
  class Person {
  
      var name: String
  
      var age: Int
  
      var gender: String
  
      init(name: String, age: Int, gender: String) {
  
          self.name = name
  
          self.age = age
  
          self.gender = gender
  
      }
  
      convenience init(age: Int, gender: String) {
  
          self.init(name: "zedd", age: age, gender: gender)
  
      }
  }
  
  ~~~

  



