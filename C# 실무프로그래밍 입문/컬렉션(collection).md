## 컬렉션(collection)

##### 컬렉션이란?

- 동일한 형의 여러 자료를 저장하는 공간
- 다영한 구조(data structure)의 일부
- 다른 언어에서는 컨테이너(container)라고도 부름

|           배열           |            컬렉션             |
| :----------------------: | :---------------------------: |
|         자료구조         |           자료구조            |
| 요소의 수를 바꿀 수 없음 |    요소의 수를 바꿀수 있음    |
|  유용한 함수 제공 안함   | 유용한 함수를 기본족으로 제공 |



#### 컬렉션 종류(많이 쓰이는 컬렉션)

1. List
2. Dictionary
3. HashSet



#### List

- 배열과거의 비슷함
- 색인 (0부터 n)을 통해 데이터에 접근
- 배열의 길이(담을 수 있는 최대 요소 수)를 언제든 바꿀 수 있음



##### 리스트 생성

~~~c#
List<int> scores = new List<int>();
List<string> names = new List<string>(6); // (6) → 총 용량

List<T> <변수명> = new List<T>();
List<T> <변수명> = new List<T>(int capacity); 
~~~

- \<T>
  - 어떤 자료형을 담을지를 표현함
  - 제네릭(generic)프로그래밍의 일부
  - C++에선 템플렛 프로그래밍이라고도 함
- 리스트를 생성하는 코드
- 리스트의 길이는 0



##### 리스트에 데이터 삽입하기

~~~c#
List<int> scores = new List<int>(3);

scores.Add(10);
scores.Add(30);

List<string> names = new List<string>(6); 
names.Add("Bob");
names.Add("Sally");

Add(T data); // 자료형의 T의 데이터를 리스트에 넣기


// 리스트에 데이터 여러개 삽입하기
int[] dummy = {10, 20};
List<int> scores = new List<int>(3);
scores.AddRange(dummy);

List<string> names = new List<string>(5);
names.Add("Bob");
names.Add("Sally");

List<string> names1 = new List<string>();
names1.AddRange(names);

AddRange(IEmumerable<T> collection);
~~~



##### 데이터가 리스트에 있는지?

~~~c#
List<int> scores = new List<int>(3); // {10, 30}
bool bResult1 = scores.Contains(40); // false
bool bResult2 = scores.Contains(20); // true

List<string> names = new List<string>(3); // {"Bob", "John"}
bool bResult1 = names.Contains("bob"); // false (대소문자 구분)
bool bResult2 = names.Contains("Bob"); // true


bool bResult = list.Contains(T data); // 해당 데이터가 있으면 참, 아니면 거짓을 반환
~~~



##### 데이터가 어디에 있는지?

~~~c#
List<int> scores = new List<int>(3); // {30, 30}
int index1 = scores.IndexOf(40); // -1
int index2 = scores.IndexOf(30); // 0

List<string> names = new List<string>(5); // {"Bob", "John"}
int index1 = names.IndexOf("bob"); // -1 (대소문자 구분)
int index2 = names.IndexOf("John"); // 1


int index = list.IndexOf(T data); // 해당 데이터가 `처음`으로 나타난 위치의 색인을 반환
            											// 없다면 -1을 반환

// 마지막 인덱스를 가져오고 싶을 때
List<int> scores = new List<int>(3); // {30, 30}
int index1 = scores.LastIndexOf(40); // -1
int index2 = scores.LastIndexOf(30); // 1

int index = list.LastIndexOf(T data); // 해당 데이터가 `마지막`으로 나타난 위치의 색인을 반환
																			// 없다면 -1을 반환
~~~



##### 리스트 중간에 데이터 넣기

~~~c#
List<int> scores = new List<int>(3); // {30, 30}
scores.Insert(2, 10); // {30, 30, 10}

List<int> names = new List<int>(5); // {"Bob", "zoe"}
names.Insert(1, "Pope"); {"Bob", "Pope", "zoe"}

Insert(Int index, T data); //리스트의 index번째에 data를 넣기
~~~



##### 리스트의 총 용량과 길이

~~~c#
List<int> scores = new List<int>(3); // {30, 40}
Console.WriteLine($"{scores.Capacity}, {scores.Count}"); // "3, 2"

int capacity = list.Capacity; 
int cout = list.Count;

List<T>의 현재 총 용량(capacity)과 사용량(count)을 알려줌
~~~



##### 잘못된 색인을 넣으면?

~~~c#
List<int> scores = new List<int>(3); // {30, 40}
score.Insert(10, 10); // 에러! 이럴경우 if문으로 처리
~~~



##### 리스트에서 요소 삭제하기

~~~c#
List<int> scores = new List<int>(3); // {10, 30, 40}
bSuccess1 = scores.Remove(10); // 참
bSuccess1 = scores.Remove(100); // 거짓

bool bSuccess = list.Remove(T data); // 리스트에 data가 있으면 지우고 참을 반환, 없으면 거짓을 반환	
~~~



#####  리스트 요소에 접근하기

~~~c#
List<int> scores = new List<int>(3); // {10, 30}
scores[2] = 100; // 프로그램 실행하면 예외발생
int myScore = scores[0]; // myScore: 10
scores[0] = 100;  // {100, 30}


T data = list.[index]; 			// 값 얻어오기
list.[index] = <T형 데이터>;  // 값 대입하기

~~~



##### 리스트에서 배열로 변환하기

~~~c#
List<string> names = new List<string>(5);
names.Add("Box");
names.Add("Toy");
names.Add("Cat");

string[] nameArray = names.ToArray();

T[] array = list.ToArray(); // List<T>에서 순수한 배열 T[]로 변환하는 함수
~~~



##### List \<T>의 모든 요소를 지우기

~~~c#
List<string> names = new List<string>(5); // {"Bob", "John", "Sam"}

names.Clear();

list.Clear(); // List<T>의 `요소`를 모두 지우는 함수 (용량은 안변함)
~~~











