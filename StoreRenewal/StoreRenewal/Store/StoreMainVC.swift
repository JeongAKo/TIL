//
//  ViewController.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit
import SnapKit


final class StoreMainVC: CategoryTabBarViewController {
  
  let firstView = FirstView()
  let secondView = SecondView()
  let bestView = BestView()
  let brandView = BrandView()
  let promotionView = PromotionView()
  let categoryMainView = CategoryMainView()
  
  init() {
    super.init(withTitles: ["스토어", "NEW", "BEST", "브랜드", "카테고리", "기획전"],
               withViews: [firstView, secondView, bestView, brandView, promotionView, categoryMainView],
               withScrollOption: true)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  let searchButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("상품을 검색해 보세요.", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    let logoImg = UIImage(named: "mag")?.withRenderingMode(.alwaysTemplate)
    btn.setImage(logoImg, for: .normal)
    btn.adjustsImageWhenHighlighted = false
    btn.setTitleColor(.lightGray, for: .normal)
    btn.tintColor = UIColor.lightGray
    btn.imageEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 0)
    btn.titleEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 5)
    btn.contentHorizontalAlignment = .left
    btn.layer.cornerRadius = 5
    btn.backgroundColor = #colorLiteral(red: 0.9607055783, green: 0.9606983066, blue: 0.9567378163, alpha: 1)
    return btn
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    storeHomeViewDidScroll()
    secondViewDidScroll()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  override func viewWillLayoutSubviews() {
    congigureCornerRadius()
  }
  
  
  private func congigureCornerRadius() {
    let titleViewWidth = navigationItem.titleView?.frame.size.width ?? 0
    searchButton.frame = CGRect(x: 0, y: 4, width: (titleViewWidth - 5), height: 36) // titleView 디폴트 높이: 44
  }
  
  
  
  private func setNavi() {
    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    
    naviBar?.setBackgroundImage(UIImage(), for:.default)
    naviBar?.shadowImage = UIImage()
    naviBar?.layoutIfNeeded()
    
    let logoBtn: UIButton = UIButton(type: .custom)
    let logoImg = UIImage(named: "payco_basic")?.withRenderingMode(.alwaysTemplate)
    logoBtn.setImage(logoImg, for: .normal)
    logoBtn.imageView?.contentMode = .scaleAspectFit
    logoBtn.isUserInteractionEnabled = false
    logoBtn.tintColor = UIColor.gray
    
    
    let leftLogoWidth = UIScreen.main.bounds.width * 0.2
    let leftLogo = UIBarButtonItem(customView: logoBtn)
    leftLogo.customView?.translatesAutoresizingMaskIntoConstraints = false
    leftLogo.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    leftLogo.customView?.widthAnchor.constraint(equalToConstant: leftLogoWidth).isActive = true
    
    
    let rightItem = UIBarButtonItem.setButton(self, action: #selector(cartButtonDidTap(_:)), imageName: "LMlogo")
    
    navigationItem.setLeftBarButton(leftLogo, animated: false)
    navigationItem.setRightBarButton(rightItem, animated: true)
    
    let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized))
    singleTapGestureRecognizer.numberOfTapsRequired = 1
    singleTapGestureRecognizer.cancelsTouchesInView = false
    
    let titleView = MyUIView()
    titleView.translatesAutoresizingMaskIntoConstraints = false
    titleView.addSubview(searchButton)
    titleView.addGestureRecognizer(singleTapGestureRecognizer)
    
    navigationItem.titleView = titleView
  }
  
  
  @objc private func cartButtonDidTap(_ sender: Any) {
    print("장바구니")
  }
  
  
  
  
  @objc private func tapRecognized(_ sender: UIGestureRecognizer) {
    print("검색")
  }
  
}



extension StoreMainVC {
  // FirstView 에서 스크롤 했을 때 받을 callback
  private func storeHomeViewDidScroll() {
    firstView.storeHomeViewDidScroll = { direction in
      hideNaviBarWhenUserDidScroll(to: direction, with: self.navigationController, where: "firstView")
    }
  }
  
  private func secondViewDidScroll() {
    secondView.secondViewDidScroll = { direction in
      hideNaviBarWhenUserDidScroll(to: direction, with: self.navigationController, where: "secondView")
    }
  }
}


// 우측 네비아이템 버튼 설정
extension UIBarButtonItem {
  static func setButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
    let button = UIButton(type: .custom)
    
    // 버튼 이미지에 색 넣는 전처리
    button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.tintColor = .darkGray
    
    let menuBarItem = UIBarButtonItem(customView: button)
    menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
    menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
    
    return menuBarItem
  }
}


class MyUIView: UIView {
  override var intrinsicContentSize: CGSize {
    return UIView.layoutFittingExpandedSize
  }
}
