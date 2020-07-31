//
//  ViewController.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit
import SnapKit

final class StoreMainVC: UIViewController {
  
  let firstView = FirstView()
  
  let searchButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.frame = .zero
    btn.setTitle("스토어검색", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//    btn.setImage(UIImage(named: "LMlogo"), for: .normal)
    btn.setTitleColor(.lightGray, for: .normal)
    btn.imageView?.tintColor = .lightGray
    btn.layer.cornerRadius = 5
    btn.backgroundColor = #colorLiteral(red: 0.9607055783, green: 0.9606983066, blue: 0.9567378163, alpha: 1)
//    view.addSubview(btn)
    return btn
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .yellow
        
    view.addSubview(firstView)
    firstView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(10)
      make.bottom.equalTo(view.safeAreaInsets.bottom).inset(10)
    }
    storeHomeViewDidScroll()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  
  private func setNavi() {
    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    
    let logoBtn: UIButton = UIButton(type: .custom)
    let logoImg = UIImage(named: "payco_basic")?.withRenderingMode(.alwaysTemplate)
    logoBtn.setImage(logoImg, for: .normal)
    logoBtn.isUserInteractionEnabled = false
    logoBtn.tintColor = UIColor.gray

    let leftLogo = UIBarButtonItem(customView: logoBtn)

    let rightItem = UIBarButtonItem.setButton(self, action: #selector(cartButtonDidTap(_:)), imageName: "LMlogo")
    
    
    navigationItem.setLeftBarButton(leftLogo, animated: false)
    navigationItem.setRightBarButton(rightItem, animated: true)
    
//    let buttonWidth = UIScreen.main.bounds.width - (leftLogo.width + rightItem.width)
//    searchButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: 35)
    searchButton.frame = CGRect(x: 0, y: 0, width: 180, height: 35)
    
    let titleView = UIView()
    titleView.translatesAutoresizingMaskIntoConstraints = false
    titleView.addSubview(searchButton)
    
    let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized))
    singleTapGestureRecognizer.numberOfTapsRequired = 1
    singleTapGestureRecognizer.cancelsTouchesInView = false
    
    titleView.addGestureRecognizer(singleTapGestureRecognizer)
    navigationItem.titleView = titleView
    

  }
  
  @objc private func cartButtonDidTap(_ sender: Any) {
    print("장바구니")
  }
  
  

  
  @objc private func tapRecognized(sender: UITapGestureRecognizer) {
    print("검색")
  }

}



extension StoreMainVC {
  // FirstView 에서 스크롤 했을 때 받을 callback
  private func storeHomeViewDidScroll() {
    firstView.storeHomeViewDidScroll = { direction in
      print("direction🏓", direction)
      hideNaviBarWhenUserDidScroll(to: direction, with: self.navigationController, where: "firstView")
    }
  }
  
//  private func rankingViewDidScroll() {
//    tempRankingView.tempRankingViewDidScroll = {
//      direction in
//      hideNaviBarWhenUserDidScroll(to: direction, with: self.navigationController, where: "tempRankingView")
//    }
//  }
}

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
