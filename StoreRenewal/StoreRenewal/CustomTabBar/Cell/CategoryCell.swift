//
//  CategoryCell.swift
//  HouseOfToday
//
//  Created by chang sic jung on 12/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

  //안에 내용 
  var categoryView: UIView? {
    didSet {
      guard let v = self.categoryView else { return print("testView is nil")}
      addSubview(v)
      v.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
