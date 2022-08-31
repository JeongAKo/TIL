## Enum

```swift
let bridgeName = BridgeName(rawValue: message.name)

  switch message.name} {
    case BridgeName.changeGroupHandler.rawValue:
         break      
    case BridgeName.groupBackHandler.rawValue:
         break
    case .none:
         break
}
```

```swift
// 연관값이 있는 열거형 - 구체적인 정보가 연관값에 들어 있음
enum Computer {                         
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

let chip = Computer.cpu(core: 8, ghz: 3.5)


switch chip {
case .cpu(let a, let b):    // let a = 연관값, let b = 연관값
    print("CPU \(a)코어 \(b)GHz입니다.")
case let .ram(a, _):
    print("램 \(a)기가램 입니다.")
case let .hardDisk(a) :
    print("하드디스크 \(a)기가 용량입니다.")
} 
```



##### allCases

enum의 case들을 배열과 같이 순회할 수 있다

```swift
// enum Compass: String, CaseIterable {
enum Compass: CaseIterable {
    case east, west, south, north
}


Compass.allcases.forEach {
    print("\($0)")
}
```

```swift

extension BridgeName {
  init(value: String) {
     switch value {
     case "changeGroupHandler": self = .changeGroupHandler
     case "groupBackHandler": self = .groupBackHandler
     case "shareHandler": self = .shareHandler
     case "classJoinHandler": self = .classJoinHandler
     case "kakaoFriendHandler": self = .kakaoFriendHandler
     case "homeHandler": self = .homeHandler
     case "clipBoardHandler": self = .clipBoardHandler
     case "goToChatDetail": self = .goToChatDetail
     case "outLinkForBrowser": self = .outLinkForBrowser
     case "gotofriendprofile": self = .gotofriendprofile
     case "inAppPurchase": self = .inAppPurchase
     case "goToProfile": self = .goToProfile
//     case "activityShareHandler": self = .activityShareHandler
     case "goToDetailClass": self = .goToDetailClass
     case "goToSearch": self = .goToSearch
     case "goToFeedDetail": self = .goToFeedDetail
     case "goToReviewFeedDetail": self = .goToReviewFeedDetail
     case "goToFeedReply": self = .goToFeedReply
     case "goToFeedEdit": self = .goToFeedEdit
     case "goToReviewFeedEdit": self = .goToReviewFeedEdit
     case "webViewExit": self = .webViewExit
     case "goToChatList": self = .goToChatList
     case "goToChatRoom": self = .goToChatRoom
     case "exit": self = .exit
     case "goToHome": self = .goToHome
     case "skipToDetailClass": self = .skipToDetailClass
     case "goToStoreReview": self = .goToStoreReview
     case "review": self = .review
     case "goToClassTab": self = .goToClassTab
     default: self = .unknown
     }
   }
}
```



##### if문에서도 스위치문에서 사용하는 case문과 같이 사용 가능

```swift
if case Computer.hardDisk(gb: let gB) = chip {
    print("\(gB)기가 바이트 하드디스크임")
}


if case Computer.hardDisk(gb: let gB) = chip, gB == 256 {    // 처리를 다양하게 활용 가능
    print("256기가 바이트 하드디스크임")
}
```