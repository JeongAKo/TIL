//
//  SceneDelegate.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.makeKeyAndVisible()
    
    let config = Config.shared.loginData
    if config.isLogin == true {
      settingTabbarCon()
    } else {
      let mainVC = UINavigationController(rootViewController: IntroVC())
      window?.rootViewController = mainVC
    }
  }
  
  private func settingTabbarCon() {
    let tapBarController = MyTabBarController()
    tapBarController.tabBar.layer.cornerRadius = 33
    tapBarController.tabBar.layer.masksToBounds = true
    tapBarController.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  
    tapBarController.tabBar.tintColor = UIColor.appColor(.primaryGreen)
    
    if #available(iOS 13, *) {
      let appearance = UITabBarAppearance()
      appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "tabbarTextColorNormal")
      appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "tabbarTextColorNormal") ?? .lightGray]
      appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "tabbarTextColorSelected")
      appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "tabbarTextColorSelected") ?? UIColor.appColor(.primaryGreen)]
      appearance.backgroundColor = .white

      tapBarController.tabBar.standardAppearance = appearance
    } else {
      UITabBar.appearance().tintColor = UIColor.appColor(.primaryGreen) // 틴트컬러 변경
      let appearance = UITabBarAppearance()
      appearance.backgroundColor = .white
      tapBarController.tabBar.standardAppearance = appearance
    }
    
    
    let homeNavi = UINavigationController(rootViewController: HomeVC())
    let scheduleNavi = UINavigationController(rootViewController: ScheduleVC())
    let mapVC = MapVC()
    let messageVC =  MessageVC()
    let settingVC =  SettingVC()
    
    homeNavi.title = "Home"
    scheduleNavi.title = "Schedule"
    mapVC.title = "Map"
    messageVC.title = "Massage"
    settingVC.title = "Setting"
    
    homeNavi.tabBarItem.image = UIImage(named: "TBhome")
    scheduleNavi.tabBarItem.image = UIImage(named: "TBschedule")
    mapVC.tabBarItem.image = UIImage(named: "TBmap")
    messageVC.tabBarItem.image = UIImage(named: "TBchat")
    settingVC.tabBarItem.image = UIImage(named: "TBsetting")
    
    
    let controllers = [homeNavi, scheduleNavi, mapVC, messageVC, settingVC]
    
    tapBarController.viewControllers = controllers
    window?.rootViewController = tapBarController
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

