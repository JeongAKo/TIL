# alamofire

```swift
func alarmList(page:Int,success: @escaping(_ data: AlarmModel)-> Void, fail: @escaping (_ error: Error?)-> Void) {


      let testRequest = AF.request("\(apiUrl)/notify/\(page)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header)

      testRequest.responseJSON { response in


        debugPrint(response)
        print("😀 < \(response) > \("\(apiUrl)/notify/\(page)") 💎")

        switch response.result {

        case .success(let value):
          print("이건 value 자체 : \(value)")
          do {
            let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)

            let getInstanceData = try JSONDecoder().decode(DecodeAlarmModel.self, from: data)

            print("😀😀\(getInstanceData)😀😀")

          } catch {
            print("catch😡")
          }


        case .failure(_):
          print("failure😡")
        }
      }
```
