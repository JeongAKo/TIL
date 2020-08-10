//
//  FirstVC.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/08/03.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
  var categiryTitle: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .cyan
    //버튼 하나 만들어서 alert띄우기
  }
  
  
  func deviceExpiryReminder(){
    let dateString = "2020-08-10 00:00:00"
    let formatter : DateFormatter = DateFormatter()
    formatter.timeZone = NSTimeZone.local
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = formatter.date(from: dateString)
    if date != nil && date! > Date() {
      let message = "Device Expire Reminder"
      let title1 = "Your device is expire in {2} days"
      let title2 = "Your device is due to expire"
      let identifier = "DeviceExpire"
      //trigger for every day from configured days before
      let numberofDays = self.daysBetweenDates(startDate: Date(), endDate: date ?? Date())
      for i in (0...numberofDays) {
        let preTitleMsg = title1.replacingOccurrences(of: "{2}", with: String(numberofDays - i))
        var title = preTitleMsg
        if numberofDays == i {
          title = title2 + " today"
        } else if numberofDays - 1 == i{
          title = title2 + " tomorrow"
        }
        let userInfo = ["reminderType": "Device Expire",
                        "title": title,
                        "message": message,
                        "identifier": identifier]
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: self.getCurrentTimeZone())!
        let currentDay  = Date()
        let nextDate = Calendar.current.date(byAdding: .day, value: i, to: currentDay)
        if nextDate! >= Date() {
          createReminder(title, message, nextDate, false, NSCalendar.Unit.day, nil, userInfo, identifier + String(i))
        }
      }
    }
  }
  
  
  
  func getCurrentTimeZone() -> String {
    return String (TimeZone.current.identifier)
  }
  
  
  
  func createReminder(_ title: String, _ message: String, _ triggerDate: Date?, _ canRepeat: Bool, _ repeatInterval: NSCalendar.Unit, _ triggerDateComponents: DateComponents?, _ userInfo: [AnyHashable : Any]?, _ identifier: String) {
    if #available(iOS 10.0, *) {
      let content = UNMutableNotificationContent()
      content.title = title
      content.body = message
      content.sound = UNNotificationSound.default
      let center = UNUserNotificationCenter.current()
      // *** create calendar object ***
      var calendar = Calendar.current
      calendar.timeZone = TimeZone(identifier: self.getCurrentTimeZone())!
      let components = calendar.dateComponents([.month, .hour, .year, .day], from: triggerDate!)
      print("trigger dates one by one : \(triggerDate!)")
      let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: canRepeat)
      let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
      center.add(request) { (error) in
        if error != nil {
          print("Error")
        }else {
          print("Notification added")
        }
      }
    }
  }
  
  
  func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
    let daysBetween = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
    print(daysBetween.day!)
    return daysBetween.day!
  }
  
  
  //  func fireAlert(){
  //    let dateComp:NSDateComponents = NSDateComponents()
  //    dateComp.hour = 23
  //    dateComp.minute = 00
  //    dateComp.timeZone = NSTimeZone.system
  //    let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.indian)!
  //    let date: NSDate = calender.date(from: dateComp as DateComponents)! as NSDate
  //
  //    let localNotificationSilent = UILocalNotification()
  //    localNotificationSilent.fireDate = date as Date
  //    localNotificationSilent.repeatInterval =  NSCalendar.Unit.day
  //    localNotificationSilent.alertBody = "Started!"
  //    localNotificationSilent.alertAction = "swipe to hear!"
  //    localNotificationSilent.timeZone = NSCalendar.current.timeZone
  //    localNotificationSilent.category = "PLAY_CATEGORY"
  //    UIApplication.shared.scheduleLocalNotification(localNotificationSilent)
  //
  //    let calendar = NSCalendar.current
  //
  //
  //  }
  
  //  func setAlarm(){
  //         print("set alarm called")
  //         let date = Date().addingTimeInterval(5 * 60 * 1)
  //         let timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(self.clearAllData), userInfo: nil, repeats: false)
  //         RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
  //  }
  
  //  func createNotify(){
  //      if Date() < self.endTime{
  //          let dateStart = self.startTime.addingTimeInterval(3600)
  //          let content = UNMutableNotificationContent()
  ////          content.title = self.titles.randomElement()!
  ////          content.body = self.contents.randomElement()!
  //          content.sound = UNNotificationSound.default
  //          let triggerDaily = Calendar.current.dateComponents([.hour, .minute, .second], from: dateStart)
  //          let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
  //          let request = UNNotificationRequest(identifier:"washHands", content: content, trigger: trigger)
  //          UNUserNotificationCenter.current().add(request)
  //      } else {
  //          print("do nothing")
  //      }
  //  }
  
  
}
