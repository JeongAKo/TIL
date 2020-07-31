//
//  BrandView.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/31.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit

class BrandView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .green
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

}