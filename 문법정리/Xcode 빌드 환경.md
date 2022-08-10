## Xcode  Test / Release 버전 빌드환경 분리

https://leechanho.tistory.com/48

[https://medium.com/@hanulyun88/ios-multiple-configurations-%EB%A1%9C-debug-release-%EA%B5%AC%EB%B6%84%ED%95%B4-%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0-1-43a6f8bd1b5b](https://medium.com/@hanulyun88/ios-multiple-configurations-로-debug-release-구분해-배포하기-1-43a6f8bd1b5b)

## Find My app’s crash logs

1. Open **Xcode**.
2. Select **Window** from the menu bar.
3. Go to **Organizer > Crashes**.
4. Choose **App Store** from the drop down menu.

## 빌드 속도 어떻게 빠르게 하나?

By. Naver Tech 이재성(08.19.2020)

빌드 속도 측정 Cmd+9 

<img width="401" alt="스크린샷 2020-08-19 오후 6 32 32" src="https://user-images.githubusercontent.com/47776915/90618006-5a613a00-e24a-11ea-9af7-9156005c7471.png">

빌드 기록을 확인 할 수 있다.

 클릭하면 빌드 속도를 확인할수 있다.

<img width="1014" alt="스크린샷 2020-08-19 오후 6 33 23" src="https://user-images.githubusercontent.com/47776915/90618105-78c73580-e24a-11ea-87da-8e0a32469a25.png">

build Timing Summary 를 알고 싶다면?

<img width="610" alt="스크린샷 2020-08-19 오후 8 01 29" src="https://user-images.githubusercontent.com/47776915/90627318-c8136300-e256-11ea-8b13-e7fc269db9a7.png">

<img width="981" alt="스크린샷 2020-08-19 오후 8 03 54" src="https://user-images.githubusercontent.com/47776915/90627583-1d4f7480-e257-11ea-8203-f9d972aa0e22.png">

##### 1. Xcode → File → WorkSpace Setting 설정

<img width="535" alt="스크린샷 2020-08-19 오후 6 48 09" src="https://user-images.githubusercontent.com/47776915/90619736-88477e00-e24c-11ea-86b1-dfefa7f13eff.png">

##### 2. Edit Scheme → 병렬 빌드(Parallelize Build) 옵션 ON

<img width="895" alt="스크린샷 2020-08-19 오후 6 49 09" src="https://user-images.githubusercontent.com/47776915/90619836-aca35a80-e24c-11ea-9b44-32deb58b5d95.png">

<img width="623" alt="스크린샷 2020-08-19 오후 5 56 57" src="https://user-images.githubusercontent.com/47776915/90614317-7c0bf280-e245-11ea-89b0-50ff64d01e56.png">

##### 3. Build Setting → Build Architecture Only ON

​        디버그 상태일때 한가지 아키텍쳐만 빌드 하도록

<img width="705" alt="스크린샷 2020-08-19 오후 6 55 25" src="https://user-images.githubusercontent.com/47776915/90620535-8cc06680-e24d-11ea-8a6a-33aee216f824.png">

##### 4. Build Setting → Optimization Level None

앱의 사이즈와 실행속도를 좋게 만들면 코드에 대한 최적화 과정이 들어가는데 최적화 시간이 추가로 들어가기 때문에 빌드속도는 느려진다.

<img width="864" alt="스크린샷 2020-08-19 오후 6 58 26" src="https://user-images.githubusercontent.com/47776915/90620858-f93b6580-e24d-11ea-87f8-8f6c85ee636c.png">

##### 5. Build Setting → dSYM 파일 생성 OFF

<img width="693" alt="스크린샷 2020-08-19 오후 7 03 07" src="https://user-images.githubusercontent.com/47776915/90621397-a4e4b580-e24e-11ea-8b6a-fdcafa724d20.png">

##### 6. Compilation Mode 변경점이 있는 부분만 빌드

<img width="598" alt="스크린샷 2020-08-19 오후 7 05 24" src="https://user-images.githubusercontent.com/47776915/90621636-f12ff580-e24e-11ea-8746-b9e5e1eead8a.png">

### Dependency Mamager

> PreCompile 미리 빌드해놓은 파일들을 사용하기 떄문에 빌드시간이 없음

Cocoapod - 소스코드가 그대로 들어오기 때문에 컴파일시 매번 pod으로 설치한 라이브러리를 설치 / Cocoa pods-Binary 3rd Party 이기때문에 버그가 좀 있음

Carthage - 기본적으로 precompile 이므로 속도가 빠름. 체크아웃 업데이트 시 불편(협업시 불편한점은 Rome으로 해결)

Swift Package Mamager 

#### 코드 레벨에서 컴파일 속도를 빠르게 하는 방법

##### 빌드속도를 느리게 만드는 요인 제거

- 타입추론
- 삼항연산자
- nil 변합 연산자

##### 빌드속도가 오래걸리는 코드 경고표시

프로젝트 세팅 → Other Swift Flags 에 추가 <milisecond>에 원하는 시간 넣기  *ex) 200~500정도*

![스크린샷 2020-08-19 오후 6 01 09](https://user-images.githubusercontent.com/47776915/90614690-f89ed100-e245-11ea-9f7f-58856b610cfa.png)

##### 추천!

![스크린샷 2020-08-19 오후 6 01 53](https://user-images.githubusercontent.com/47776915/90614765-12401880-e246-11ea-899e-4e401ea373d2.png)
