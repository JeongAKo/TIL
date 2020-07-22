#### User Notification

포어그라운드상태에서 푸시가 올때 시스템에서 뜨는 푸시 얼럿을 뛰울 수 있냐가 iOS10부터 가능



#### badge

#### 알림 트리거



~~~swift
//
//  ViewController.swift
//  OburiProject
//
//  Created by Daisy on 2020/07/16.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Ask user permission
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
      print("granted🔴", granted)
      if granted {
        print("Permission granted. Scheduling notification")
        self.scheduleNotification()
      }
    }
  }
  
  
  func scheduleNotification() {
    let notificationCenter = UNUserNotificationCenter.current()
    
    let notification = UNMutableNotificationContent()
    notification.title = "새로운 메세지"
    notification.body = "08.01 공연 있는데 가능하신가여?"
    notification.categoryIdentifier = "alarm"
    notification.userInfo = ["additionalData": "Additional data can also be provided"]
    notification.sound = UNNotificationSound.default
    notification.badge = 1
    
    var dateComponents = DateComponents()
    dateComponents.hour = 8
    dateComponents.minute = 0
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    
    let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: trigger)
    
    
    // Add Action button to notification
    let actionButton = UNNotificationAction(identifier: "TapToReadAction", title: "Tap to read", options: .foreground)
    let actionShareButton = UNNotificationAction(identifier: "TapToShareAction", title: "Share", options: .foreground)
    let notificationCategory = UNNotificationCategory(identifier: "alarm", actions: [actionButton,actionShareButton], intentIdentifiers: [])
    notificationCenter.setNotificationCategories([notificationCategory])
    
    notificationCenter.add(notificationRequest)
  }
  
}

extension UIViewController: UNUserNotificationCenterDelegate {
  
  public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
    completionHandler( [.alert, .badge, .sound])
  }
  
  
  public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    
    let userInfo = response.notification.request.content.userInfo
    if let additionalData = userInfo["additionalData"] as? String {
      print("Additional data: \(additionalData)")
    }
    
    switch response.actionIdentifier {
    case UNNotificationDefaultActionIdentifier:
      print("User tapped on message itself rather than on an Action button")
      
    case "TapToReadAction":
      print("User tapped on Tap to read button")
      break
      
    case "TapToShareAction":
      print("User tapped on Share button")
      break
      
    default:
      break
    }
    
    completionHandler()
  }
  
  
  
  public func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
      let settingsViewController = UIViewController()
      settingsViewController.view.backgroundColor = .gray
      self.present(settingsViewController, animated: true, completion: nil)
      
  }
}

~~~

