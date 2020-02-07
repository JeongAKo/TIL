#  TextField

~~~swift

  private lazy var textfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "댓글을 입력해주세요."
    textfield.textColor = .lightGray
    textField.keyboardType = .emailAddress //키보드 타입
     textField.autocorrectionType = .no //자동완성 지우기
    textField.autocapitalizationType = .none //첫문자 대문자 안되게 막기
    textfield.borderStyle = .roundedRect
    textfield.layer.borderWidth = 1
    textfield.layer.borderColor = UIColor.lightGray.cgColor 
    textfield.font = UIFont.boldSystemFont(ofSize: 15)
    textfield.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(textfield)
    return textfield
  }()
~~~



#### 키보드에 맞춰서 textField 올리고 내리기

~~~swift
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
~~~



#### 아무데나 터치했을때 키보드 내리기

~~~swift
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
~~~



#### 키보드 나오기

~~~swift
  override func viewWillAppear(_ animated: Bool) {
    super .viewWillAppear(animated) // ViewWillApear에 적으면 앱키자마자
    textfield.becomeFirstResponder()
  }
~~~



#### 키보드 내리기

~~~swift
extension ReplyVC: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()

    return true
  }

}
~~~



#### PlaceHolder

~~~swift
extension NSAttributedString {
  class func settingPlaceholder (text: String) -> NSAttributedString {
    
    let placeholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray_999),   NSAttributedString.Key.font : UIFont.systemFont(size: 13)])  //글자색상, 폰트&사이즈
    return placeholder
  }
}

//사용시
textField.attributedPlaceholder = NSAttributedString.settingPlaceholder(text: "아이디(ID)")  
~~~



### UITextField 여러 줄 입력 -> UITextView

~~~swift
  private lazy var textView: UITextView = {
    let tv = UITextView()
    tv.layer.borderWidth = 1
    tv.layer.borderColor = UIColor.appColor(.gray_666).cgColor
    tv.backgroundColor = UIColor.appColor(.white_255)
    tv.font = UIFont.systemFont(ofSize: 14)
    tv.isScrollEnabled = false //입력할 때마다 텍스트들이 위로 올라가면서 윗 부분이 잘리는 것 해결
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


~~~



### Left Padding

~~~swift
extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

//How to use

textField.addLeftPadding()
~~~



#### 글자수 제한

~~~swift
    var tfTextBackup = ""

 @IBAction func didChanged(_ sender: UITextField) {

        guard var text = sender.text else { return }

           if text.count > 10{

           sender.text = tfTextBackup

            }else {

            tfTextBackup = text

        }
~~~



~~~swift
textField.autocorrectionType = .no //자동완성 지우기
textField.autocapitalizationType = .none //첫문자 대문자 안되게 막기
textField.isSecureTextEntry = true //비밀번호 암호화
~~~



###  입력된 숫자를 콤마로 구분하기

*TextField의 키보드 타입을 NumberPad로 바꿔줍니다.*

~~~swift

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // `,`를 통해 숫자를 구분
        formatter.locale = Locale.current // 지역에 따라 .decimal도 차이가 있으니 디바에스에 설정된 지역으로 값을 설정
        formatter.maximumFractionDigits = 0 //허용할 수 있는 최대 소숫점자리를 설정. 소숫점을 허용하지 않을 것이므로 0으로 설정
        
        return true
    }
}
~~~



