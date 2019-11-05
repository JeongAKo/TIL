//
//  FleapopVC.swift
//  FleapopTabbarTest
//
//  Created by Daisy on 2019/11/04.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import SnapKit

extension Notification.Name {
  static let changeTabBarPosition = Notification.Name("changeTabBarPosition")
}


class FleapopVC: UIViewController {
  
  // MARK: - Properties
  let notiCenter = NotificationCenter.default
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.backgroundColor = .yellow
    tableView.refreshControl = refreshControl
    view.addSubview(tableView)
    return tableView
  }()
  
  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .lightGray
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    return refreshControl
  }()
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  
  private lazy var colorView: UIView = {
    let cv = UIView(frame: CGRect.zero)
    cv.backgroundColor = UIColor.green
    view.addSubview(cv)
    return cv
  }()
  
  // MARK: - AppLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    cellAutolayout()
    
  }
  
  // MARK: - Action Method
  
  
  // MARK: - configure
  private func cellAutolayout() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    
  }
}



extension FleapopVC: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
    return cell
  }
  
  func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
    if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
        //          changeTabBar(hidden: true, animated: true)
        print("up")
      notiCenter.post(name: .changeTabBarPosition, object: .none)
      }
      else{
      notiCenter.post(name: .changeTabBarPosition, object: .none)
        print("down")
      }
    }
  }
  
