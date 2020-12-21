## 값형 vs 참조형

### 값형

- 기본 데이터형으 모두 값형(value type)이었음

  - int, float, double, decimal, byte 등

- 값형이랑 무엇일까?

  - 한 변수를 다른 변수에 대입하면 사본을 만드는 자료형

  ~~~c#
  int num1 = 1;
  int num2 = num2;
  num2 = 3; //num1은 여전히 1
  ~~~

  - 함수 매개변수의 인자로 전달해도 마찬가지임

  ~~~c#
  public static void DoSomthing(int num)
  {
  	num = 3; // 함수 밖의 num1은 여전히 1
  }
  
  //메인함수
  int num1 = 1;
  DoSomthing(num1)
  ~~~

  - 즉, 다른 변수의 값을 변경해도 원본은 바뀌지 않음



##### C#에서 

클래스, 배열, string(클래스)는 참조형

enum은 값형



#### 참조형과 가비지 컬렉터

- 임시 문자열(쓰레기)은 쓰레기 수집기(GC)의 대상이었음
- 마찬가지로 참조형도 다 GC의 대상
- 참조형 임시 데이터를 너무 많이 만들면 GC의 성능저하기 올 수 있음
- 값형은 GC의 대상이 아님(단, 값형은 복사 비용에 따른 성능저하기 올 수 있음)



##### 참조형 vs 값형의 매개변수 전달

![스크린샷 2020-12-21 오후 2 55 38](https://user-images.githubusercontent.com/47776915/102744200-98a76b00-439c-11eb-8df9-5dd0156adc09.png)







## 구조체(struct)

- 개념: 기능은 없고 데이터만 있는 클래스

- 구조체는 값형매개변수가 있는 생성자만 선언 가능

-  멤버변수와 프로퍼티 모두 선과 동시에 초기화 할 수 없음

  ~~~c#
  public int X = 10; // 컴파일 오류
  public int Y = {get; set;} = 10; // 컴파일 오류
  ~~~

- 단 상수(const)나 정적변수(static)은 초기롸 가능

  ~~~c#
  public const int MAX = 200; // OK
  public static int X = 10;   // OK
  ~~~

  

##### 구조체 개체 생성

- `new`키워드를 사용해서 생성

~~~
Vextor2 v1 = new Vextor2(); // 모든 멤버변수가 0으로 초기화
Vextor2 ㅍ2 = new Vextor2(30, 40);
~~~



##### 클래스와 구조체 모두 자료형!

- 클래스와 구조체 모두 자료형이기에 서로 포함 가능

~~~c#
public class Human
{
	public Head Head {get; set;} // Head는 struct
	puclic Body Body {get; set;} // Body는 class
}
~~~

~~~c#
public struct Human
{
	public Head Head {get; set;} // Head는 struct
	puclic Body Body {get; set;} // Body는 class
}
~~~



##### 클래스 vs 구조체

- 대부분의 응용 프로그램에서는 구조체를 잘 안씀
  - 개체를 전달하면서 원본을 바꾸는 것이 보통이기에
- 선능을 요하는 특정 분야에서 쓰는 경우는 있음(예: 게임)
  - 쓰래기를 만들디 않음
- 원본 대신 `언제나` 복사본을 전달하고 싶다면 구조체를 쓰기도 함