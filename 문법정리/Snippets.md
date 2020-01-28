# Snippet

코드를 깨끗하고 읽기 쉽게 쓰는 것이 중요한 만큼 정리를 잘 하는 것 또한 매우 중요합니다.

파일안에서 코드를 세분화 하는 좋은 방법은 `MARK`를 이용하는 것입니다.

Xcode11로 넘어오면서 미니맵기능이 추가됨에 따라 MARK의 중요성은 더욱 높아졌습니다.



#### **아래와 같이 MARK를 사용하여 섹션을 나눌 수 있습니다.**

**UIViewController**

~~~swift
// MARK: - Properties
// MARK: - IBOutlets
// MARK: - Life cycle
// MARK: - Set up
// MARK: - IBActions
// MARK: - Navigation
// MARK: - Network Manager calls
// MARK: - Extensions
~~~

아키텍쳐에 따라 각기 다른 MARKs가 필요합니다. 위의 snippet code은 간단한 `MVC`아키텍쳐를 위한 예제입니다.



**model**

~~~swift 
// MARK: - Attributes
  
// MARK: - Initializers
  
// MARK: - Parsers
~~~





#### MARKs Code를 사용하면 좋은점

1. 코드의 일관성
2. 손쉬운 섹션이동
3. 협업하는 다른 개발자를 위해
4. 깔끔한 코드 정리
5. 개발 환경 향상 



#### 나만의 Snippet 만들기

Xcode안에서 snippet을 추가하려면 추가하려는 부분을 선택한 후 우클릭을 하면 'Create Code Snippet' 을 누르면 추가 할 수 있습니다.

<img width="551" alt="스크린샷 2019-10-12 오후 3 04 11" src="https://user-images.githubusercontent.com/47776915/66695897-a6298580-ed01-11e9-89e3-ccfcf565925d.png">





*Summary* 에서 해당 snippet에 대한 간단한 설명을 쓸 수 있습니다.

*Completion*에서 단축키 설정도 할 수 있습니다.

![스크린샷 2019-10-12 오후 3 07 30](https://user-images.githubusercontent.com/47776915/66696126-24872700-ed04-11e9-886d-6077ed472d4d.png)

#### 단축키로( `cmd` + `shift` + `L` ) 바로 접근할 수 있습니다.



[참조](https://medium.com/better-programming/helpful-code-snippets-for-ios-21aa5ef894de)



