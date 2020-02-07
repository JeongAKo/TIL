#### FP API



1. ##### config API adress

~~~swift
// 예시
class Api: NSObject { 
 let REQUEST_BANNER_GET = 301
  let URL_BANNER_GET = "/api/banner/main/get"
}
~~~



2. 

~~~swift
class fleapopApi: Api {
  
  func requestApi(REQUEST_CODE:Int, params:Dictionary<String, Any>) {
    
    self.REQUEST_CODE = REQUEST_CODE
    
    switch REQUEST_CODE {
    case self.REQUEST_MODE :
      print("REQUEST_MODE")
      
    case self.REQUEST_CHK_EX_ACCOUNT:
      print("REQUEST_CHK_EX_ACCOUNT")
      self.requestDuplicateAccount(params: params)
      break
      
      default:
      print("Request code is wrong")
      
    }
    
    
  func requestDuplicateAccount(params:Dictionary<String, Any>) {
    var url = ""
    if(isTest) {
      url = HOST_TEST+self.URL_CHK_EX_ACCOUNT
    } else {
      url = HOST+self.URL_CHK_EX_ACCOUNT
    }
    
    print("Request Duplicate Account URL : "+url)
    print("Request Duplicate Account Params : ")
    print(params)
    
    struct Data: Encodable {
      let device: Int
      let account_type: Int
      let account: String
    }
    
    let data = Data(device: params["device"] as! Int, account_type: params["accountType"] as! Int, account: params["account"] as! String)
    
    AF.request(url, method: .post, parameters: data, encoder: JSONParameterEncoder.default).response { response in
      var result:[String:Any] = ["success":true]
      
      let responseJson = JSON(response.data ?? false)
      if(isLogApi) {
        print("Request Duplicate Account : ")
        print(responseJson)
      }
      
      if(responseJson != 0) {
        
        do {
          let jsonDecode = JSONDecoder()
          let success = responseJson["success"].intValue
          
          if(success == 1) {
            result["success"] = true
            result["msg"] = responseJson["msg"].stringValue
            result["code"] = responseJson["code"].intValue
            
          } else {
            result["success"] = false
            
            result["msg"] = responseJson["msg"].stringValue
          }
          
        } catch {
          result["success"] = false
          result["msg"] = "처리중 문제가 발생했습니다. \(self.REQUEST_CODE)"
        }
        
      } else {
        result["success"] = false
        result["msg"] = "응답 결과가 올바르지 않습니다. \(self.REQUEST_CODE)"
      }
      
      self.apiDelegate?.responseApi(REQUEST_CODE: self.REQUEST_CODE, result: result)
     }
   }
 }
~~~







호출할 VC에서

~~~swift
class HomeController: CommVC, ApiDelegate {
  private var fleapopApi: FleapopApi! = nil
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
      fleapopApi = FleapopApi(apiDelegate: self)
       self.requestContentList() //처음 키자마자 해줄꺼면
    }
    
    
    //API
    //request
     func requestContentList() {
    print("requestContentList")
    print("params", params)
    
    //    Api 호출
    let params:[String: Any] = ["device": 102, //DEVICE,
      "max": 24,
      "page": 1,
      "type": "magazine",
      "sort": "all",
      "user_id": 86723,
      "token": "65fbcda7d2e68440340faf6cd40be40a6da117c7ce5d78b2654679cf7e43f06f",
      "keyword": ""
    ]
    
    fleapopApi.requestApi(REQUEST_CODE: fleapopApi.REQUEST_CONTENT_LIST, params: params)
    
  }
  
  
  // reponse
  func responseApi(REQUEST_CODE: Int, result: [String : Any]) {
    print("func responseApi : \(REQUEST_CODE)")
    print(result)
    let success: Bool = result["success"] as! Bool
    
    if(success) {
      print("SUCCESS")
      switch(REQUEST_CODE) {
      case self.fleapopApi.REQUEST_CONTENT_LIST :
        print("REQUEST_CONTENT_LIST 성공!!")
        
        self.keywordArr = result["keywordArr"] as! [String]
        self.contentArr = result["contentArr"] as! [ContentData]
        self.contentCount = result["contentCount"] as! Int
        
        self.tableView.reloadData()
         
      default:
        break
      }
    } else {
      print("ERROR_RESPONSE")
      print("MSG : \(result["msg"] as! String)")
    }
  }
}
~~~







~~~swift
  var arrDatas:[BannerData] = []
//            for i in 0..<dataCount {
//              let item = responseJson["data"][i]//["is_enable"]
//              let bannerData = try jsonDecode.decode(BannerData.self, from: item.rawData())
//              arrDatas.append(bannerData)
//            }
//          
//            result["arrDatas"] = arrDatas
~~~











