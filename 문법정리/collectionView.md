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







#### uicollectionview nested section



https://www.intertech.com/Blog/ios-uicollectionview-tutorial-3-simple-non-scrolling-custom-layout-for-collection-views/





collectionView Paging

https://jintaewoo.tistory.com/33







## Header

~~~swift
  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout) //위에 레이아웃
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    collectionView.register(cell: CollectionCell.self)
     collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionHeaderView")
    view.addSubview(collectionView)
    return collectionView
  }()
~~~



~~~swift
  extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      viewForSupplementaryElementOfKind kind: String,
                      at indexPath: IndexPath) -> UICollectionReusableView {
    
    switch kind {
    case UICollectionView.elementKindSectionHeader: //헤더
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as! CollectionHeaderView
     header.titleLabel.text = "\(indexPath.section)"
      return header
      
    case UICollectionView.elementKindSectionFooter: //푸터
      fatalError()
      
    default:
      fatalError()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
      return CGSize(width: 100, height: 100) //이걸 해줘여지 보인다
  	}
  }
~~~



##### Header 높이 구하기

~~~swift
// setData부분에서 (값 넣을 때)높이 구함
func setData(data:ExhibitionData?) {
  promotionTilteLabel.text = data?.title
  promotionContentsLabel.text = data?.sub_title
  goodsCntLabel.text = "총 \(data?.goods_count ?? 0)개"
  configureLayout()
  
  // intrinsicContentSize.height
  let contentsHeight = self.promotionTilteLabel.intrinsicContentSize.height
  + self.promotionContentsLabel.intrinsicContentSize.height
  + self.likeSortRadioButton.intrinsicContentSize.height
  
  let totalHeight = self.promotionThumbnailHeight + contentsHeight
  
  delegate?.getHeaderHeight(totalHeight: totalHeight) //델리게이트로 VC에 넘겨줌
}
~~~







## Pinterest UI







### StretchyHeaderLayout



~~~swift
class StretchyHeaderLayout: UICollectionViewFlowLayout {

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let layoutAttributes = super.layoutAttributesForElements(in: rect)
    
    
    
    layoutAttributes?.forEach({ (attributes) in
      if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
        guard let collectionView = collectionView else {return}
        let contentOffsetY = collectionView.contentOffset.y
        
        if contentOffsetY > 0 {
          return
        }
        
        let width = collectionView.frame.width
        let height = attributes.frame.height - contentOffsetY
        attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
      }
    })
    
    return layoutAttributes
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}

~~~



~~~swift
private let layout = StretchyHeaderLayout() //객체 생성해주고

private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: self.frame,
                                          collectionViewLayout: layout //적용
    )
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = UIColor.appColor(.white_255)
    collectionView.register(cell: StoreCollectionViewCell.self)
     collectionView.register(StoreCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoreCollectionHeader")
    self.addSubview(collectionView)
    return collectionView
  }()
~~~





#  iOS의 update cycle은 60fps

![img](https://user-images.githubusercontent.com/47776915/91259696-f4c10080-e7a9-11ea-851c-ccd7cf94dd49.png)



UICollectionView를 사용할 때, **매끄러운 동작을 위해서는 약 16.65ms안에 프레임을 그려야한다**는 의미이다.

~~~swift
 func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    <#code#>
}
~~~

**prefetchItemsAt**은 UICollectionView가 cell을 load할 준비가 되면 자동으로 호출하고.

cell을 load하는 작업이 아닌 **cell에 대한 dataSource를 준비**하는 작업을 실행하는 함수이다.





~~~swift
private var isPrefetch = false

collectionView.prefetchDataSource = self

public func setData(goodsDatas: [GoodsModel], goodsOrderHidden: Bool, hasBanner: Bool) {
    self.isPrefetch = true
    self.hasBanner = hasBanner
    self.datas = goodsDatas
    self.goodsOrderIsHidden = goodsOrderHidden
    DispatchQueue.main.async {
      self.collectionView.reloadData()
      self.isPrefetch = false
    }
  }

extension StoreBaseVC: UICollectionViewDataSourcePrefetching {
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    for index in indexPaths {
      if index.item >= datas.count - 10 && !isPrefetch {
        notiCenter.post(name: .getStoreListNextPage, object: nil)
        break
      }
    }
  }
}
~~~



#### 감속율

~~~swift
collectionView.decelerationRate = UIScrollView.DecelerationRate(rawValue: CGFloat(0.9))
collectionView.decelerationRate = .normal
~~~







### [performBatchUpdates](https://eunjin3786.tistory.com/88)



https://dev.to/kevinmaarek/replicating-the-appstore-s-collectionviewlayout-orthogonal-in-swift-5-42je





#### 테이블부안에 컬렉션부 있을때 높이 

// OpenMarketSellerCollectionView에서 invalidateIntrinsicContentSize 가져온다

~~~swift
  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return layout
  }()
  
  public lazy var collectionView: OpenMarketSellerCollectionView = {
    let collectionView = OpenMarketSellerCollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.customDelegate = self
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.alwaysBounceVertical = true
    collectionView.isScrollEnabled = false
    collectionView.backgroundColor = UIColor.appColor(.white_255)
    collectionView.register(cell: StoComCollectionCell.self)
    contentView.addSubview(collectionView)
    return collectionView
  }()



//OpenMarketSellerCollectionView
protocol OpenMarketSellerCollectionViewDelegate {
  func getHeight(amount: CGFloat)
}

class OpenMarketSellerCollectionView: UICollectionView {
  var customDelegate: OpenMarketSellerCollectionViewDelegate?
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if !bounds.size.equalTo(intrinsicContentSize) {
      invalidateIntrinsicContentSize()
    }
  }
  
  override var intrinsicContentSize: CGSize {
    let size = CGSize(width: contentSize.width, height: contentSize.height)
    customDelegate?.getHeight(amount: size.height)
    return size
  }
}

  
~~~





### 페이징 가운데로 오게

~~~swift

  let insetX = (UIScreen.main.bounds.width*0.45) / 2
  let itemWidth = (UIScreen.main.bounds.width) * 0.765

private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 1
    layout.minimumLineSpacing = 22
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
    layout.itemSize = CGSize(width: itemWidth,
                             height: itemWidth+80)
    return layout
  }()
  
  
  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = UIColor.appColor(.white_255)
    collectionView.register(cell: TodayProCollCell.self)
    collectionView.decelerationRate = .fast
    addSubview(collectionView)
    return collectionView
  }()
  
  
  
  
extension TodaysPromoView: UICollectionViewDataSource, UICollectionViewDelegate  {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
     return 1
   }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.datas.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(TodayProCollCell.self, indexPath)
    if datas.count > 0 {
      cell.setCell(data: self.datas[indexPath.item])
    }
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let goodsID = self.datas[indexPath.item].id
    delegate?.presentGoodsDetailMainVC(id: goodsID)
  }
  
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    guard let collectionView = scrollView as? UICollectionView ,
          collectionView.tag == 0
    else { return print("scrollView as? UICollectionView fail!!!")}

    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    
    var offset = targetContentOffset.pointee
    let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    var roundedIndex = round(index)

    if scrollView.contentOffset.x > targetContentOffset.pointee.x {
      roundedIndex = floor(index)
    } else {
      roundedIndex = ceil(index)
    }

    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    targetContentOffset.pointee = offset
  }
}


~~~





### scrolltoitem이 iOS14부터 안될때 collectionView.isPagingEnabled = false로 해주니까 된당!!! 근데 스크롤이 안되네...

