# Gesture





##### Long Press

```swift
let longPressGesture = CustomLongPressGesture(target: self, action: #selector(longPressAction))
    longPressGesture.minimumPressDuration = 0.5
    longPressGesture.delaysTouchesBegan = true
    longPressGesture.image = downLoadImg // #selector를 사용할 때는 임의로 파라미터를 전달할 수가 없다
                                         // 그래서 따로 CustomLongPressGesture를 만듬



func longPressAction(_ sender: CustomLongPressGesture) {
    guard let image = sender.image else {return}
      Alert.basicMessageAlert(self, message: AlertTitle.savePhoto, rightBtnTitle: "저장") {

      }
    }


class CustomLongPressGesture: UILongPressGestureRecognizer {
  var image: UIImage?
// ㅅㄷ
}
```
