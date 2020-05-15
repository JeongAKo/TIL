

### UIPageControl

~~~swift
  public var pageNumber: Int = 4 // FIXME: - 임시 count로 바꿔주기

  private lazy var pageControl: UIPageControl = {
    let page = UIPageControl()
    page.currentPage = 0
    page.numberOfPages = 4 // FIXME: - 임시 count로 바꿔주기
    page.hidesForSinglePage = true
    page.currentPageIndicatorTintColor = .white
    page.pageIndicatorTintColor = .darkGray
    self.addSubview(page)
    return page
  }()


  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.scrollDirection = .horizontal
    layout.sectionHeadersPinToVisibleBounds = false
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = UIColor.appColor(.white_255)
    collectionView.register(cell: GoodsThumbCollectionCell.self)
    collectionView.isPagingEnabled = true //요거 해줘야지 자석처럼 붙는다
    self.addSubview(collectionView)
    return collectionView
  }()


extension HomeTableViewCell: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    self.pageControl.currentPage = page
  }
}
  
~~~

