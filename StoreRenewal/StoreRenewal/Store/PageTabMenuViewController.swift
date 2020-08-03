////
////  PageTabMenuViewController.swift
////  StoreRenewal
////
////  Created by 고정아 on 2020/08/03.
////  Copyright © 2020 고정아. All rights reserved.
////
//
//import UIKit
//import Swift_PageMenu
//
//class PageTabMenuViewController: PageMenuController {
//  
////  let episodes: [String] = ["첫번째", "두번째", "세번째", "넷", "디ㅏ섯", "엿서"]
//  let firstVC = FirstVC()
//  let secondVC = SecondVC()
//  var viewcontrollers: [UIViewController] = []
//  
//  let items: [[String]]
//  
//  let titles: [String]
//  
//  init(items: [[String]], titles: [String], options: PageMenuOptions? = nil) {
//    self.items = items
//    self.titles = titles
//    super.init(options: options)
//  }
//  
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    viewcontrollers.append(firstVC)
//    viewControllers.append(secondVC)
//    self.edgesForExtendedLayout = []
//    
//    if options.layout == .layoutGuide && options.tabMenuPosition == .bottom {
//      self.view.backgroundColor = .orange
//    } else {
//      self.view.backgroundColor = .white
//    }
//    
//    if self.options.tabMenuPosition == .custom {
//      self.view.addSubview(self.tabMenuView)
//      self.tabMenuView.translatesAutoresizingMaskIntoConstraints = false
//      
//      self.tabMenuView.heightAnchor.constraint(equalToConstant: self.options.menuItemSize.height).isActive = true
//      self.tabMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//      self.tabMenuView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
//      if #available(iOS 11.0, *) {
//        self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//      } else {
//        self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//      }
//    }
//    
//    self.delegate = self
//    self.dataSource = self
//  }
//}
//
//extension PageTabMenuViewController: PageMenuControllerDataSource {
//  func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController] {
//    return self.episodes.enumerated().map ({ (index, epi) in
//      FirstVC.init(categoryTitle: String(index))
//    })
//    
//  }
//  
//  func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String] {
//    return self.titles
//  }
//  
//  func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int {
//    return 0
//  }
//}
//
//extension PageTabMenuViewController: PageMenuControllerDelegate {
//  func pageMenuController(_ pageMenuController: PageMenuController, didScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
//    // The page view controller will begin scrolling to a new page.
//    print("didScrollToPageAtIndex index:\(index)")
//  }
//  
//  func pageMenuController(_ pageMenuController: PageMenuController, willScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
//    // The page view controller scroll progress between pages.
//    print("willScrollToPageAtIndex index:\(index)")
//  }
//  
//  func pageMenuController(_ pageMenuController: PageMenuController, scrollingProgress progress: CGFloat, direction: PageMenuNavigationDirection) {
//    // The page view controller did complete scroll to a new page.
//    print("scrollingProgress progress: \(progress)")
//  }
//  
//  func pageMenuController(_ pageMenuController: PageMenuController, didSelectMenuItem index: Int, direction: PageMenuNavigationDirection) {
//    print("didSelectMenuItem index: \(index)")
//  }
//}
