//
//  FirstView.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit

class FirstView: UIView {

  internal var storeHomeViewDidScroll: ((String) -> Void)?
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(FirstViewTableCell.self, forCellReuseIdentifier: "FirstViewTableCell")
//    tableView.emptyDataSetSource = self
//    tableView.emptyDataSetDelegate = self
//    tableView.emptyDataSetView { view in
//      view.customView(self.backView)
//    }
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .singleLine
//    tableView.refreshControl = refreshControl
    self.addSubview(tableView)
    return tableView
  }()
  
    override init(frame: CGRect) {
       super.init(frame: frame)
      self.backgroundColor = .lightGray
      
      self.addSubview(tableView)
      tableView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       fatalError("init(coder:) has not been implemented")
     }


}


extension FirstView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "FirstViewTableCell") as! FirstViewTableCell
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
     guard let callback = storeHomeViewDidScroll else { return print("Callback Error") }
    if (scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
      callback("up")
    } else {
      callback("down")
    }
  }
}
