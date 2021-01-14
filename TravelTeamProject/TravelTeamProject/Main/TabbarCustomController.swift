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
  
  func setupMiddleButton() {
    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
    var menuButtonFrame = menuButton.frame
    menuButtonFrame.origin.y = view.bounds.height - tabBar.bounds.height - 12
    menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    menuButton.frame = menuButtonFrame
    menuButton.backgroundColor = UIColor.appColor(.primaryGreen)
    menuButton.layer.cornerRadius = menuButtonFrame.height/2
    menuButton.layer.masksToBounds = true
    menuButton.layer.borderColor = UIColor.white.cgColor
    menuButton.layer.borderWidth = 4
    let image = UIImage(named: "TBsetting-1")?.withRenderingMode(.alwaysTemplate)
    menuButton.setImage(image, for: .normal)
    menuButton.tintColor = .white
    menuButton.adjustsImageWhenHighlighted = false
    menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    view.addSubview(menuButton)
    view.layoutIfNeeded()
  }
  
  
  // MARK: - Actions
  @objc private func menuButtonAction(sender: UIButton) {
      selectedIndex = 0
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
        setupMiddleButton()
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

