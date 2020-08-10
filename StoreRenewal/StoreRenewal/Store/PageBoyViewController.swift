//
//  PageboyViewController.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/08/03.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class PageBoyViewController: TabmanViewController {
 
  private var viewControllers = [FirstVC(), SecondVC()]
  let titleName = ["  스토어  ", "  NEW  "]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    self.delegate = self
    self.dataSource = self
    
    // Create bar
    let bar = TMBar.ButtonBar()
    bar.layout.transitionStyle = .snap // Customize
    bar.layout.alignment = .leading
    bar.backgroundView.style = .clear
    
    bar.tintColor = UIColor.black
    bar.buttons.customize{(button) in
      button.selectedTintColor = .black
      button.tintColor = .lightGray
    }
    
    bar.indicator.tintColor = .black
    bar.indicator.weight = .light
    addBar(bar, dataSource: self, at: .top)
    
  }
}


extension PageBoyViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
  

  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    let title = titleName[index]
    return TMBarItem(title: title)
  }
}
