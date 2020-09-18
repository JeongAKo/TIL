~~~swift

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.backgroundColor = .white
    scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true) //주소찾기시 불편 이슈
    view.addSubview(scrollView)
    return scrollView
  }()
  ㄴ
  private lazy var containerView: UIView = {
    let containerView = UIView()
    self.scrollView.addSubview(containerView)
    return containerView
  }()

  private lazy var itemLabel: UILabel = {
    let label = UILabel()
    label.text = "아이템 레이블"
    label.textColor = UIColor.appColor(.black_17)
    label.font = UIFont.boldSystemFont(size: FontSize.f30)
    pwdBackView.addSubview(label)
    return label
  }()
~~~



#### 인디케이터 없애기

~~~swift
    scrollView.showsVerticalScrollIndicator = false
    scrollView.showsHorizontalScrollIndicator = false
~~~



#### Touchsbegaln 호출이 안될시

~~~swift
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true) //기존엔 이렇게 쓰면 아무데나 터치시 텍스트필드 내려감
    
    //BUT scrollView에 쓰면 터치를 쓰기 때문에 touchesBegan이 안불린다. (touchesMoved도 마찬가지)

    <해결방법>
    UITapGestureRecognizer를 추가
  
~~~



##### 방법 1 (**UITapGestureRecognizer**를 추가)

~~~swift
let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod))

singleTapGestureRecognizer.numberOfTapsRequired = 1

singleTapGestureRecognizer.isEnabled = true

singleTapGestureRecognizer.cancelsTouchesInView = false

scollView.addGestureRecognizer(singleTapGestureRecognizer)



func MyTapMethod(sender: UITapGestureRecognizer) {

        self.view.endEditing(true)

    }

~~~





##### 방법 2 (**UIScrollViewDelegate**를 사용)

~~~swift
func scrollViewWillBeginDragging(_ scrollView: UIScrollView){

        self.view.endEditing(true)

    }
~~~







## scrollView Alpha Animation

~~~swift
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentOffsetY = scrollView.contentOffset.y
    let height = UIScreen.main.bounds.height
    let offset = ((scrollView.contentOffset.y) / height) - 0.3
    let alpha = 0.8 * (offset > 1 ? 1 : offset)
    
    myBtn.alpha = alpha
    }
~~~



~~~swift
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let topInset = scrollView.contentInset.top
    let offset = (topInset + scrollView.contentOffset.y) / topInset
    let alpha = 0.8 * (offset > 1 ? 1 : offset)  // 0 ~ 0.8
    rootView.updateBlurView(alpha: alpha)
    
    let translationX = 30 * (offset > 1 ? 1 : offset)  // 0 ~ 30
    rootView.applyParallaxEffect(translationX: translationX)
    print("topInset", topInset)
    print("offset", offset)
    print("alpha", alpha)
  }
// 강사님 코드
~~~







### TabelView Height in ScrollView

~~~swift
 private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.backgroundColor = .white
    view.addSubview(scrollView)
    return scrollView
  }()
  
  private lazy var containerView: UIView = {
    let containerView = UIView()
    self.scrollView.addSubview(containerView)
    return containerView
  }()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.separatorStyle = .none
    tableView.delegate = self
    tableView.dataSource = self
    tableView.isScrollEnabled = false //설정
    tableView.showsVerticalScrollIndicator = false //설정
    tableView.alwaysBounceVertical = false //설정
    tableView.register(cell: MyCell.self)
    containerView.addSubview(tableView)
    return tableView
  }()

  var tableViewHeight: NSLayoutConstraint?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    self.tableView.removeObserver(self, forKeyPath: "contentSize")
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "contentSize" {
      if object is UITableView {
        if let newValue = change?[.newKey] {
          let newSize = newValue as! CGSize
          self.tableView.snp.remakeConstraints { make in
            make.top.equalTo(seperateLine.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(newSize.height)
          }
        }
      }
    }
  }



extension MyVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
 }
~~~





#### 감속율

~~~swift
collectionView.decelerationRate = UIScrollView.DecelerationRate(rawValue: CGFloat(0.9))
collectionView.decelerationRate = .normal
~~~

