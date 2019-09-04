//
//  ViewController.swift
//  StopWatch
//
//  Created by Daisy on 04/09/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
  @IBOutlet var timerLabel: UILabel!
  
  @IBOutlet var startStopButton: UIButton!
  
  var timer: Timer?
  var isStarted = false
  var counter = 0.0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @objc func updateTimerLabel() {
    counter += 0.1
    timerLabel.text = String(round(counter*10)/10)  //소수점 제거
  }
  
  @IBAction func startStopDidTouch(_ sender: Any) {
    if isStarted {
      timer?.invalidate()
      isStarted = false
      startStopButton.setTitle("Start", for: .normal)
    } else {
      timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
      isStarted = true
      startStopButton.setTitle("Stop", for: .normal)
    }
  }
  
  @IBAction func resetDidTouch(_ sender: Any) {
    
    counter = 0.0
    timerLabel.text = "0.0"
    
    if isStarted {
      timer?.invalidate()
      startStopButton.setTitle("Start", for: .normal)
      isStarted = false
    }
  }
}

