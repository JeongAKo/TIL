//
//  LovelyVC.swift
//  FleapopTabbarTest
//
//  Created by Daisy on 2019/11/04.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import SnapKit

class LovelyVC: UIViewController {
  
  // MARK: - Properties
  private lazy var colorView: UIView = {
    let cv = UIView(frame: CGRect.zero)
    cv.backgroundColor = UIColor.blue
    view.addSubview(cv)
    return cv
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      cellAutolayout()
    }
    
  // MARK: - configure
  private func cellAutolayout() {
    colorView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

}
