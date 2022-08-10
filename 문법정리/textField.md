# TextField

```swift
  private lazy var textfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "댓글을 입력해주세요."
    textfield.textColor = .lightGray
    textField.keyboardType = .emailAddress //키보드 타입
     textField.autocorrectionType = .no //자동완성 지우기
    textField.autocapitalizationType = .none //첫문자 대문자 안되게 막기
    textField.tintColor = UIColor.clear // 커서 없애기
    textfield.borderStyle = .roundedRect
    textfield.layer.borderWidth = 1
    textfield.layer.borderColor = UIColor.lightGray.cgColor 
    textfield.font = UIFont.boldSystemFont(ofSize: 15)
    textfield.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(textfield)
    return textfield
  }()
```

#### 키보드에 맞춰서 textField 올리고 내리기

```swift
 override func viewDidLoad() {
  super.viewDidLoad()

  NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


@objc private func keyboardWillShow(_ sender: Notification) {
    self.view.frame.origin.y = -150
  }

   @objc func keyboardWillHide(_ sender: Notification) {

    self.view.frame.origin.y = 0

  }
```

#### 아무데나 터치했을때 키보드 내리기

```swift
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
```

#### 키보드 나오기

```swift
  override func viewWillAppear(_ animated: Bool) {
    super .viewWillAppear(animated) // ViewWillApear에 적으면 앱키자마자
    textfield.becomeFirstResponder()
  }
```

#### 키보드 내리기

```swift
extension ReplyVC: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()

    return true
  }

}
```

#### PlaceHolder

```swift
extension NSAttributedString {
  class func settingPlaceholder (text: String) -> NSAttributedString {

    let placeholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray_999),   NSAttributedString.Key.font : UIFont.systemFont(size: 13)])  //글자색상, 폰트&사이즈
    return placeholder
  }
}

 private lazy var tagTextView: CustomField = {
    let field = CustomField(top: 12, left: 12, bottom: 12, right: 44)
    field.attributedPlaceholder = NSAttributedString(string: "태그를 입력해 주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray060)!,
                                                                                         NSAttributedString.Key.font : UIFont.AGothic(weight: .regular, size: 14)]
    )
      containerView.addSubview(field)
    return field
  }()

//사용시
textField.attributedPlaceholder = NSAttributedString.settingPlaceholder(text: "아이디(ID)")  
```

### UITextField 여러 줄 입력 -> UITextView

```swift
  private lazy var textView: UITextView = {
    let tv = UITextView()
    tv.layer.borderWidth = 1
    tv.layer.borderColor = UIColor.appColor(.gray_666).cgColor
    tv.backgroundColor = UIColor.appColor(.white_255)
    tv.font = UIFont.systemFont(ofSize: 14)
    tv.isScrollEnabled = false //입력할 때마다 텍스트들이 위로 올라가면서 윗 부분이 잘리는 것 해결

    //inset 없애기
    tv.textContainer.lineFragmentPadding = 0
    tv.textContainerInset = .zero

    tv.delegate = self
    view.addSubview(tv)
    return tv
  }()

extension ContentFixVC: UITextViewDelegate {
   func textViewDidChange(_ textView: UITextView) {
     let size = CGSize(width: view.frame.width, height: .infinity) // ---- 1
     let estimatedSize = textView.sizeThatFits(size) // ---- 2
     textView.constraints.forEach { (constraint) in // ---- 3
       if constraint.firstAttribute == .height {
         constraint.constant = estimatedSize.height
       }
     }

     let textRange = textView.selectedRange
     print("textRange", textRange)
   }

  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if (text == "\n") {
      textView.resignFirstResponder()
    }
    return true
  }

}
```

### Left Padding

```swift
extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

//How to use

textField.addLeftPadding()
```

#### 글자수 제한

```swift
    var tfTextBackup = ""

 @IBAction func didChanged(_ sender: UITextField) {

        guard var text = sender.text else { return }

           if text.count > 10{

           sender.text = tfTextBackup

            }else {

            tfTextBackup = text

        }
```

```swift
textField.autocorrectionType = .no //자동완성 지우기
textField.autocapitalizationType = .none //첫문자 대문자 안되게 막기
textField.isSecureTextEntry = true //비밀번호 암호화
```

### 입력된 숫자를 콤마로 구분하기

*TextField의 키보드 타입을 NumberPad로 바꿔줍니다.*

```swift
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // `,`를 통해 숫자를 구분
        formatter.locale = Locale.current // 지역에 따라 .decimal도 차이가 있으니 디바에스에 설정된 지역으로 값을 설정
        formatter.maximumFractionDigits = 0 //허용할 수 있는 최대 소숫점자리를 설정. 소숫점을 허용하지 않을 것이므로 0으로 설정

        return true
    }
}
```

