//
//  MainVC.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/13.
//

import UIKit


class HomeVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    view.backgroundColor = .lightGray
  }
  
  public func homeTest() {
    print("🍎")
  }
}


//extension HomeVC: UITabBarControllerDelegate {
//  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//    let a = tabBarController.selectedIndex
//    print("selectedIndex", a)
//  }
//}
