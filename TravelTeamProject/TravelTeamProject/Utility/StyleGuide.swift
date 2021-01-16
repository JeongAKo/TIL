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
  case gray70
  case gray784
  case gray454
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .primaryGreen: return #colorLiteral(red: 0.3215686275, green: 0.7137254902, blue: 0.4117647059, alpha: 1)
    case .red: return #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
    case .gray70: return #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
    case .gray784: return #colorLiteral(red: 0.4705882353, green: 0.5176470588, blue: 0.6196078431, alpha: 1)
    case .gray454: return #colorLiteral(red: 0.2705882353, green: 0.3098039216, blue: 0.3882352941, alpha: 1)
    }
  }
}




extension NSAttributedString {
  class func settingWhitePlaceholder (text: String) -> NSAttributedString {
    
    let placeholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,   NSAttributedString.Key.font : UIFont.NanumSquareRegular(size: 20)]) 
    return placeholder
  }
  
  class func settingRedPlaceholder(text: String) -> NSAttributedString {
    let placeholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red,   NSAttributedString.Key.font : UIFont.NanumSquareRegular(size: 20)])
    return placeholder
  }
}
