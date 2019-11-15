//
//  EmbedController.swift
//  FP_TABLE_GUIDE
//
//  Created by 고정아 on 2019/11/07.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class EmbedController {
  public var rootViewController : UIViewController?
  public var controllers = [UIViewController]()
  
  init(rootViewController:UIViewController) {
    self.rootViewController = rootViewController
  }
  
  func append(viewController:UIViewController) {
    if let rootViewController = self.rootViewController {
      controllers.append(viewController)
      rootViewController.addChild(viewController)
      rootViewController.view.addSubview(viewController.view)
    }
  }
  
  deinit {
    if self.rootViewController != nil {
      for controller in controllers {
        controller.view.removeFromSuperview()
        controller.removeFromParent()
      }
      
      controllers.removeAll()
      self.rootViewController = nil
    }
  }
}
