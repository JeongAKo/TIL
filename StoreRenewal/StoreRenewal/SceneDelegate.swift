//
//  SceneDelegate.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  let tapBarController =  UITabBarController()
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    
//    let mainVC = UINavigationController(rootViewController: StoreMainVC())
//    let mainVC = UINavigationController(rootViewController: PageBoyViewController())
        let mainVC = FirstVC()
    let myPageVC = UINavigationController(rootViewController: MypageVC())
    
    mainVC.title = "스토어"
    myPageVC.title = "마이페이지"
    
    let controllers = [mainVC, myPageVC]
    
    tapBarController.viewControllers = controllers
    //    tapBarController.tabBar.tintColor = UIColor.appColor(.pink_1000)
    tapBarController.tabBar.backgroundColor = .white
    
    mainVC.tabBarItem.image = UIImage(named: "black_noti_icon")
    myPageVC.tabBarItem.image = UIImage(named: "black_setting_icon")
    
    
    window?.rootViewController = tapBarController
    window?.makeKeyAndVisible()
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

