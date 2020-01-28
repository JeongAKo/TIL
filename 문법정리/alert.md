```swift
//Declare Alert Controller
let alertController = UIAlertController(title: "알림", message: "알림창입니다", preferredStyle: .alert) //title이랑 message 없으면 nil

//Declare Action
let doneAction = UIAlertAction(title: "확인", style: .default, handler: {(UIAlertAction) in print("확인되었습니다")})
let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil))
//Add Action
alertController.addAction(doneAction)
alertController.addAction(cancelAction)

//Present Alert Controller
self.present(alertController, animated: true, completion: nil)
```

