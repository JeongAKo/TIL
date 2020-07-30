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
    self.navigationController?.navigationItem.setHidesBackButton(true, animated: false)
    let naviBar = self.navigationController?.navigationBar
       naviBar?.isTranslucent = false
  }


//  override func viewWillDisappear(_ animated: Bool) {
//    super.viewWillDisappear(animated)
//    self.navigationController?.isNavigationBarHidden = true
//  }
}



extension StoreMainVC {
  // FirstView 에서 스크롤 했을 때 받을 callback
  private func storeHomeViewDidScroll() {
    firstView.storeHomeViewDidScroll = { direction in
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

