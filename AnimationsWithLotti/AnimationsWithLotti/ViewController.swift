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
  
  let animationView = AnimationView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(animationView)
    startAnimation()
    setAutoLayout()
  }
  
  private func startAnimation() {
    let starAnimation = Animation.named("8720-hi-wink")
    animationView.animation = starAnimation
    animationView.loopMode = .autoReverse
    animationView.play()
    
  }
  
  fileprivate func setAutoLayout() {
    animationView.translatesAutoresizingMaskIntoConstraints = false
    animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    animationView.widthAnchor.constraint(equalToConstant: 300)
    animationView.heightAnchor.constraint(equalToConstant: 300)
  }
  
}

