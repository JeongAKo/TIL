//
//  OneViewController.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import SnapKit

class OneViewController: UIViewController, ModuleTableProtocol {
  func selIndex(index: Int) {
    print("selIndex Protocol : \(index)")
  }
  
  let mdTable = ModuleTable()
  private lazy var tableView: MyTableView = {
    let tableView = MyTableView()
    tableView.setProto(proto: self, module: self.mdTable)
    tableView.separatorColor = UIColor.black
    tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
    view.addSubview(tableView)
    return tableView
  }()
  
    // MARK: - AppLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ConfigAutolayout()
  }
  
  
  // MARK: - Configure
  private func ConfigAutolayout() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  
  
}
