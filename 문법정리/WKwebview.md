# **about wkwebView**

<img width="512" alt="스크린샷 2019-11-18 오후 6 42 21" src="https://user-images.githubusercontent.com/47776915/70496026-f7af8e80-1b51-11ea-976f-89a06bb04f26.png">



**WKUIDelegate:** JavaScript, 기타 플러그인 컨텐츠 이벤트를 캐치하여 동작, 웹페이지 기본 사용자 인터페이스 요소를 제공

**WKNavigationDelegate:** 프로토콜 페이지의 start, loading, finish, error의 트리거 이벤트를 캐치하여 사용자 정의 동작을 구현가능

**WKScriptMessageHeader:** 프로토콜 웹 페이지에서 실행되는 JavaScript Message를 수신하는 방법을 제공. 웹 페이지에서 스크립트 메세지가 수신될 때 호출되는 userContentController를 정의하고 있다.

**SSESID**

각 웹서버에 접속하는 세션마다 session id 가 발급이 된다.

session id 가 기존에 존재하는지 판단하고 존재하면 동일한 세션 접속이라고 인식하고

존재하지 않으면 session id를 재발급한다.









## 알자알자

쿠키 

https://taesulee.tistory.com/6

[WKWebView와 쿠키의 관계에 대하여](https://rhammer.tistory.com/357)

iOS11 이상 부터 WebSiteDataStore를 이용해 쿠키 넣는 방법

```swift
webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie) {
   // 쿠키 등록 완료 후 처리
} 
```

SESSID와 같이 웹에서 자동으로 생성되는 쿠키는 생성 후에 앱에서 변경이 불가능하다.

그래서 미리 API 네트워크 후 받아오는 SESSID를 웹 쿠키에 심어 줘야한다.

그리고 중간에 웹에서 쿠키가 변경되면 webView(_:decidePolicyFor:decisionHandler:) 에서 변경된 쿠키를 네트워크 쿠키에 넣어줘야한다

token

ajax

리다이렉션을

JavaScript

[42. (TWOK/UTIL) [Ios/Swift] A_CookieWebview - 쿠키 설정 및 웹뷰 로드 수행 실시 클래스](https://kkh0977.tistory.com/1822)

[SKY STORY :: 웹 저장 데이터 (Cookie, Cache) 삭제](https://netcanis.tistory.com/169)

#### 모든 쿠키 삭제

```swift
 let date = Date(timeIntervalSince1970: 0)

   HTTPCookieStorage.shared.removeCookies(since: date) //Date.distantPast)
   print("All cookies deleted")

   WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
     records.forEach { record in
       WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
       print("Cookie 🗑:: \(record) deleted")
      }
    }
```

#### 모든 캐시 삭제

```swift
  let date = Date(timeIntervalSince1970: 0)
  let cacheDataTypes: Set<String> = [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache]

  WKWebsiteDataStore.default().removeData(ofTypes: cacheDataTypes, modifiedSince: date) {
        print("Cache 🗑: deleted")
  }
```





Native -> JS call

```swift
 // native -> js call (문서 시작시에만 가능한, 환경설정으로 사용함), source부분에 함수 대신 HTML직접 삽입 가능
    let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
    contentController.addUserScript(userScript)
```

```swift
 webView.evaluateJavaScript("getLocal()", completionHandler: {(result, error) in
                if let result = result {
                    print(result)
                }
            })
```



 Js -> Native Call

```swift
// js -> native call : name의 값을 지정하여, js에서 webkit.messageHandlers.NAME.postMessage("");와 연동되는 것, userContentController함수에서 처리한다
contentController.add(self, name: "callbackHandler")

// 메모리 누수 방지 ⤵️
contentController.add(LeakAvoider(delegate: self),name: String.bridge(.changeGroupHandler))

extension ViewController: WKScriptMessageHandler {
  
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    print("** message.name : \(message.name)")
    
    switch message.name {
    case BridgeName.changeGroupHandler.rawValue:
      if message.body as! String == "close" {
        // something
      }
    }
  }    
}
```

앞서 선언한 WKUserContentController()클래스 변수에 add를 통해 해당 name값을 가진 webkit.messageHanlder를 통해 호출할 수 있다고 미리 명시하는 것이다. 그래서 위의 경우 webkit.messageHanlders.callbakHandler.postMessage("")를 웹에서 호출하면 네이티브를 호출할 수 있다.



message.body == ("")안에 들어있는 내용 */ body를 검사하여 네이티브 함수를 호출한다.





웹뷰 헤더 세팅



## 





[[SWIFT] 웹뷰와 자바스크립트 연동 (Native &lt;-&gt; JavaScript 통신 방법)](https://g-y-e-o-m.tistory.com/13)
