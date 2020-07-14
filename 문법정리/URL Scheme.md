##### 

### **URL Scheme** 



1. ##### Info.plist 에서 LSApplicationQueriesSchemes 등록하기![스크린샷 2019-12-27 오전 11 20 17](https://user-images.githubusercontent.com/47776915/71497358-27bd9800-289b-11ea-8243-1bbb62fc3434.png) 

2. ##### Source에서 URL Scheme 연결

~~~swift
func appOpen (schemes:String) { 
  if let appUrl = URL(string: "\(schemes)://") { 
    if UIApplication.shared.canOpenURL(appUrl) { 
      UIApplication.shared.open(appUrl, options: [:], completionHandler: nil) 
    } else { // app store 이동 openURLToAppStore(urlPath: name) 
    } 
  } 
}


  @objc func tappedFacebookButton(_ sender: UIButton) {
    print("페이스북 버튼")
    //iOS 9.0 이상 부터 화이트 리스트 등록 pList
    let facebookscheme = URL(string: "fb://")!
    print(UIApplication.shared.canOpenURL(facebookscheme))
    guard UIApplication.shared.canOpenURL(facebookscheme) else {return}
    UIApplication.shared.open(facebookscheme)
  }


//      사파리로 링크 열기
      if let url = URL(string: "https://www.instagram.com/lovelymarket_no.1/?hl=ko") {
                 UIApplication.shared.open(url, options: [:])
        }


~~~





#### http붙여서 url 열기

~~~swift
guard let userInfo = sender.userInfo as? [String: String],
      let homePage = userInfo["homePage"]
      else {
        return print("fail downCasting")
    }
    print("🏠", homePage)
    let validUrlString = homePage.hasPrefix("http") ? homePage : "http://\(homePage)"
      guard let url = URL(string: validUrlString),
        UIApplication.shared.canOpenURL(url) else { return }
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
~~~



