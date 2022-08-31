[ReactiveX](https://reactivex.io/)

# RxSwift

**패러다임**은 어떤 한 시대 사람들의 견해나 사고를 근본적으로 규정하고 있는 테두리로서의 인식의 체계, 또는 사물에 대한 이론적인 틀이나 체계를 의미하는 개념이다

> Swift 는 객체지향 프로그래밍 패러다임과 함수형 프로그래밍 패러다임을 가지고 있는 프로토콜 지향 언어 입니다.

**RX**는 **ReactiveX** 이고, **ReactiveX**는 **Reactive eXtensions** 의 줄임말

RX는 Micorsoft가 .NET에서 사용하려고 만든 Open Source Library 로  시작했었습니다.

##### what exactly *is* RxSwift?

***RxSwift** is a library for composing asynchronous and event-based code by using observable sequences and functional style operators, allowing for parameterized execution via schedulers*.

# RxCocoa

RxCocoa란 기존 Cocoa Framework에 Rx기능을 합친 RxSwift기반의 라이브러리

UIKit에 UI다룰때 편한 extention들이 있는 framework

*RxSwift* is a framework for interacting with the Swift programming language, while *RxCocoa* is a framework that makes Cocoa APIs used in iOS and OS X easier to use with reactive techniques.

#### Observables and Observers

- An ***Observable*** emits notifications of change.
- An ***Observer*** subscribes to an Observable and gets notified when that Observable has changed.

observable == publisher ???

Observer == subscriber ???

### The DisposeBag

어떻게 DisposeBag없이 사용할수있나?

## Operators

##### Debounce vs Throttle

- Throttle 는 여러번 발생하는 이벤트를 일정 시간 동안, 한번만 실행 되도록 만드는 개념. 이벤트가 발생하는 최소 간격을 제한
  - 버튼 탭
  - 스크롤을 빨리 내리면 3초의 간격 몇천개 데이터 요청할때
- Debounce 는 여러번 발생하는 이벤트에서, 가장 마지막 이벤트 만을 실행 되도록 만드는 개념. 다시 누르면 타이머가 리셋된다.
  - 자동완성
  - 연관검색어 노출

##### ObserveOn, SubscribeOn

일반적으로 subscribeOn 함수는 호출 시점 상위에 해당하는 부분의 쓰레드를, observeOn은 호출시점 하위 스트림의 쓰레드를 설정한다

- subscribeOn 는 [첫번째 스트림 ~ observeOn 호출 전 까지의 스트림] 의 쓰레드를 지정
- observeOn 은 [해당 observeOn 호출 이후의 스트림] 의 쓰레드를 지정한다.

observable

subject

observer

##### RxCocoa

UI작업의 특징

Observabel/Driver

Subject/ Relay

#### Memory Leak 주의❗️

https://medium.com/fantageek/rxswift-with-mvvm-e4af71413298
