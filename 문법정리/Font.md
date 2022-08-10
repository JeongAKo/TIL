## Font

```swift
// 폰트 적용
extension UIFont {

  class func NanumRegular(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumSquareRoundOTFR", size: size)!
  }

  class func NanumLight(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumSquareRoundOTFL", size: size)!
  }

  class func NanumBold(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumSquareRoundOTFB", size: size)!
  }

  class func NanumExtraBold(size: CGFloat) -> UIFont {
    return UIFont(name: "NanumSquareRoundOTFEB", size: size)!
  }




enum NanumFont {
  case light
  case regular
  case bold
  case extraBold
}

extension UIFont {
  static func nanum(_ name: NanumFont) -> String {
    switch name {
    case .light: return "NanumSquareRoundOTFL"
    case .regular: return "NanumSquareRoundOTFR"
    case .bold: return "NanumSquareRoundOTFB"
    case .extraBold: return "NanumSquareRoundOTFEB"
    }
  }
}


  // dynamic Font에 커스텀폰트 적용시켜주기
extension UILabel {
  func nanumDynamicFont(fontSize size: CGFloat, weight: NanumFont) {
    let currentFontName = UIFont.nanum(weight)
    var calculatedFont: UIFont?
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height

    switch height {
    case 480.0: //Iphone 3,4S => 3.5 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.7)
      resizeNanumFont(calculatedFont: calculatedFont)
      break

    case 568.0: //iphone 5, SE => 4 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.8)
      resizeNanumFont(calculatedFont: calculatedFont)
      break

    case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.92)
      resizeNanumFont(calculatedFont: calculatedFont)
      break

    case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 0.95)
      resizeNanumFont(calculatedFont: calculatedFont)
      break

    case 812.0: //iphone X, XS => 5.8 inch
      calculatedFont = UIFont(name: currentFontName, size: size)
      resizeNanumFont(calculatedFont: calculatedFont)
      break

    case 896.0: //iphone XR => 6.1 inch  // iphone XS MAX => 6.5 inch
      calculatedFont = UIFont(name: currentFontName, size: size * 1) //1.2
      resizeNanumFont(calculatedFont: calculatedFont)
      break

    default:
      print("not an iPhone")
      break
    }
  }


  private func resizeNanumFont(calculatedFont: UIFont?) {
    self.font = calculatedFont
    self.font = UIFont(name: font!.fontName, size: font!.pointSize)
  }
}
```

### 시스템폰트 커스텀폰트로 세팅

```swift
import UIKit

struct AppFontName {
    static let regular = "CourierNewPSMT"
    static let bold = "CourierNewPS-BoldMT"
    static let italic = "CourierNewPS-ItalicMT"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    static var isOverrided: Bool = false

    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }

    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    class func overrideInitialize() {
        guard self == UIFont.self, !isOverrided else { return }

        // Avoid method swizzling run twice and revert to original initialize function
        isOverrided = true

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {
    // Avoid warning of Swift
    // Method 'initialize()' defines Objective-C class method 'initialize', which is not guaranteed to be invoked by Swift and will be disallowed in future versions
    override init() {
        super.init()
        UIFont.overrideInitialize()
    }
    ...
}
```

#### 폰트가 안먹거나 nil로 들어올때는 이름이 달라서 일 수 도 있다

```swift
print("--------- Available Font names ----------")

    for name in UIFont.familyNames {
          print(name)
          if let nameString = name as? String {
            print(UIFont.fontNames(forFamilyName: nameString))
          }
      }
```

위 코드로 사용 가능한 이름을 찾을 수 있다