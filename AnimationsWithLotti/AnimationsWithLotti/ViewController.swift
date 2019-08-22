//
//  ViewController.swift
//  AnimationsWithLotti
//
//  Created by Daisy on 22/08/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
  
  
  @IBOutlet var animationView: AnimationView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startAnimation()
  }
  
  private func startAnimation() {
    
    let starAnimation = Animation.named("8720-hi-wink")
    animationView.animation = starAnimation
    animationView.loopMode = .autoReverse
    animationView.play()
    
  }
  
}

