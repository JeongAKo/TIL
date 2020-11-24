## Access Control (접근 제한자)

접근제어는 객체지향 패러다임에서 중요한 개념 중 하나인 은닉화를 구현하기 위한 아주 중요한 기능입니다.

접근제어는 다른 모듈의 코드 또는 다른 소스 파일 등으로부터 접근을 제한하고 세부 구현 내용을 숨기고 접근할 수 있는 인터페이스를 지정 가능 합니다. 



- ##### 모듈(Module)

  import 를 통해 다른 모듈로부터 불러들일 수 있는 하나의 코드 배포 단위 

  Library / Framework / Application 등

- ##### 소스파일(Source File)

  모듈 내에 포함된 각각의 Swift소스코드 파일

  

#### Access Level

접근수준의 종류는 **open-> public -> internal -> file-private -> private**으로 갈 수록 더 제한적이라고 생각하시면 됩니다.

<img width="1024" alt="스크린샷 2019-10-10 오후 3 30 28" src="https://user-images.githubusercontent.com/47776915/66544364-e60e3280-eb72-11e9-940c-39a5d98b08e6.png">



<img width="1010" alt="스크린샷 2019-10-10 오후 3 24 02" src="https://user-images.githubusercontent.com/47776915/66544069-0be70780-eb72-11e9-8044-6313680cbb4f.png">



1. `open`, `public` - 프로젝트 내의 모든 `module` 해당 entity에 접근할 수 있습니다.
2. `internal` - `default` 접근 제어자로, entity가 작성된 `module`에서만 접근할 수 있습니다.
3. `fileprivate` - entity가 작성된 `source file`에서만 접근할 수 있도록 합니다. 서로 다른 클래스가 같은 파일안에 있고 `fileprivate`로 선언되어 있다면 둘은 서로 접근할 수 있습니다.
4. `private` - 특정 객체에서만 사용할 수 있도록 하는 가장 제한적인 접근제어자입니다. `fileprivate`과 달리 같은 파일 안에 있어도 서로 다른 객체가 `private`로 선언되어 있다면 둘은 서로 접근할 수 없습니다.

#### open과 public의 차이

둘의 차이는 `open`은 다른 모듈에서 `subclass`가 가능하지만, `public`은 그렇지 않다는 것입니다. 먼저 `open`은 `class`에만 사용될 수 있습니다. 그리고 한 모듈에서 만든 class를 `superClass`로 하는 `subClass`를 다른 모듈에서 만들기 위해서는 해당 `superClass`가 `open`으로 선언되어야 합니다. 당연히 `overriding`도 이 규칙이 적용됩니다.

( 주의 : open 접근수준은 Class에만 붙힐 수 있습니다. Struct와 Enum은 public부터 가능 ) 