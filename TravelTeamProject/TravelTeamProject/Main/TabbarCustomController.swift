//
//  TabbarCustomController.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/14.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
  }
  
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
    switch tabBarController.selectedIndex {
    case 0:
      print("0")
      if UINavigationController(rootViewController: HomeVC()) != nil {
        print("🎽")
      }
      
    
    case 1:
      print("1")
//      if let avc = viewController as? ScheduleVC {
//        avc.scheduleTest()
//      }
      
    case 2:
      print("2")
      if let bvc = viewController as? MapVC {
        bvc.mapTest()
      }
      
    case 3:
      print("3")
      if let cvc = viewController as? MessageVC {
        cvc.messageTest()
      }
      
    case 4:
      print("4")
      if let svc = viewController as? SettingVC {
        svc.settingTest()
      }
      
    default:
      print("Error!")
    }
  }
}

