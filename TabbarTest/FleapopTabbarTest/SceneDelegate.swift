//
//  SceneDelegate.swift
//  FleapopTabbarTest
//
//  Created by Daisy on 2019/11/04.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  let notiCenter = NotificationCenter.default
  let tapBarController =  UITabBarController()
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    
    let fleapopVC = FleapopVC()
    let lovelyVC = LovelyVC()
    let profileVC =  ProfileVC()
    
    let naviController = UINavigationController(rootViewController: fleapopVC)
    
    fleapopVC.title = "fleapop"
    lovelyVC.title = "market"
    profileVC.title = "profile"
    
    let controllers = [fleapopVC, lovelyVC, profileVC]
    tapBarController.viewControllers = controllers
    
    
    fleapopVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
    lovelyVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
    profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
    
    window?.makeKeyAndVisible()
    window?.rootViewController = tapBarController
    
    notiCenter.addObserver(self,
                           selector: #selector(SceneDelegate.hideTabBar),
                           name: .changeTabBarPosition,
                           object: nil)
    
    
  }
  
  deinit {
    notiCenter.removeObserver(self, name: .changeTabBarPosition, object: nil)
  }
  var isScroll = true
  
  @objc func hideTabBar(_ noti: Notification) {
    //up을 받고 up일때 downd일때 조정하기
    
    if isScroll == true {
    tapBarController.tabBar.isHidden = true
      isScroll = false
      print(isScroll)
    } else {
    tapBarController.tabBar.isHidden = false
      isScroll = true
    }
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
