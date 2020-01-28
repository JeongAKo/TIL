# Apple Login

https://www.youtube.com/watch?v=vuygdr0EcGM







버튼은 다른 버튼들의 크기보다 작으면 안된다.

https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple/overview/

~~~swift
import AuthenticationServices	

  func setupView() {
    let appleButton = ASAuthorizationAppleIDButton()
    view.addSubview(appleButton)
    
  }
~~~





heightㅇ은 안잡아줘도됨 Y좌표만 잡아주면 된다 