//
//  File.swift
//  StoreRenewal
//
//  Created by 고정아 on 2020/07/30.
//  Copyright © 2020 고정아. All rights reserved.
//

import UIKit


internal func hideNaviBarWhenUserDidScroll(to direction: String, with naviVC: UINavigationController?, where whereIs: String) {
  switch direction {
  case "up":
    naviVC?.setNavigationBarHidden(false, animated: true)
  case "down":
    naviVC?.setNavigationBarHidden(true, animated: true)
  default:
    break
  }
}
