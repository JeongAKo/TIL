//
//  FirstViewTableCell.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit

class FirstViewTableCell: UITableViewCell {

    // MARK: - App life cycle
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
      backgroundColor = UIColor.white
     }
     
     required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
}
