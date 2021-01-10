//
//  StyleGuide.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/09.
//

import UIKit

enum AssetsColor {
  case primaryGreen
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .primaryGreen: return #colorLiteral(red: 0.3215686275, green: 0.7137254902, blue: 0.4117647059, alpha: 1)
    }
  }
}
