//
//  AppDelegate.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    
    let config = Config.shared.loginData
    print("config?.isLogin🍄", Config.shared.loginData.isLogin)
    
    if config.isLogin == true {
      settingTabbarCon()
    } else {
      let mainVC = UINavigationController(rootViewController: IntroVC())
      window?.rootViewController = mainVC
    }
    
    Thread.sleep(forTimeInterval: 3.0)
    
    return true
  }
  
  private func settingTabbarCon() {
    let tapBarController = MyTabBarController()
    tapBarController.tabBar.tintColor = UIColor.appColor(.primaryGreen)
    
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

  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

