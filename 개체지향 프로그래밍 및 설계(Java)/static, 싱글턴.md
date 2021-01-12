## static

#####  정적 멤버함수

~~~java
// Math.java
public static int abs(int n) {
	return n < 0 ? -n : n;
}

// 메인함수
int absValue = Math.abs(-2)  // Math 클래스의 static 멤버함수 abs()를 호출

~~~

- 멤버함수 시그내쳐에 `static`만 붙여주면 됨
- 이 멤버 함수의 소유주는 인스턴스가 아니라 클래스
- `new`를 이용해  Math 개체를 생성 안해도 된다



##### 개체 단위가 아닌 클래스 단위에서 뭔가 하고 싶을 때는?

![스크린샷 2021-01-12 오전 11 30 27](https://user-images.githubusercontent.com/47776915/104261793-a8acf900-54c9-11eb-9a3b-ff21fc02a2eb.png)

클래스는 공장 개체는 그 공장에서 찍어 나온 물건들

만약 공장 가동중에 콜라캔을 총 몇 개 생산했는지 알고 싶다면??

~~~java
// 정적 멤버 변수
public class ColaCan {
	private int remainingMl;
	private static int numCreated; 
	
	public ColaCan(int initialMl) {
		this.remainingMl = initialMl
    ++numCreated; // 생성자가 호출 될 때 마다 1씩 증가 `static`이기 때문에 가능
	}
	
  
  public static void printStates() {
    	System.out.println("ml left: " + this.remainingMl); // 컴파일 오류 
    																											// (정적메서드에서 비정적메서드 접근)
  }
	public void pour(int ml) {
		//ml만큼 비우는 코드
	}
}
~~~

##### 정적메서드(클래스에 속한 메서드)에서 개체에 속한 멤버(함수/ 변수)에  접근할 수 없다



> ####  static 정리
>
> 1. static 멤버 변수 및 멤버 함수는 클래스에 속함(딱 하나만 존재)
> 2. static 아닌 것은 개체에 속함(따라서 개체 수만큼 존재)
> 3. 비정적 → 정적: 접근가능
> 4. 정적 → 비정적: 접근 불가능





## 싱글턴(singleton)

- 어떤 클래스에서 만들 수 있는 인스턴스 수를 하나로 제한하는 패턴
- 다음과 같은 조건을 충족하는 개체에 적합
  1. 프로그램 실행 중에 `최대 하나만` 있어야 함
  2. 이 개체에 `전역적으로 접근`이 가능해야 함



##### 싱글턴 패턴 예

~~~java
public class Singleton {
	private static Singleton instance;
	private Singleton() {
	}
	
	public static Singleton getInstance() {
		if (instance == null) {
				instance = new Singleton();
		}
		return instance;
	}
}

// 메인함수
Singleton instance0 = Singleton.getInstance();
Singleton instance1 = Singleton.getInstance();

System.out.println("same object? " + (instance0 == instance1)); // same object? true
~~~





### static vs 싱글턴

##### static으로는 못하는 일

1. 다형성을 사용 할 수 없다
2. 시그냐쳐를 그대로 둔 채 멀티턴(multiton)패턴으로 바꿀 수 없다
3. 개체의 생성시점을 제어할 수 없다
   - Java의 static은 프로그램 실행 시에 초기화됨
   - 단, 싱글턴을 사용해도 제어에 어려움이 있음