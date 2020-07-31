//
//  CategoryTabBarCell.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

//카테고리 글자 셀
class CategoryTabBarCell: UICollectionViewCell {
  lazy var label: UILabel = {
    let lb = UILabel()
    lb.text = "Text"
    lb.font = UIFont.boldSystemFont(ofSize: 18) // FIXME: - 글자 사이즈 동적으로
    lb.textColor = .black
    addSubview(lb)
    return lb
  }()

  override var isSelected: Bool {
    didSet {
      label.textColor = self.isSelected ?  .orange : .black // FIXME: - 임시 옐로우
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    label.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
