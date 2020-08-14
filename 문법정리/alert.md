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



~~~swift
extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }  
}

~~~





~~~swift
import UIKit

extension UIViewController {

    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

presentAlertWithTitle(title: "Test", message: "A message", options: "1", "2") { (option) in
    print("option: \(option)")
    switch(option) {
        case 0:
            print("option one")
            break
        case 1:
            print("option two")
        default:
            break
    }
}
~~~





alert Font 변경

~~~swift
 func showAlert(title:String, msg:String) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
    
    let titleFont = [NSAttributedString.Key.font: UIFont.NanumBold(size: 17)]
    let messageFont = [NSAttributedString.Key.font: UIFont.NanumRegular(size: 13)]
    
    let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
    let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)
    
    alert.setValue(titleAttrString, forKey: "attributedTitle")
    alert.setValue(messageAttrString, forKey: "attributedMessage")
    alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
    self.present(alert, animated: true)
  }
~~~

