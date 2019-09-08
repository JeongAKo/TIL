//
//  ViewController.swift
//  StopWatch_Intermediate
//
//  Created by Daisy on 08/09/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var timer = Timer()
  var (hours, minutes, seconds, fractions) = (0, 0, 0, 0 )
  
  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var fractionsLabel: UILabel!
  @IBOutlet var startOutlet: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  @IBAction func startButton(_ sender: Any) {
    timer = Timer.scheduledTimer(timeInterval: 0.01, target:  self , selector: #selector(ViewController.keepTimer), userInfo: nil, repeats: true)
    startOutlet.isHidden = true
  }
  
  @IBAction func pauseButton(_ sender: Any) {
    startOutlet.isHidden = false
    timer.invalidate()
  }
  
  @IBAction func stopButton(_ sender: Any) {
    timer.invalidate()
    (hours, minutes, seconds, fractions) = (0, 0, 0, 0 )
    timeLabel.text = "00:00:00"
    fractionsLabel.text = ".00"
    startOutlet.isHidden = false
  }
  
  @objc private func keepTimer() {
    
    fractions += 1
    
    if fractions > 99 {
      seconds += 1
      fractions = 0
      
    }
    if seconds == 60 {
      minutes += 1
      seconds = 0
    }
    
    if minutes == 60 {
      hours += 1
      minutes = 0
    }
    
    let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
    let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
    let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
    
    timeLabel.text =  "\(hoursString):\(minutesString):\(secondsString)"
    fractionsLabel.text = ".\(fractions)"
    
  }
}


