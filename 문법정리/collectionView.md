# 컬렉션뷰



![c1](https://user-images.githubusercontent.com/47776915/61429412-2b9ad500-a961-11e9-8e52-9bb2b9ee393e.png)







![c2](https://user-images.githubusercontent.com/47776915/61429351-f1313800-a960-11e9-806b-b6becdfb364a.png)





![c3](https://user-images.githubusercontent.com/47776915/61429364-fd1cfa00-a960-11e9-8323-1df5b53dc3ea.png)







![c4](https://user-images.githubusercontent.com/47776915/61429366-fe4e2700-a960-11e9-8434-17f1b2bf73bf.png)
![c5](https://user-images.githubusercontent.com/47776915/61429367-0017ea80-a961-11e9-9db7-05a6668cabdb.png)
![c6](https://user-images.githubusercontent.com/47776915/61429373-01e1ae00-a961-11e9-83fd-d81bc0a85dcf.png)
![c7](https://user-images.githubusercontent.com/47776915/61429374-03ab7180-a961-11e9-803e-96d13ecb1309.png)
![c8](https://user-images.githubusercontent.com/47776915/61429376-060dcb80-a961-11e9-81b6-bf45bbf31e69.png)







##### Init 을 꼭! 해줘야한다



##### collectionView 기본세팅

~~~swift
private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionHeadersPinToVisibleBounds = false // 헤더가 따라다니지 않게
    layout.sectionFootersPinToVisibleBounds = false // 푸터가 따라다니지 않게
    return layout
  }()

private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout) //위에 레이아웃
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(cell: MyCollectionViewCell.self)
    addSubview(collectionView)
    return collectionView
  }()


~~~





#### cell 재사용시 collectionView cell의 위치가 변경되는 문제 해결

~~~swift
//테이블뷰 셀
var offset: CGFloat {
    get {
      return collectionView.contentOffset.x
    }
    set {
      collectionView.contentOffset.x = newValue
    }


//테이블뷰

var cachedOffset: [Int: CGFloat] = [:]

  extension MyViewController: UITableViewDelegate {
    // cell 재사용시 collectionView cell의 위치가 변경되는 문제 해결
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? RankingHorizontalCell else { return }
    cell.offset = cachedOffset[indexPath.section] ?? 0
  }

  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? RankingHorizontalCell else { return }
    cachedOffset[indexPath.section] = cell.offset

  }
~~~



### 테이블뷰안에 컬렉션뷰 있을때 vertical시 컬렉션셀의 맞게 테이블셀 높이 조정하기

~~~swift
class OpenMarketSellerCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !bounds.size.equalTo(intrinsicContentSize) {
        invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let size = CGSize(width: contentSize.width, height: contentSize.height)
        return size
    }
}

// OpenMarketSellerCollectionView 쓰거나 상속받아서 사용하면 된다

~~~





