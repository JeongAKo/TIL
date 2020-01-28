

#### **숫자 단위 구분하기**

~~~swift
  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

~~~



~~~
@objc func didtapAppleButton() {
    if #available(iOS 13.0, *) {
      let provider = ASAuthorizationAppleIDProvider()
    } else {
      // Fallback on earlier versions
    }
~~~



#### /n 적용시

~~~swift
  private lazy var waithingDeliveryLabel: UILabel = {
    let label = UILabel()
    label.text = "배송\n준비"
    label.numberOfLines = 0 // 제한이 없이 Frame의 한계까지
    label.lineBreakMode = .byTruncatingTail
    label.lineBreakMode = .byWordWrapping // Frame의 가로 영역보다 길어지게 되면 자동으로 줄바꿈
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    addSubview(label)
    return label
  }()
~~~



numberOfLine의 경우 최대 몇줄로 표시할 수 있는지에 대한 설정

numberOfLines = 0 으로 하면 제한이 없이 Frame의 한계까지 줄이 늘어나게 됩니다.

LineBreakMode를 WordWrap으로 해주면 인위적인 줄바꿈 없이도 길이가 늘어나 Frame의 가로 영역보다 길어지게 되면 자동으로 줄바꿈이 일어나게 됩니다.

~~~swift
  private lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero) // (frame: CGRect.zero) 명시적으로
    addSubview(label)
    return label
  }()
~~~

