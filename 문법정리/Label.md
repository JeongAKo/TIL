

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
    label.textColor = .white
    label.dynamicFont(fontSize: FontSize.f32, weight: .medium)
    label.text = "레이블"
    view.addSubview(label)
    return label
  }()
~~~



#### attributedText

~~~swift
  private lazy var replyTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "댓글 1"
    label.attributedText = getAttributeString(rate: "\(info.starAvg)") //색상 변경해주기 
    label.dynamicFont(fontSize: FontSize.f26, weight: .medium)
    view.addSubview(label)
    return label
  }()


  private func getAttributeString(rate: String) -> NSMutableAttributedString {
    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10),
      .foregroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: "★",
                                                    attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10, weight: .bold),
      .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ]
    let attributeString1 = NSMutableAttributedString(string: rate,
                                                     attributes: attributes1)
    mutableAttributedString.append(attributeString)
    mutableAttributedString.append(attributeString1)

    return mutableAttributedString
  }
~~~



Read More...

https://stackoverflow.com/questions/32309247/add-read-more-to-the-end-of-uilabel

https://stackoverflow.com/questions/42433508/how-to-add-function-call-not-hyperlink-to-part-of-an-nsattributedstring-in-a-u

 



#### 텍스트 레이블 끝(처음)에 이미지 첨부

~~~swift
  private func getAttributeStringWithImage(rate: String) -> NSMutableAttributedString {
    let mutableAttributedString = NSMutableAttributedString()
    
    let replyAttribute: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: FontSize.f26),
      .foregroundColor: UIColor.appColor(.black_17)
    ]
    
    let repAttributeString = NSMutableAttributedString(string: rate,
                                                       attributes: replyAttribute)
    
    let image1Attachment = NSTextAttachment()
    image1Attachment.image = UIImage(named: "fp_b_pen")
    let image1String = NSAttributedString(attachment: image1Attachment)
    
    mutableAttributedString.append(repAttributeString)
    mutableAttributedString.append(image1String)
    
    return mutableAttributedString
  }
  
  //How to use
  label.attributedText = getAttributeStringWithImage(rate: " 새로운 친구 새로운 친구새로운 친구 새로운 친구새로운 친구새로운 친구새로운 친구")
~~~





