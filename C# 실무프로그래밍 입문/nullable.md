## Nullable

클래스 멤버변수의 기본값

~~~c#
ㅊpublic class Human
{
	public int Age {get; private set;}
	public float Height {get; private set;}
	public Head Head {get; private set;} // 경우1: Head는 클래스, 경우2: Head는 구조체 
}
~~~

- head는가 클래스 일때 `Human human = new Human()` 을 실행하고 나면 **Age, Height, Head**에는 어떤 값들이 들어가 있을까?
  - 0 또는 0에 준하는 값
  - 값형일 경우 다 0
  - Head가 참조형일 경우 **null** (비트 패턴이 0)

- head는가 구조체 일때 `Human human = new Human()` 을 실행하고 나면 **Age, Height, Head**에는 어떤 값들이 들어가 있을까?
  - 0 또는 0에 준하는 값
  - 값형일 경우 다 0
  - Head도 값형이니 Head 내부의 변수들도 다 0 → Head가 null이 아님에 주목!!



### null

- 참조값의 기본값
- 데이터가 존재하지 않는다는 의미
  - 아무것도 참조하고 있지 않음
- `없다`를 컴퓨터 세계에서 이진수로 0



##### 값형과 null

- 값형에는 null을 쓸수가 없음
- 참조형에는 0을 쓸수가 없음
- 참조형의 기본값이 null은 메모리에서 보면 이진수 0과 같음
- 값형의 기본값인 0은 이진수로도 0임



##### 값형에도 null을 쓰고 싶은 경우?

- List\<T>에서 IndexOf()함수가 원하는 요소를 못 찾으면?  **-1을 반환**

  ~~~c#
  List<int> list = new List<int> {10, 20, 30, 40};
  int index = list.IndexOf(100); // -1을 반환
  ~~~

int는 값형이라 null이 될 수 없는데 가능하게 해주는 `Nullable<T>`가 있다



##### Nullable\<T>

- T형의 값, 또는 null 을 가질 수 있는 구조체
- null도 가질 수 있는 값형을 표현할 때 씀
- 기본값은 null
- 참조형은 T가 될 수 없음

![스크린샷 2020-12-21 오후 4 06 38](https://user-images.githubusercontent.com/47776915/102748955-84686b80-43a6-11eb-9e3f-1381180f077c.png)



##### Nullable변수가 null인지 확인

~~~c#
if (age.HasVale)
{
}
~~~

하지만 `if (age == null)`을 쓰는게 더 일반적



##### Nullable 변수의 값을 읽어 오기

~~~c#
if (age != null) // null 확인
{
  Consle.WriteLine(age.Value);
}
~~~

- null인 경우 그대로 .Value를 불러오면 예외발생



##### Nullable 변수의 값 비교하기

- 하지만 T형과 T? 형을 비교할 때 단순히 `==`연산자를 쓰는게 가능

  - Nullable이 내부적으로 null검사를 한 뒤에 비교해 줌

  ~~~c#
  int? age = null;
  if (age == 3)
  {
  }
  
  int? grade = 3;
  if (graade == 3)
  {
  }
  ~~~



##### 값형에 Nullable변수 대입하기

- Nullabled을 값형에 직접 대입할 수 없음 (null일 경우 예외가 발생할 수 있음)

~~~c#
int? maybeAge = 3;
int age = maybeAge? // 컴파일 오류
  
// 올바른 코드
int age = maybeAge.Value;
~~~



##### Nullable을 잘못쓰면 코드가 괜히 복잡해지기 때문에(오버헤드) 정말 필요할 때만 쓰자

- null을 허용하는 코드와 null을 예상치 않는 함수간에 데이터 교환할 때 등등





​	