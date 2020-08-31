## Carthage(카르타고) 적용하기

터미널에서 프로젝트의 루트 디렉토리(디렉토리는 `.xcodeproj` 파일을 포함합니다)로 이동합니다 



`touch`명령어와함께 비어있는 Cartfile을 생성합니다

```
touch Cartfile
```



그리고 난후 편집을 위해 파일을 엽니다

```
open -a Xcode Cartfile
```



다음을 Cartfile에 추가하고 저장합니다 (예시)  *2020.08.25 기준*

```
github "SnapKit/SnapKit" ~> 5.0.0
github "Alamofire/Alamofire" ~> 5.2
github "airbnb/lottie-ios" "master"
```



Xcode에서 Cartfile을 닫고 터미널로 되돌아가서 다음코드를 실행합니다

```
carthage update --platform iOS
```

`--platform iOS` 선택은 iOS를 위한 프레임워크만 만드는걸 보증합니다. 플렛폼을 지정하지 않는다면, 카르타고는 기본적으로 라이브러리가 지원되는(Mac, iOS 플렛폼 모두) 모든 플렛폼을 위한 프레임워크를 구축합니다.



~~~
*** Cloning lottie-ios
*** Cloning Alamofire
*** Cloning SnapKit
*** Checking out Alamofire at "5.2.2"
*** Checking out lottie-ios at "8def94c0fc611c548c983f19127f861573e73375"
*** Checking out SnapKit at "5.0.1"
.
.
.
//다음과 비슷한 결과를 보여주는 출력이 표시
~~~



<img width="1039" alt="스크린샷 2020-08-25 오후 3 12 42" src="https://user-images.githubusercontent.com/47776915/91129721-6f741800-e6e5-11ea-9e73-6dcf2a2dac36.png">

carthage update를 하고 나면 이와같이 파일이 생성이 됩니다.



#### **프로젝트에 라이브러리 연결하기**

`Carthage` 파인더 윈도우 창에서 `Build/iOS`로 이동후 `Alamofire.framework`와 `AlamofireImage.framework`를 Xcode의 `Linked Frameworks and Libraries` 로 드레그 합니다.

![스크린샷 2020-08-25 오후 3 15 02](https://user-images.githubusercontent.com/47776915/91129918-c24dcf80-e6e5-11ea-88da-dfaf6c557929.png)



#### 프로젝트에 Run Script 추가

다음으로 `Build Phases`로 넘어가고 왼쪽 상단에 있는 `+` 를 클릭하여 `new Run Script `빌드 단계를 추가합니다. 그리고 다음 명령을 추가합니다

![스크린샷 2020-08-25 오후 3 16 04](https://user-images.githubusercontent.com/47776915/91130011-e7424280-e6e5-11ea-920b-35e5ec5aa8e4.png)



![스크린샷 2020-08-25 오후 3 22 32](https://user-images.githubusercontent.com/47776915/91130573-ce865c80-e6e6-11ea-8a17-40bab03ffbde.png)

`“/usr/local/bin/carthage copy-frameworks” `를 복사해서 추가해 주고,

Add Input Files 에다가 각각 추가한 라이브러리 정보를 추가해줘야됩니다.

‘$(SRCROOT)/Carthage/Build/iOS/라이브러리명.framework’



~~~
//예제
$(SRCROOT)/Carthage/Build/iOS/Alamofire.framework

$(SRCROOT)/Carthage/Build/iOS/Lottie.framework

$(SRCROOT)/Carthage/Build/iOS/SnapKit.framework
~~~



이제 빌드하면 끝!