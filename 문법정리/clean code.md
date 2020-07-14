## clean code

딕셔너리 활용하여 분기문을 없앤 코드

```swift
//적절한 곳에 딕셔너리 생성
let trackingStateMessages: [TrackingState.Reason : String] 
                         = [.initializing.        : "Move your phone".localized,
                            .excessiveMotion      : "Slow down".localized,
                            .insufficientFeatures : "Keep moving your phone".localized,
                            .relocalizing         : "Move your phone".localized]

//switch문 대체
self.instructionMessage = trackingStateMessages[reason]
```

