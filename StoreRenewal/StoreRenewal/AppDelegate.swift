//
//  AppDelegate.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let tapBarController =  UITabBarController()
  

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13, *) {
       } else {
          let mainVC = UINavigationController(rootViewController: StoreMainVC())
          let myPageVC = UINavigationController(rootViewController: MypageVC())
         
         mainVC.title = "스토어"
         myPageVC.title = "마이페이지"
         
         let controllers = [mainVC, myPageVC]
         
         tapBarController.viewControllers = controllers
         //    tapBarController.tabBar.tintColor = UIColor.appColor(.pink_1000)
         tapBarController.tabBar.backgroundColor = .white
         
         mainVC.tabBarItem.image = UIImage(named: "black_noti_icon")
         myPageVC.tabBarItem.image = UIImage(named: "black_setting_icon")
       
         window = UIWindow(frame: UIScreen.main.bounds)
         window?.backgroundColor = .white
         window?.makeKeyAndVisible()
         window?.rootViewController = tapBarController
       }
       
       return true
  }

  // MARK: UISceneSession Lifecycle
@available(iOS 13.0, *)
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
}
