### swift 정적클래스?

전역으로 접근해야 하는 유틸리티 클래스를 만들때

final class 로 생성 후 안에 인스턴스들을 static 으로 하던지(Java같은 경우 private으로 한다)

더 좋은 방법은 struct로 만든 후 static으로 개체 생성

정적클래스는 인스턴스를 만들 수 없기 때문에 final 이라던지 private으로 사용하게 됨







https://sujinnaljin.medium.com/swift-class-func-vs-static-func-7e6feb264147





##### shared