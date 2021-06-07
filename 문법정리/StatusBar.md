## StatusBar

~~~swift
  func animateStatusBar() {
    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      self.setNeedsStatusBarAppearanceUpdate()
    }, completion: nil)
  }
~~~



~~~swift
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
~~~



#### 아예 사라기게

Info.plist 설정

![스크린샷 2021-06-07 오후 3 23 47](https://user-images.githubusercontent.com/47776915/120968835-5df78a80-c7a4-11eb-9f8b-0b44261f4076.png)







#### Scrolld에따라 변경

~~~swift
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    self.header.setY(y: offsetY)
    
    
    let style = self.statusBarStyle
    
    guard let statusBarView = UIApplication.statusBarView else { return } // StatusBarView의 Background Color를 변경하는 방법
    if scrollView.contentOffset.y > HomeVC.headerHeight {
      print("❤️❤️❤️")
      UIApplication.statusBarBackgroundColor = .blue
      UIApplication.statusBarView?.isHidden = false
    } else {
      print("🧢🧢🧢")
      UIApplication.statusBarBackgroundColor = .orange
      UIApplication.statusBarView?.isHidden = true
    }
  }
}
~~~

