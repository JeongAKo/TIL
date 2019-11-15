//
//  ViewController.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var sg_menu: UISegmentedControl!
  

    var btn:CustomButton!
  
  @IBOutlet weak var view_containerr: UIView!
  let vc1:UIViewController = OneViewController()
  let vc2:UIViewController = TwoViewController()
  let vc3:UIViewController = ThreeViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.btn = CustomButton()
    btn.frame = CGRect(x: self.view.frame.size.width-100, y: 20, width: 100, height: 30)
    btn.myLabel.myStyle()
    btn.setMyButton()
    self.view.addSubview(btn)
   
//
    vc1.willMove(toParent: self)
    vc1.view.frame = view_containerr.bounds
    self.view_containerr.addSubview(vc1.view)
    self.addChild(vc1)
    vc1.didMove(toParent: self)
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func menuSegAction(_ sender: UISegmentedControl) {
    switch(sender.selectedSegmentIndex) {
    case 0 :
      print("1 Segment Select")
      vc1.willMove(toParent: self)
      vc1.view.frame = view_containerr.bounds
      self.view_containerr.addSubview(vc1.view)
      self.addChild(vc1)
      vc1.didMove(toParent: self)
      break
    case 1 :
      print("2 Segment Select")
      vc2.willMove(toParent: self)
      vc2.view.frame = view_containerr.bounds
      self.view_containerr.addSubview(vc2.view)
      self.addChild(vc2)
      vc2.didMove(toParent: self)
      break
    case 2 :
      print("3 Segment Select")
      vc3.willMove(toParent: self)
      vc3.view.frame = view_containerr.bounds
      self.view_containerr.addSubview(vc3.view)
      self.addChild(vc3)
      vc3.didMove(toParent: self)
      break
    default :
      print("Default Segment Select")
      break
    }
    
  }
  
}

