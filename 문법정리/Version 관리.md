### Version관리

##### 버전체크

```swift
var systemVersion = UIDevice.current.systemVersion
```



base SDK : 라이브러리, 프레임워크 기반을 의미. maximum 버전으로 생각하면 됨.
Deployment target : 어느 버전까지 지원가능한지 버전. minimum 버전 으로 생각하면 됨.



### [iOS 앱 업데이트 (강제 업데이트, 선택 업데이트) 기능](http://monibu1548.github.io/2018/05/19/remote-config-forced-update/)







#### 업데이트 전에 체크 할 사항!!

isTest인지 아닌지

Appdelegate랑 SceneDelegate 체크

앱 내부 컨턴츠에서 `구글 스토어` 관련 컨텐츠가 있으면 리젝



#### 버전업데이트시

앱스토어로 내보내기



<img width="763" alt="스크린샷 2020-01-10 오후 1 43 29" src="https://user-images.githubusercontent.com/47776915/72126404-4ea5bf00-33af-11ea-8619-223a3601bfff.png">







![스크린샷 2020-01-10 오후 1 35 44](https://user-images.githubusercontent.com/47776915/72126296-f8388080-33ae-11ea-8cfc-0534fca87526.png)