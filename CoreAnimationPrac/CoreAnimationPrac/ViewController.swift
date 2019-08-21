//
//  ViewController.swift
//  CoreAnimationPrac
//
//  Created by Daisy on 21/08/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let titleLabel = UILabel()
  let bodyLabel = UILabel()
  
  fileprivate func setupLabels() {
    titleLabel.numberOfLines = 0
    titleLabel.text = "Welcome To Daisy Company"
    titleLabel.font = UIFont(name: "Futura", size: 35)
    
    bodyLabel.numberOfLines = 0
    bodyLabel.text = "Hello there! Thanks so much for downloading our brand new app and giving us a try. Make sure to leave us a good review in the AppStore."
  }
  
  fileprivate func setupStackView() {
    let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
    stackView.axis = .vertical
    stackView.spacing = 8
    view.addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setupLabels()
    setupStackView()
    
    //Animations
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimaions)))
  
  }
  
  @objc func handleTapAnimaions() {
    
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:  0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
      self.titleLabel.transform =  CGAffineTransform(translationX: -30, y: 0 )
      
    }) { (_) in
      UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        self.titleLabel.alpha = 0
        self.titleLabel.transform =  self.titleLabel.transform.translatedBy(x: 0, y: -200)
      })
    }
    
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:  0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
      self.bodyLabel.transform =  CGAffineTransform(translationX: -30, y: 0 )
      
    }) { (_) in
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        self.bodyLabel.alpha = 0
        self.bodyLabel.transform =  self.titleLabel.transform.translatedBy(x: 0, y: -200)
      })
    }
 
    
    
  }
  
}

