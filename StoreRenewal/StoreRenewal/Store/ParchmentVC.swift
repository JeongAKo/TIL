////
////  ParchmentVC.swift
////  StoreRenewal
////
////  Created by 고정아 on 2020/08/03.
////  Copyright © 2020 고정아. All rights reserved.
////
//
//import UIKit
//
//class ParchmentVC: UIViewController {
//  
//  let cities = [
//    "Oslo",
//    "Stockholm",
//    "Tokyo",
//    "Barcelona",
//    "Vancouver",
//    "Berlin"
//  ]
//  
//  let firstVC = FirstVC()
//  let secondVC = SecondVC()
//  
//  lazy var citiesArr: [UIViewController] = []
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//        
//    let pagingViewController = PagingViewController()
//    pagingViewController.dataSource = self
//    addChild(pagingViewController)
//    view.addSubview(pagingViewController.view)
////    view.constrainToEdges(pagingViewController.view)
//    pagingViewController.didMove(toParent: self)
//    
////  configurePaging()
//    
//    pagingViewController.select(index: 3)
//  }
//}
//
//
//extension ParchmentVC: PagingViewControllerDataSource {
//  func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
//    return citiesArr.count
//  }
//  
//  func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
//    return citiesArr[index]
//  }
//  
//  func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
//    return PagingIndexItem(index: index, title: cities[index])
//  }
//}
//
//private extension ParchmentVC {
//  private func configurePaging() {
//    citiesArr.append(firstVC)
//    citiesArr.append(secondVC)
//    
//    let pagingViewController = PagingViewController(viewControllers: citiesArr)
//    pagingViewController.selectedTextColor = .brown
//    pagingViewController.indicatorColor = .brown
//    pagingViewController.menuBackgroundColor = .black
//    addChild(pagingViewController)
//    view.addSubview(pagingViewController.view)
//    pagingViewController.didMove(toParent: self)
//    pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
//    
//    NSLayoutConstraint.activate([
//      pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//      pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
//    ])
//    
//    pagingViewController.dataSource = self
//    
//  }
//}
