# [Network] REST란? REST API란? RESTful이란?

#### REST API란? 

HTTP 통신에서 어떤 자원에 대한 CRUD 요청을 Resource와 Method로 표현하여 특정한 형태로 전달하는 방식



#### **REST란?** 

**Representational State Transfer 의 약자**로 소프트웨어 프로그램 개발의 **아키텍처 스타일**(`제약조건의 집합`)의 형식입니다. **일반적으로 REST라고 하면 좁은 의미로 HTTP를 통해 CRUD를 실행하는 API를 뜻합니다** 

_**CRUD(크러드)**는 `Create`, `Read`, `Update`, `Delete`의 약어로, 말 그대로 데이터의 생성, 조회, 수정, 삭제가 가능함을 나타냅니다._





'REST API는 기계와 기계가 HTTP를 이용하여 통신할때 resource는 URI 행위는 MEthod로 결과는 응답코드로 HTTP가 원래 기지고잇는 의미를 잘 활용하자라는 의미'

- #### REST 구성
  - **자원(RESOURCE)** - URI

  - **행위(Verb)** - HTTP Method( Create, Read, Update, Delete)
  - **표현(Representations)** - 클라이언트와 서버가 데이터를 주고받는 형태로` json`, `xml`, `text`, `rss` 등



- #### REST의 특징

  위 정의에 더하여 REST를 정의하기 위한 `조건`들은 다음과 같습니다.	

  - **'클라이언트-서버' 구조**: 자원(resource)이 있는 쪽이 서버가 되며, 요청을 하는 쪽이 해당 서버에 대한 클라이언트가 됩니다.
  - **무상태(Stateless)**: '서버'는 각각의 요청을 완전히 별개의 것으로 인식하고 처리해야하며, 이전 요청이 다음 요청의 처리에 연관이 되어서는 안됩니다. 즉 서버 session을 사용해선 안됩니다. 서버의 처리 방식에 일관성을 부여하고 서버의 부담을 줄이기 위한 것으로 보입니다.
  - **캐시 처리 가능(Cacheable)**: 대량의 요청을 효율적으로 처리하기 위해 캐시가 요구됩니다.
  - **계층화(Layered System)**: 클라이언트는 서버에 직접 연결되었는지 미들웨어에 연결되었는지 알 필요가 없어야 한다.
  - **Code on demand (optional)**: 서버에서 코드를 클라이언트에게 보내서 실행하게 할 수 있어야 한다.
  - **인터페이스 일관성(uniform interface)**: 자원은 유일하게 식별가능해야하고, HTTP Method로 표현을 담아야 하고, 메세지는 스스로를 설명(`self-descriptive`)해야하고, 하이퍼링크를 통해서 애플리케이션의 상태가 전이(`HATEOAS`)되어야 한다



> #### HTTP란?
>
> HTTP는 컴퓨터와 서버간의 네트워크 통신을 하기 위한 규약(프로토콜)중의 하나로 HTTP로 데이터가 서버로 전달될 때, method(Verb 라고도 불림)라는 속성을 반드시 가지게 되는데, method는 데이터를 보내는 목적을 표시해주는 역할을 하고, 같은 데이터가 전달되더라도 method가 다르면 데이터를 전달받은 서버는 method에 따라 데이터를 다르게 처리합니다.
>
> **HTTP method는 종류가 광장히 많지만 그 중에 GET, POST, PUT, DELETE를 가장 자주 씁니다.**

 

![스크린샷 2020-11-18 오후 10 08 19](https://user-images.githubusercontent.com/47776915/99534330-94c5a900-29ea-11eb-9249-2f761735a7e3.png)



#### RESTful이란? 

RESTful API라는 말은 REST 아키텍처 원칙을 모두 만족하는 API라는 것을 의미한다.

그 중에서도uniform interface을 제외한 나머지 제약 조건은 HTTP를 기반으로하는 REST는 HTTP에서 이미 충분히 지켜지고 있는 부분이라서 비교적 덜 주의를 기울여도 된다. RESTful하려면 **uniform interface( `HATEOAS`,`self-descriptive`)**를 잘 지켜야 한다.

