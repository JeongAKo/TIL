//
//  ThreeViewController.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import SnapKit

class ThreeViewController: UIViewController {

  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    return tableView
  }()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
          let label3: UILabel = {
            let label = UILabel()
            label.text = "FirstVC"
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

extension ThreeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
    cell.backgroundColor = .blue
    return cell
  }
  
}
