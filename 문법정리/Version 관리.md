### Version관리

##### 버전체크

```swift
var systemVersion = UIDevice.current.systemVersion
```



base SDK : 라이브러리, 프레임워크 기반을 의미. maximum 버전으로 생각하면 됨.
Deployment target : 어느 버전까지 지원가능한지 버전. minimum 버전 으로 생각하면 됨.



### [iOS 앱 업데이트 (강제 업데이트, 선택 업데이트) 기능](http://monibu1548.github.io/2018/05/19/remote-config-forced-update/)







#### 업데이트 전에 체크 할 사항!!

isTest인지 아닌지

Appdelegate랑 SceneDelegate 체크

앱 내부 컨턴츠에서 `구글 스토어` 관련 컨텐츠가 있으면 리젝

탭바 옮겨갈때 잘 연결 되었는지



#### 버전업데이트시

앱스토어로 내보내기



<img width="763" alt="스크린샷 2020-01-10 오후 1 43 29" src="https://user-images.githubusercontent.com/47776915/72126404-4ea5bf00-33af-11ea-8619-223a3601bfff.png">







![스크린샷 2020-01-10 오후 1 35 44](https://user-images.githubusercontent.com/47776915/72126296-f8388080-33ae-11ea-8cfc-0534fca87526.png)





## 버전체크

~~~swift
    // 현재 나의 앱 버전체크
  let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    if let version = version {
      print("🏓version: \(version)")
    }

    // 앱스토어에 있는 버전 확인
  https://itunes.apple.com/kr/lookup?id=fp.FleapopProject
                           ↑ 한국에서만 서비스 하는 앱이기 때문에 없으면 나오질 않는다.

~~~





~~~swift
    // AppDelegate
    // 앱스토어에 있는 버전 확인
    // https://itunes.apple.com/kr/lookup?id=fp.FleapopProject
    
å       _ = try? AppStoreCheck.isUpdateAvailable { (update, error) in
         if let error = error {
           print(error)
         } else if let update = update {
           if update {
              //alert 띄워주기 //버전이 낮아 앱을 실행할 수 없습니다.\n최신 버전으로 업데이트 하시겠습니까?
   
             self.appUpdate()
             return
         }
       }
     }
    
  
  
  
  // 앱스토어로 이동
  func appUpdate() {
  
    // id뒤에 값은 앱정보에 Apple ID에 써있는 숫자
    if let url = URL(string: "itms-apps://itunes.apple.com/app/id1490834428"), UIApplication.shared.canOpenURL(url) {
  
      print("🟣 앱스토어로 이동")
  
      if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      } else {
  
        UIApplication.shared.openURL(url)
      }
    }
  }
}
~~~



~~~swift

enum VersionError: Error {

  case invalidResponse, invalidBundleInfo

}

class AppStoreCheck {
  
  public static let shared = AppStoreCheck()

  func isUpdateAvailable(callback: @escaping (Bool)->Void) {
    
    var url = ""
    
    if(isTest) {
      url = HOST_TEST+"/api/app/version/get"
    } else {
      url = HOST+"/api/app/version/get"
    }
    debugPrint("Version Url : \(url)")
    struct Data: Encodable {
      let device: Int
      let version_int: Float
    }
    
    let data = Data(device: DEVICE, version_int: 0)
    AF.request(url, method: .post, parameters: data, encoder: JSONParameterEncoder.default).response { response in
      var result:[String:Any] = ["success":true]
      
      let responseJson = JSON(response.data ?? 0)
      if(isLogApi) {
        print("Response Login : ")
        
      }
      debugPrint(responseJson)
      if(responseJson != 0) {
        
        let success = responseJson["success"].intValue
        
        if(success == 1) {
          result["success"] = true
          result["version"] = responseJson["data"].stringValue
        } else {
          result["success"] = false
          result["msg"] = responseJson["msg"].stringValue
        }
      } else {
        result["success"] = false
        result["msg"] = "응답 결과가 올바르지 않습니다."
      }
      debugPrint("VerSeion Api")
      debugPrint(result)
      
      let success = result["success"] as! Bool
      if(success) {
        var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        appVersion = appVersion?.replacingOccurrences(of: ".", with: "")
        let appVersionInt = Int(appVersion ?? "0")
        
        
        var version = result["version"] as! String
        version = version.replacingOccurrences(of: ".", with: "")
        let versionInt = Int(version)
        
        debugPrint("appVersionInt : \(appVersionInt ?? 0), \(versionInt ?? 0)")
        if (appVersionInt ?? 0) < (versionInt ?? 0) {
          callback(false)
        } else {
          callback(true)
        }

      } else {
        callback(true)
      }
    }
  }
}
~~~





## 키체인 발급

<img width="728" alt="스크린샷 2020-07-14 오후 5 57 38" src="https://user-images.githubusercontent.com/47776915/87406981-7d218280-c5fc-11ea-87e4-0495187c3496.png">
![스크린샷 2020-07-14 오후 5 58 07](https://user-images.githubusercontent.com/47776915/87407045-91657f80-c5fc-11ea-9023-6baabd826af0.png)







## 앱스토어에서 업데이트가 안뜰시

캐싱처리된거일꺼라 앱스토어에 우측상단 계정을 눌러서 새로고침하면 OK!