### UIView

뷰에 그라데이션 효과를 주고 싶을 땐 `CAGradientLayer` 객체를 만들어서 뷰의 레이어 위에 올리면 된다.

~~~swift
// CAGradientLayouer를 생성
let gradient = CAGradientLayer()

// frame을 잡기
gradient.frame = view.bounds

// 섞어줄 색을 colors에 넣어준 뒤
gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.yellow.cgColor]

// 위치
gradient.locations = [0, 0.5, 1]

// layer에 붙이기
view.layer.addSublayer(gradient)
~~~

[참고](https://blog.b1ue.sh/ios-gradient/)

https://woongsios.tistory.com/5





## Shadow

~~~swift
let yourView = UIView()
yourView.layer.shadowColor = UIColor.black.cgColor
yourView.layer.shadowOpacity = 1
yourView.layer.shadowOffset = .zero  // CGSize(width: 0.0, height: 5.0) 위치 배치할때
yourView.layer.shadowRadius = 10
~~~



https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-shadow-to-a-uiview





### 부분만 Corner주기

~~~swift
  override func viewDidLayoutSubviews() {
    uploadButton.layer.cornerRadius = uploadButton.frame.size.height/2
    uploadButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
  }
  
~~~



### [iOS/swift\] View에 View를 넣고 순서 변경하기]

~~~swift
// view1을 추가
self.view.addSubview(self.view1)


// view1을 0번째에 삽입
self.view.insertSubview(view: self.view1, at: 0)


// view1을 가장 앞으로
self.view.bringSubviewToFront(self.view1)


// view1을 가장 뒤로
self.view.sendSubviewToBack(self.view1)


// 0번째 view와 1번째 view의 위치를 변경한다.
self.view.exchangeSubview(at: 0, withSubviewAt: 1)

~~~

https://oaksong.github.io/2018/03/02/layout-subviews/





#### 팝오버(말풍선 모양의 팝업윈도우 컴포넌트)

~~~

~~~



https://www.appcoda.com/bezier-paths-introduction/







### BlurEffect 

~~~swift
let blurEffect = UIBlurEffect(style: .dark) // .light
let blurEffectView = UIVisualEffectView(effect: blurEffect)
blurEffectView.frame = view.bounds
backImageView.addSubview(blurEffectView) //Or self.insertSubview(blurredSubView, atIndex: 0)
~~~

