//
//  MyTableView.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class MyTableView: UITableView {
    
  var proto:ModuleTableProtocol?
  
  
  func setProto(proto:ModuleTableProtocol, module:ModuleTable) {
    self.proto = proto
    self.delegate = module
    self.dataSource = module
  }
  
  
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
