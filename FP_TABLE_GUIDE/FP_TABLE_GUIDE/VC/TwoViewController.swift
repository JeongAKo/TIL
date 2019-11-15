//
//  TwoViewController.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import SnapKit

class TwoViewController: UIViewController {

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
    view.addSubview(tableView)
    return tableView
  }()
  
  
    // MARK: - AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
            let  label2: UILabel = {
            let label = UILabel()
            label.text = "SecondVC"
            label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            view.addSubview(label)
            return label
          }()
    
      ConfigAutolayout()
    }
    

      // MARK: - Configure
      private func ConfigAutolayout() {
        tableView.snp.makeConstraints { make in
          make.edges.equalToSuperview()
        }
      }
    }

extension TwoViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
    cell.backgroundColor = .green
    return cell
  }
  
}