#### 키보드 높이 구하기

```swift
override func viewDidLoad() {
        super.viewDidLoad()

         NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }

func keyboardWillShow(notification:NSNotification) {
        let userInfo:NSDictionary = notification.userInfo!
        let keyboardFrame:NSValue = userInfo.valueForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.CGRectValue()
        let keyboardHeight = keyboardRectangle.height

        print("키보드 : \(keyboardHeight)")

    }
```

#### 키보드 엔터키 변경하기

```swift
textField.returnKeyType = .done
textField.returnKeyType = .continue
textField.returnKeyType = .default
textField.returnKeyType = .go
textField.returnKeyType = .send
textField.returnKeyType = .join
textField.returnKeyType = .next
textField.returnKeyType = .route
textField.returnKeyType = .search
textField.returnKeyType = .google
textField.returnKeyType = .emergencyCall
```

### TextView 완료 눌렀을때 키보드 내려가기

```swift
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
```

## textView placeholder

```swift
    func placeholderSetting() {
        txtView.delegate = self // txtvReview가 유저가 선언한 outlet
        txtView.text = "내용을 입력해 주세요."
        txtView.textColor = UIColor.lightGray

    }

//    extension UITextViewDelegate
//    TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        } 
    }

    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력해 주세요."
            textView.textColor = UIColor.lightGray
        }
    }


출처: https://hyongdoc.tistory.com/280 [DevLogs & Everything]
```

#### 키보드 내릴시 TextView가 터치를 먹는 문제(버튼 만들어서 해결)

```swift
 lazy var txtView: UITextView = {
    let tv = UITextView()
    tv.backgroundColor = UIColor.appColor(.white_255)
    tv.font = UIFont.systemFont(ofSize: 15)
    tv.returnKeyType = .next
    tv.keyboardType = .default
    tv.autocapitalizationType = .none
    tv.autocorrectionType = .no
    tv.isScrollEnabled = true
    tv.delegate = self
    tv.layer.borderWidth = 1
    tv.layer.borderColor = UIColor.appColor(.dddddd).cgColor
    tv.textColor = UIColor.appColor(.black_17)
    tv.addDoneButton(title: "완료", target: self, selector: #selector(tapDone(_ :))) // 적용
    view.addSubview(tv)
    return tv
  }()

  @objc func tapDone(_ sender: Any) {
    self.view.endEditing(true)
    print("키보드 내려가랏")
  }



// textView가 터치를 먹기 때문에 키보드상단에 버튼을 생성해줘서 내려주기
extension UITextView {
  func addDoneButton(title: String, target: Any, selector: Selector) {
    let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                          y: 0.0,
                                          width: UIScreen.main.bounds.size.width,
                                          height: 44.0))
    let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
    toolBar.setItems([flexible, barButton], animated: false)
    self.inputAccessoryView = toolBar
  }
}
```

### 키보드에 맞춰서 레이아웃 라이브러리

//import KeyboardLayoutGuide

#### 키보드 높이 구하기

```swift
 if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height
      }
```

키보드 Curve 가져와서 맞춰서 올리거나 내릭

```swift
//addObserver
private func addKeyboardNotification() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }



//키보드 올렸다가 내렸다가
  @objc private func keyboardWillShow(_ notification: Notification) {
    let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt


    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height
      let tabbarHeight = self.tabBarController?.tabBar.frame.height ?? 0

      UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: UIView.AnimationOptions(rawValue: curve), animations: {
        self.view.layoutIfNeeded()
            //Code here
      })
    }
  }

  @objc private func keyboardWillHide(_ notification: Notification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keybaordRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keybaordRectangle.height

     //Code here
    }
  }
```

## TextView Link

```swift
textView.dataDetectorTypes = .link 
textView.isEditable = false
textView.isUserInteractionEnabled = true 
textView.isSelectable = true(Default)

*위의 조건이 필수조건
```

## TextView Inset없애기

```swift
tv.textContainer.lineFragmentPadding = 0
tv.textContainerInset = .zero
```

## 스크롤시 키보드 내리기

```swift
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if (scrollView.panGestureRecognizer.translation(in: scrollView).y < 0) {
        self.view.endEditing(true)
    }
  }
```

### 사이즈 핏하게

```swift
self.reply_textView.isScrollEnabled = false
//      let sizeToFitIn = CGSize(width: self.reply_textView.bounds.size.width, height: CGFloat(MAXFLOAT))
//      let newSize = self.reply_textView.sizeThatFits(sizeToFitIn)
//      self.replyTextViewHeight.constant = newSize.height
```
