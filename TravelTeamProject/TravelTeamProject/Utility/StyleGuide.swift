//
//  StyleGuide.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/09.
//

import UIKit

enum AssetsColor {
  case primaryGreen
  case red
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .primaryGreen: return #colorLiteral(red: 0.3215686275, green: 0.7137254902, blue: 0.4117647059, alpha: 1)
    case .red: return #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
    }
  }
}




extension NSAttributedString {
  class func settingPlaceholder (text: String) -> NSAttributedString {
    
    let placeholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,   NSAttributedString.Key.font : UIFont.NanumSquareRegular(size: 20)]) 
    return placeholder
  }
}
