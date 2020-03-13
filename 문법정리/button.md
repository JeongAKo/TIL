~~~swift
 lazy var userImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "userImage"), for: .normal)
    button.layer.cornerRadius = button.frame.width / 2
    button.titleLabel?.textAlignment = .left //set align
    button.contentHorizontalAlignment = .left // 위에꺼가 안먹혀서 이렇게 하니까 된다
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13) ///버튼 폰트 사이즈
    button.titleLabel?.dynamicFont(fontSize: 16, weight: .medium) //다이나믹
    button.adjustsImageWhenHighlighted = false //버튼 image있을때 hightlight 금지
    button.clipsToBounds = true // 테두리가 기준으로 서브뷰들은 짤린다
    button.masksToBounds = true // 안잘리고 삐져나온다
    button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
   // ↑정렬 왼쪽으로
   button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
   // ↑정렬하고 Inset주고 싶을때
    button.contentMode = .scaleAspectFit
    addSubview(button)
    return button
  }()

~~~



#### 버튼 클릭시 이미지 변경

~~~swift
 private lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "bookMarkOpa"), for: .normal)
    button.setImage(UIImage(named: "bookMarkOpaSelected"), for: .selected) 
    button.addTarget(self, action: #selector(didTapScrapButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

@objc func didTapScrapButton(_ sender: UIButton) {
    sender.isSelected.toggle()
  }
~~~



#### 버튼 borderColor Setting

~~~swift
button.layer.borderColor = UIColor.lightGray.cgColor
button.layer.borderWidth = 1
~~~



#### **aspect fit** 

```swift
  button.imageView?.contentMode = ContentMode.scaleToFill //되나?

  button.imageView?.contentMode = .scaleAspectFill //이걸로 함 
```



#### 버튼 텍스트 & 이미지 정렬

~~~swift
  override func viewDidLoad() {
    super.viewDidLoad()
    alignButtonImageAndTitle(button: `myButton`)
  }


  private func alignButtonImageAndTitle(button: UIButton) {
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10 )
  }


~~~

※ 참고 Bolg

https://medium.com/short-swift-stories/using-uiedgeinsets-to-layout-a-uibutton-44ba04dd085c



#### 버튼 UIEdgeInsets 주기 

~~~swift
//text insets
button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)

//Content inset
button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5) //이걸 같이 해줘야지 글자가 짤리지 않고 나온다
~~~

![스크린샷 2019-08-04 오후 5 32 03](https://user-images.githubusercontent.com/47776915/62421513-caebf600-b6dd-11e9-8002-346c2f4dc7a3.png)



#### 뷰 위에 버튼이 있을때(View.addsubView(button)) 안눌리는 현상 해결

~~~swift
  private lazy var plusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "opaPlusButton"), for: .normal)
    button.addTarget(self, action: #selector(didTapPlusButton(_:)), for: .touchUpInside)
    productImageView.addSubview(button)
    productImageView.isUserInteractionEnabled = true //요거
    return button
  }()
~~~



#### 버튼 틴트컬러 변경

~~~swift
let button = UIButton(type: .custom)
let image = UIImage(named: "image_name")?.withRenderingMode(.alwaysTemplate) //랜더링을 해줘야 한다
button.setImage(image, for: .normal)
button.tintColor = UIColor.yellow
~~~



#### 버튼 선택영역 늘리기

https://kimtruth.github.io/2018/02/25/iOS-UIButton-touch-area/



#### 커스텀 UIButton 클릭시 항상 특정 메소드 호출하기

http://minsone.github.io/mac/ios/always-custom-button-call-methods