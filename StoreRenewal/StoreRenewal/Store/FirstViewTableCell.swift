//
//  FirstViewTableCell.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewTableCell: UITableViewCell {
  
  
  public lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    self.addSubview(label)
    return label
  }()
  
  
  // MARK: - App life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.white
    titleLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
