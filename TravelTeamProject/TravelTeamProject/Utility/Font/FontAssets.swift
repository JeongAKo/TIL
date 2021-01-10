//
//  FontAssets.swift
//  TravelTeamProject
//
//  Created by Daisy on 2021/01/09.
//

import UIKit

// 폰트 적용
enum CustomFontStyle {
  case gothic
  case squareR
  case squareB
}

extension UIFont {
  
  class func NanumGothic(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumGothic", size: size)!
  }
  
  class func NanumSquareRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumSquareOTFR", size: size)!
  }
  
  
  class func NanumSquareBold(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumSquareOTFB", size: size)!
  }
  
  
  static func customFont(_ name: CustomFontStyle) -> String {
    switch name {
    case .gothic: return "NanumGothic"
    case .squareR: return "NanumSquareOTFR"
    case .squareB: return "NanumSquareOTFB"
    }
  }
}



extension UILabel {
  func NGothic(fontSize size: CGFloat) {
//    self.font = UIFont.NanumGothic(size: size) // error?
    self.font = UIFont(name: "NanumGothic", size: size)
  }
  
  
  func NSquareR(fontSize size: CGFloat) {
    self.font = UIFont(name: "NanumSquareOTFR", size: size)
  }
  
  
  func NSquareB(fontSize size: CGFloat) {
    self.font = UIFont(name: "NanumSquareOTFB", size: size)
  }
}
