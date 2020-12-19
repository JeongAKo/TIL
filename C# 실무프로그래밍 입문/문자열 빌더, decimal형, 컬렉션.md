## 문자열 빌더(string builder)

문자열 합치기는 느릴수 있다

![스크린샷 2020-12-19 오전 12 18 29](https://user-images.githubusercontent.com/47776915/102630306-ba7fd280-418f-11eb-9b94-4bda139a06e4.png)

- 문자열을 효율적으로 만들어주는 라이브러리*(사실은 클래스)*

- 대략적인 동작방법

  - 긴 문자열을 담을 수 있는 충분한 공간을 미리 확보
  - 추가되는 문자열들로 그 공간을 차례대로 채워 나감
  - 모든 것이 준비되면 최종적으로 문자열을 만들어서 반환

  ~~~c#
  // 총 용량이 maxCharCount인 StringBuilder 생성
  StringBuilder <변수명> = new StringBuilder(int maxCharCount);
  
  // 문자열과 줄바꿈을 추가 (뒤에 \n 붙인 효과)
  AppendLine(string text);
  
  // 문자열 추가
  Append(string text);
  ~~~

  ![스크린샷 2020-12-19 오전 12 46 36](https://user-images.githubusercontent.com/47776915/102633355-a8a02e80-4193-11eb-9e53-26e1b4324eee.png)

![스크린샷 2020-12-19 오후 3 54 42](https://user-images.githubusercontent.com/47776915/102683196-84cffd80-4212-11eb-99fe-7c5286b60737.png)



#### 배열의 총 용량과 현재 사용중인 길이 얻기

- 각각 내부 배열의 총용량과 길이 값을 가지고 있음(함수 아님)

~~~c#
Console.WriteLin($"Capacity: {builder.Capacity}, Length: {builder.Length}")
  
// 내부 배열의 총 용량
builder.Capacity; // builde는 StringBuilder

// 내부 배열의 현재 사용중인 길이
builder.Length // builde는 StringBuilder 
~~~

![스크린샷 2020-12-19 오후 4 05 35](https://user-images.githubusercontent.com/47776915/102683388-0a07e200-4214-11eb-8c90-7490a849a93b.png)

  

#### 추가공간 확보

~~~c#
builder.EnsureCapacity(1024)
EnsureCapacity(int newCapacity) // 기존공간보다 크게 늘릴 수 있다 (예: 기존공간이 1024일때 512로 변경 못함)
~~~

![스크린샷 2020-12-19 오후 4 09 13](https://user-images.githubusercontent.com/47776915/102683462-8c90a180-4214-11eb-9cba-27cbdc87dec0.png)



#### 최종 문자열 얻어오기

- 완성한 최종 문자열을 반환
- 현재 내부 배열의 사용중인 길이만큼만 반환
- 오버로드 함수가 있음 

~~~c#
StringBuilder = new StringBuilder(4096);
// 문자열 추가하는 코드 생략

string greetings = builder.ToString();

ToString();
~~~



#### 처음 확보해 둔 공간을 다 쓰면?

- 기능상의 문제 없음
- 전에 배열의 배열에서 학생을 추가했듯이 StringBuilder사 자동적으로 내부공간을 늘린 뒤 모든 데이터를 복사
- 복사를 안 할수록 좋으므로 처음부터 충분한 공간을 확보하자



##### StringBilder의 기타 함수 

- Insert()

  ~~~c#
  Insert(int index, string text);
  StringBilder의 내부 배열 중간(int index)에 새로운 문자열(string text)을 삽입
  ~~~

  

- Replace()

  ~~~c#
  모든 old를 new로 바꿈
  Replace(char old, char new);
  
  start번째부터 start + count 번째 사이에 있는 모든 old를 new로 바꿈
  Replace(char old, char new, int start, int count);
  ~~~

  

- Remove()

  ~~~c#
  start번째 부터  length개 만큼의 문자를 지움
  Remove(int start, int length);
  
  StringBuilder builder = new StringBuilder(4096);
  builder.Append("Hello Pope!");
  builder.Remove(8,2);
  ~~~

  

- Clear() 

  ~~~c#
  임시 문자열을 제거하는 함수
  이 함수를 호출 후, 길이를 확인하면 0
    
  builder.Clear();
  Console.WriteLine(builder.Length) //0이 출력
  ~~~



#### StringBuilder vs 문자열 합치기

- 합칠 문자열이 몇 개 없다면 stringBuilder를 쓸 이유가 크게 없음
- 대여섯개 합치면 그때부터 stringBuilder를 고려
- 수십 개면 당연히 써야함





## decimal형

#####  부동소수점형의 정밀도 문제

- 지수에 따라 소수점이 둥둥~ 떠다니는 자료형
  - 0.05 = 5.0 * 10^-2 = 0.5 * 10^-1
- 비트수는 정해져 있는데 표현할 숫자가 너무 많음
- 부동소수점에서 근접한 두 수는 같은 값이 될 수도 있음

- 부동소수점형 값은 근사값임을 언제나 기억하자

##### 그런데도 부동소수점 형을 쓰는 이유는?

- CPU에서 자체적으로 지원하는 유일한 실수형→계산이 빠름
- 다른곳서 쓰기엔 크게 문제 없음



#### decimal 자료형

![스크린샷 2020-12-19 오후 7 55 35](https://user-images.githubusercontent.com/47776915/102687701-3895b500-4234-11eb-8bc6-909b9a3bb58d.png)

- CPU(기계) 자체에서 지원하는 형은 아님
- 금융권에서 돈 계산에 쓰기에 적합
- 일부 언어들도 비슷한 해결책이 있음
  - Java의 경우 GingDecimal



#### decimal 자료형 사용하기

~~~c#
decimel num1 = 10.1234567876543234567m; // OK
decimel num2 = 10.1234567876543234567;  // 컴파일 오류
decimel num3 = 10m; // OK 
decimel num4 = 10;  // OK
~~~

- 접미사 `m` 사용
  - 정수일 때는 안붙야도 됨(묵시적 변환 허용, 단 그 반대는 안됨)
  - 부동소수점일때는 **반드시** 붙여야함(명시적 변환만 허용)



















  