//
//  TabbarCustomController.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/14.
//

import UIKit

// FIXME: - 버튼 초기 위치가 이상함
// FIXME: - UINavigationController 저렇게 하는게 맞는지?

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
  let tabbarImgArr = ["TBhome-1", "TBschedule-1", "TBmap-1", "TBchat-1", "TBsetting-1"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    setupButton(index: 0)
  }
  
  
  private var menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
  
  public func setupButton(index: Int) {
//    let safeAreaBottom = view.safeAreaInsets.bottom
    
    var menuButtonFrame = menuButton.frame
    let cellSize = view.bounds.width/10
    let xOffset = cellSize * CGFloat(index * 2 + 1)
    menuButtonFrame.origin.x = CGFloat(xOffset) - (32.5)
    menuButtonFrame.origin.y = UIScreen.main.bounds.height - tabBar.bounds.height - 11
    
    //    self.menuButton.transform = CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)
    
    menuButton.tag = index
    menuButton.frame = menuButtonFrame
    menuButton.backgroundColor = UIColor.appColor(.primaryGreen)
    menuButton.layer.cornerRadius = menuButtonFrame.height/2
    menuButton.layer.masksToBounds = true
    menuButton.layer.borderColor = UIColor.white.cgColor
    menuButton.layer.borderWidth = 4
    let image = UIImage(named: tabbarImgArr[index])?.withRenderingMode(.alwaysTemplate)
    menuButton.setImage(image, for: .normal)
    menuButton.tintColor = .white
    menuButton.adjustsImageWhenHighlighted = false
    menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    view.addSubview(menuButton)
    view.layoutIfNeeded()
  }
  
  
  // MARK: - Actions
  @objc private func menuButtonAction(sender: UIButton) {
    selectedIndex = sender.tag
  }
  
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
    switch tabBarController.selectedIndex {
    case 0:
      if UINavigationController(rootViewController: HomeVC()) != nil {
        print("tabbar selectedIndex 0")
      }
      
    case 1:
      print("tabbar selectedIndex 1")
    //      if let avc = viewController as? ScheduleVC {
    //        avc.scheduleTest()
    //      }
    
    case 2:
      print("tabbar selectedIndex 2")
    //      if let bvc = viewController as? MapVC {
    //        bvc.mapTest()
    //      }
    
    case 3:
      print("tabbar selectedIndex 3")
    //      if let cvc = viewController as? MessageVC {
    //        cvc.messageTest()
    //      }
    
    case 4:
      print("tabbar selectedIndex 4")
    //      if let svc = viewController as? SettingVC {
    //        svc.settingTest()
    //      }
    
    default:
      print("Error!")
    }
    
    setupButton(index: selectedIndex)
  }
}

